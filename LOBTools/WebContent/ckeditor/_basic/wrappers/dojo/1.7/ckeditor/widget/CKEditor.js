﻿define("dijit/_WidgetBase dojo/_base/declare dojo/_base/window dojo/_base/Deferred dojo/_base/lang dojo/_base/sniff dojo/_base/connect dojo/io/script".split(" "),function(f,i,c,j,d,k,g,l){return i("ckeditor.widget.CKEditor",[f],{_beingInitialized:false,value:"",ckeditorConfig:{},constructor:function(){this.onLoadDeferred=new j},onLoadDeferred:null,postCreate:function(){this.inherited(arguments);if(window.CKEditor)this._createEditorElement();else{for(var b,a=document.getElementsByTagName("script"),
e=0;e<a.length;e++)if(a[e].src.match(/(^|.*[\\\/])ckeditor(?:_basic)?(?:_source)?.js(?:\?.*)?$/)){b=a[e];break}if(!b){a=window.CKEDITOR_BASEPATH||c.global.CKEDITOR_BASEPATH||"/ckeditor/";b=l.attach("ckeditor",a+"ckeditor.js",c.doc)}var a=k("ie")?"onreadystatechange":"load",d=/complete|loaded/,h=this,f=g.connect(b,a,function(a){if(a.type=="load"||d.test(b.readyState)){g.disconnect(f);h.set("loading",false);h._createEditorElement()}});(c.doc.parentWindow||c.doc.defaultView).CKEDITOR?this._createEditorElement():
this.set("loading",true)}},destroy:function(){if(this._ckeditor){this._ckeditor.destroy(true);delete this._ckeditor}this.inherited(arguments)},addStyleSheet:function(b){if(window.CKEDITOR&&CKEDITOR.document){var a=b.toString();if(a.charAt(0)==="."||a.charAt(0)!=="/"&&!b.host)a=(new _Url(win.global.location,a)).toString();CKEDITOR.document.appendStyleSheet(a)}},focus:function(){if(this._ckeditor)this._beingInitialized?this._ckeditor.config.startupFocus=true:this._ckeditor.focus()},onChange:function(){},
_timeout:function(){this._createEditorElement()},_createEditorElement:function(){if(!this._beingInitialized&&!this._beingDestroyed){if(!this.nRetry)this.nRetry=0;if((c.doc.parentWindow||c.doc.defaultView).CKEDITOR)CKEDITOR=(c.doc.parentWindow||c.doc.defaultView).CKEDITOR;if(CKEDITOR.document&&window.CKEDITOR)CKEDITOR.document=new CKEDITOR.dom.document(c.doc);if(CKEDITOR.status=="unloaded"||CKEDITOR.status=="basic_loaded"||CKEDITOR.document&&!CKEDITOR.document.getById(this.id)){if(this.nRetry<600){this.nRetry++;
setTimeout(d.hitch(this,"_timeout"),100)}}else if(!this._destroyed){this._ckeditor=CKEDITOR.replace(this.domNode,this.get("ckeditorConfig"));this._beingInitialized=true;this.set("loading",true);this._ckeditor.on("instanceReady",d.hitch(this,this._onLoad));this._ckeditor.on("blur",d.hitch(this,this._onBlur));this.onLoadDeferred.callback(true)}}},_getCkeditorConfigAttr:function(){return this.ckeditorConfig},_onLoad:function(){if(this._ckeditor){this._ckeditor.config.startupFocus&&this._ckeditor.focus();
var b=new CKEDITOR.dom.range(this._ckeditor.document);b.selectNodeContents(this._ckeditor.document.getBody());b.collapse(true);var a=this._ckeditor.getSelection();a&&(a.getNative()&&a.getNative().rangeCount)&&a.selectRanges([b])}},_onBlur:function(){this._set("value",this.get("value"))},_setValueAttr:function(b){this._set("value",b);this._ckeditor&&this._ckeditor.setData(b)},_getValueAttr:function(){var b="";return b=this._ckeditor?this._ckeditor.getData():this.value}})});