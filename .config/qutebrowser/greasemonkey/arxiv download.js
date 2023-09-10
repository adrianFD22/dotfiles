// ==UserScript==
// @name        arxiv download
// @description Change page background to white.
// @version     0.1
// @author      aguachumein
// @include     *
// ==/UserScript==

var dow = function() {
    'use strict';
    // find the title
    var title = document.getElementsByClassName("title mathjax")[0].innerText;

    // find the authors
    var authors = document.getElementsByClassName("authors")[0].innerText;

    //find where to put the tag
    var loc = document.getElementsByClassName("full-text")[0].getElementsByTagName('ul');
    var obj = document.createElement("li");

    //get the pdf url
    var url = loc[0].getElementsByTagName('li')[0].getElementsByTagName('a')[0].href;

    let pdfurl = url;
    if (!pdfurl.endsWith(".pdf")) {
        pdfurl = url + '.pdf';
    }

    var fileName = authors.toString() + ' - ' + title.toString() + '.pdf';
    obj.innerHTML = '<a download='+ '"'+ fileName + '"' + ' href=' + pdfurl +'>Renamed PDF</a>';
    //loc.insertBefore(obj, loc.childNodes[0]);
    loc[0].insertBefore(obj, loc[0].childNodes[0]);
    var download_tag = document.getElementsByClassName("full-text")[0].getElementsByTagName('ul')[0].childNodes[2];
};
dow();
