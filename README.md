# Anglicisms in DIE ZEIT and ZEIT ONLINE

The idea of this project is to visualize the distribution of
anglicism use in the german weekly newspage[Die Zeit](http://www.zeit.de) 
and [ZEIT ONLINE](http://www.zeit.de) over the years.

The [list of anglicisms](http://de.wiktionary.org/wiki/Verzeichnis:Deutsch/Anglizismen)
is taken from the Wiktionary project. At the moment (April 2014) there 
are around 960 anglicisms in this list.


## Documentation

This is mainly meant as a documentation of the process.

	$ echo "yourapikey" > api_key

	# test if access to the API works:
	$ curl -H "X-Authorization: `cat api_key`" \
		http://api.zeit.de/content?q=&facet_date=1year | less

	# install necessary dependencies -- node.js, npm and those libs:
	$ npm install xpath
	$ npm install xmldom

	$ make fromwiki
	# results in ./data/anglizismen.txt -- be sure to manually look 
	# through the list! there will definitely be duplicate entries 
	# due to wiki inconsistencies.

	$ make requestapi
	# results in requesting http://api.zeit.de/content?q=WORD&facet_date=1year 
	# for each anglicism in ./data/anglizismen.txt.

	$ make normalize
	# results in requesting http://api.zeit.de/content?face_date=1year 
	# for 1945-2013. a file ./tmp_normalize/all_years.asc will be
	# created.

	$ make processtmp
	# results in ./tmp_normalize/anglicisms.tsv, a tsv
	# which contains the total number of articles available in
	# each year.

	$ node outputAll.js > ./tmp_normalize/all.json

	$ make wordStatistic
	# results in ./wordStatistic/$anglicism.tsv for each anglicism.

	$ python -mSimpleHTTPServer
	# open http://localhost:8000/?word=greenpeace&selector=1 in your browser.


# License (MIT)

	Copyright (c) 2014

		Michael Mueller <http://micha.elmueller.net/>

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
	OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
	WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
