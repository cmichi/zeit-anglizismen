#!/bin/sh
export api_key=`cat api_key`

i=0
while read l; do
	lp=`echo ${l} | sed 's/\s/%20/g' | tr '[:upper:]' '[:lower:]'`

	uri="http://api.zeit.de/content?q=${lp}&facet_date=1year"
	echo $uri
	echo $i
	echo $lp
	i=$((i+1))

	filen=`echo ${l} | sed 's/\s/_/g' | tr '[:upper:]' '[:lower:]'`
	echo "saving to " $filen

	curl -s -H "X-Authorization: ${api_key}" $uri > ./tmp/$filen
	echo " "
done < ./data/anglizismen.txt
