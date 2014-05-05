#!/bin/sh

for i in $(ls ./tmp/); do
	node processtmpWord.js $i > ./wordStatistic/$i.tsv;
done;

