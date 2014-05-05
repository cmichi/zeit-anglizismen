var fs = require('fs');

var data = fs.readFileSync('./tmp_normalize/all_years.json', 'utf-8');
data = JSON.parse(data);

var dates = data.facets.release_date;

//console.log(JSON.stringify(dates, null, "\t"));

var all = {};
for (var d in dates) {
	if (d === "gap" || d === "end" || d === "start") continue;

	var this_d = new Date(d).getFullYear();
	all[this_d] = dates[d];
	//console.log(this_d + "\t" + dates[d]);
}

console.log( JSON.stringify(all, null, "\t") );
