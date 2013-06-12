default: fromwiki

fromwiki:
	mkdir ./data/
	curl "http://de.wiktionary.org/wiki/Wiktionary:Deutsch/Liste_der_Anglizismen" > ./data/anglizismen.html
	node xpath.js > ./data/anglizismen.txt
	echo "You have to manually cut of the lines at the beginning/ending of the anglizismen.txt!"

requestapi:
	mkdir ./tmp/
	/bin/sh ./zeit.sh
