
class Gen_Meta 

            class_template = File.open("/Users/jdietz/tech/Dragon-B/META/CLASS", "r")
            class_template_contents = class_template.sysread(class_template.stat.size)
            resource_template = File.open("/Users/jdietz/tech/Dragon-B/META/RESOURCE", "r")
            resource_template_contents = resource_template.sysread(resource_template.stat.size)
            component_template = File.open("/Users/jdietz/tech/Dragon-B/META/COMPONENT", "r")
            component_template_contents = component_template.sysread(component_template.stat.size)
            page_template = File.open("/Users/jdietz/tech/Dragon-B/META/PAGE", "r")
            page_template_contents = page_template.sysread(page_template.stat.size)

            puts "Iterating through all "  + Dir["src/classes/*.cls"].size.to_s + " classes"
            counter = 0
            
            Dir["src/classes/*.cls"].each do |file|
              meta = "#{file}-meta.xml"
              next if file =~ /-meta\.xml$/ || File.exist?(meta)
                  counter += 1
                  puts meta + " does not exist, attempting to create"
                  File.open(meta, 'w') do |f|
                    f.puts(class_template_contents)
                  end
            end

            puts "Iterating through all "  + Dir["src/staticresources/*.resource"].size.to_s + " resources"

            Dir["src/staticresources/*.resource"].each do |file|
              meta = "#{file}-meta.xml"
              next if file =~ /-meta\.xml$/ || File.exist?(meta)
                  counter += 1
                  puts meta + " does not exist, attempting to create"
                  File.open(meta, 'w') do |f|
                    f.puts(resource_template_contents)
                  end
            end

            puts "Iterating through all "  + Dir["src/components/*.component"].size.to_s + " components"

            Dir["src/components/*.component"].each do |file|
              meta = "#{file}-meta.xml"
              next if file =~ /-meta\.xml$/ || File.exist?(meta)
                  counter += 1
                  puts meta + " does not exist, attempting to create"
                  File.open(meta, 'w') do |f|
                    f.puts(component_template_contents)
                  end
            end

            puts "Iterating through all "  + Dir["src/pages/*.page"].size.to_s + " pages"

            Dir["src/pages/*.page"].each do |file|
              meta = "#{file}-meta.xml"
              next if file =~ /-meta\.xml$/ || File.exist?(meta)
                  counter += 1
                  puts meta + " does not exist, attempting to create"
                  File.open(meta, 'w') do |f|
                    f.puts(page_template_contents)
                  end
            end

            if counter==0 
               puts "No files found without metadata."
            else
               puts "Metadata added for " + counter.to_s + " files"
            end
          

      

end