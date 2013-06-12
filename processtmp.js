var fs = require("fs");

var files = fs.readdirSync("./tmp/");
console.log("found " + files.length + " files")

var dates = {};

for (var f in files) {
	var filename = "./tmp/" + files[f];
	console.log(filename)
	var data = fs.readFileSync(filename, {encoding: "utf8"});
	data = JSON.parse(data);
	//console.log(data.facets.release_date);

	for (var i in data.facets.release_date) {
		if (i === "start" || i === "end" || i === "gap")
			continue;

		var date = new Date(i);
		if (dates[date.getFullYear()] == undefined)
			dates[date.getFullYear()] = 0;
			
		dates[date.getFullYear()] += data.facets.release_date[i];
		//console.log(date.getFullYear() + "\t" + data.facets.release_date[i])
	}
	break;
}

for (var d in dates) {
	console.log(d + "\t" + dates[d]);
}
