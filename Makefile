default: fromwiki

fromwiki:
	curl "http://de.wiktionary.org/wiki/Wiktionary:Deutsch/Liste_der_Anglizismen" > ./data/anglizismen.html
	node xpath.js > ./data/anglizismen.txt

requestapi:
	/bin/sh ./zeit.sh
