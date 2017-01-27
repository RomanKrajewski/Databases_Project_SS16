// ==UserScript==
// @name         Wikipedia list stuff
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  
// @author       Nils Gawlik
// @match        https://de.wikipedia.org/wiki/Alphabetische_Liste_der_Spiele
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
    
    var string = "";
    var count = 0;
    
    var root = document.getElementById("mw-content-text");
    var uls = [].slice.call(root.getElementsByTagName("ul"));
    
    for(var i = 0; i < uls.length; i++)
    {
        var lis = [].slice.call(uls[i].getElementsByTagName("li"));
        for(var j = 0; j < lis.length; j++)
        {
            var name = lis[j].getElementsByTagName("a")[0].firstChild.data;
            string += name + "\n";
            count++;
        }
    }
    
    console.log(string);
    console.log(count);
})();