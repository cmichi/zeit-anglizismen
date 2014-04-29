# Visualizing angliciscm usage in _Die Zeit_ over time

**Project Status:** WIP! Not finished. Did a quick hack of this
idea about 11 months ago, but never got around to properly finish
it. Gonna do this now.

The idea of this project is to visualize the distribution of
anglicism use in the magazine [Die Zeit](http://www.zeit.de) over 
the years.

The list of anglicisms is taken from the Wikitionary project:
http://de.wiktionary.org/wiki/Verzeichnis:Deutsch/Anglizismen

At the moment (April 2014) there are 994 anglicisms in this list.


## Documentation

	$ echo "yourapikey" > api_key

	# test if access to the API works:
	$ curl -H "X-Authorization: `cat api_key`" http://api.zeit.de/content?q=&facet_date=1year | less

	# install necessary dependencies -- node.js, npm and those libs:
	$ npm install xpath
	$ npm install xmldom

	$ make fromwiki
	# results in ./data/anglizismen.txt

	$ make requestapi
	# results in requesting http://api.zeit.de/content?q=WORD&facet_date=1year 
	# for each anglicism in ./data/anglizismen.txt

	$ make normalize
	# results in requesting http://api.zeit.de/content?face_date=1year 
	# for 1945-2013. a file ./tmp_normalize/all_years.asc will be
	# created

	$ make processtmp



# License

### Visualization (CC-BY 4.0)

	The visualization is licensed under the Creative Commons Attribution
	4.0 International license: http://creativecommons.org/licenses/by/4.0/.

### Code (MIT)

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
