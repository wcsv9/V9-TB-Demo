﻿/* Copyright IBM Corp. 2009-2015  All Rights Reserved. */(function(){CKEDITOR.plugins.add("ibminsertmedia",{init:function(d){d.widgets.on("instanceCreated",function(a){a=a.data;a.on("sendRequest",function(c){var b=c.data;f.sendRequest(this.providerUrl,{url:encodeURIComponent(b.url)},b.callback,function(c,g){c?b.errorCallback(c):b.callback(g)});c.stop()});a.on("handleResponse",function(c){if(c.data.html)c.stop();else{var b;b=c.data.response;b="photo"==b.type||"image"==b.type?'<img src="'+CKEDITOR.tools.htmlEncodeAttr(b.url)+'" alt="'+CKEDITOR.tools.htmlEncodeAttr(b.title||
"")+'" style="max-width:100%;height:auto" />':"video"==b.type||"rich"==b.type||"link"==b.type?b.html:null;null!==b?(c.data.html=b,c.stop()):(c.data.errorMessage="unsupportedUrl",c.cancel())}})})}});var f={sendRequest:function(d,a,c){var a=a||{},b={},e=function(b,c){var a=new XMLHttpRequest;"withCredentials"in a?a.open(b,c,!0):"undefined"!=typeof XDomainRequest?(a=new XDomainRequest,a.open(b,c)):a=null;return a}("GET",d.output(a));e&&(e.onload=function(){try{if(b=JSON.parse(e.response)){if(!b.html){var a=
b,d=new CKEDITOR.htmlParser.element("div",{style:"left: 0px; width: 100%; height: 0px; position: relative; padding-bottom: 56.2493%;"});switch(a.type){case "video":attribute=a.video[0]["video:url"]&&"undefined"!=typeof a.video[0]["video:url"]?a.video[0]["video:url"]:a.thumbnails[0];break;case "link":attribute=a.raw["twitter:player"]&&"undefined"!=typeof a.raw["twitter:player"]?a.raw["twitter:player"]:a.thumbnails[0];break;default:attribute=a.thumbnails[0]}if(attribute&&"undefined"!=typeof attribute){var f=
new CKEDITOR.htmlParser.element("iframe",{src:attribute,style:"width: 100%; height: 100%; position: absolute;"});d.add(f);var h=d.getOuterHtml();a.html=h}else a.html=null;b=a}c(b)}}catch(i){console.log("error:",i)}},e.onerror=function(){console.log("error")},e.send())}}})();