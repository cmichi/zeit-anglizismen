#!/bin/sh
export api_key=`cat api_key`

i=0
while read l; do
	lp=`echo ${l} | sed 's/\s/%20/g'`

	uri="http://api.zeit.de/content?q=${lp}&facet_date=1year"
	echo $uri
	echo $i
	echo $lp
	i=$((i+1))
	curl -H "X-Authorization: ${api_key}" $uri > ./tmp/$l
done < _foo
#done < anglizismen.txt
