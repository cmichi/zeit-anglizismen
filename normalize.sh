#!/bin/sh
export api_key=`cat api_key`

uri="http://api.zeit.de/content?facet_date=1year"
echo $uri
curl -H "X-Authorization: ${api_key}" $uri > ./tmp_normalize/all_years.json

node normalize.js | sort > ./tmp_normalize/all_years.tsv
