const DOMNodeCollection = require("./dom_node_collection.js");


window.$1 = function(arg){
    console.log('Why hello there')
    const nodes = document.querySelectorAll(arg);
    const nodesArray = Array.from(nodes);
    new DOMNodeCollection(nodesArray);
}