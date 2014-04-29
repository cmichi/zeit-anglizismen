default: fromwiki

clean:
	rm ./data/*
	rm ./tmp/*
	rm -r ./data/
	rm -r ./tmp/

fromwiki:
	mkdir ./data/
	curl "http://de.wiktionary.org/wiki/Verzeichnis:Deutsch/Anglizismen" > ./data/anglizismen.html
	node xpath.js > ./data/anglizismen.txt
	echo "You have to manually cut of the lines at the beginning/ending of the anglizismen.txt!"

requestapi:
	mkdir ./tmp/
	/bin/sh ./zeit.sh
