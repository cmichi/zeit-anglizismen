default: fromwiki

clean:
	rm ./data/*
	rm ./tmp/*
	rm ./tmp_normalize/*

	rm -r ./data/
	rm -r ./tmp/
	rm -r ./tmp_normalize/

fromwiki:
	mkdir -p ./data/
	curl "http://de.wiktionary.org/wiki/Verzeichnis:Deutsch/Anglizismen" > ./data/anglizismen.html
	node xpath.js > ./data/anglizismen.txt
	echo "You have to manually cut of the lines at the beginning/ending of the anglizismen.txt!"

requestapi:
	mkdir -p ./tmp/
	/bin/sh ./zeit.sh

normalize:
	mkdir -p ./tmp_normalize/
	/bin/sh ./normalize.sh

processtmp:
	node processtmp.js
