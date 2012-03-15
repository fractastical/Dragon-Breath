DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while read p    
do    
	echo -n "Exporting to "
	echo $p
	cp -apRf $DIR/src/classes/* $p/src/classes
	cp -apRf $DIR/src/staticresources/* $p/src/staticresources
	cp -apRf $DIR/src/pages/* $p/src/pages
	cp -apRf $DIR/src/components/* $p/src/components

done <PROJECTPATHS
