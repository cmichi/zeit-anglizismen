var xpath = require('xpath')
    , dom = require('xmldom').DOMParser
    , fs = require('fs');

var xml = fs.readFileSync("./data/anglizismen.html", "utf8");
var doc = new dom().parseFromString(xml);
var nodes = xpath.select("//a/text()", doc);

console.log(nodes.join("\n"));
