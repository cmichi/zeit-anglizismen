var xpath = require('xpath')
, dom = require('xmldom').DOMParser
, fs = require('fs')

var xml = fs.readFileSync("./anglizismen.html", "utf8");
var doc = new dom().parseFromString(xml)    
var nodes = xpath.select("//a/text()", doc)

//console.log(nodes[0].localName + ": " + nodes[0].firstChild.data)
//console.log("node: " + nodes[0].toString())

console.log(nodes.join("\n"))
