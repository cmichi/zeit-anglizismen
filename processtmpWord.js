var fs = require("fs");

var dates = {};

var filename = "./tmp/" + process.argv[2];
//console.log(filename)

var data = fs.readFileSync(filename, {encoding: "utf8"});
data = JSON.parse(data);

var all= fs.readFileSync('./tmp_normalize/all.json', {encoding: "utf8"});
all = JSON.parse(all);

for (var i in data.facets.release_date) {
	if (i === "start" || i === "end" || i === "gap")
		continue;

	var date = new Date(i);
	if (dates[date.getFullYear()] == undefined)
		dates[date.getFullYear()] = 0;
		
	dates[date.getFullYear()] += data.facets.release_date[i];
	//console.log(date.getFullYear() + "\t" + data.facets.release_date[i])
}

console.log("year" + "\t" + "portion" + "\t" + "word_count" + "\t" + "total_count");

for (var d in all) {
	//console.log(d + "\t" + dates[d]);
	if (! dates[d]) dates[d] = 0;

	var portion = dates[d] / all[d];
	console.log(d + "\t" + portion +  "\t" + dates[d] + "\t" + all[d]);
}
