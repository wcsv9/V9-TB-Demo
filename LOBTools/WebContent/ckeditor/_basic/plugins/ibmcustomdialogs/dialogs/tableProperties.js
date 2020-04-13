﻿CKEDITOR.tools.extend(CKEDITOR.ibm.dialogs,{tableProperties:function(i,b){var h=/^(\d+(?:\.\d+)?)(px|%|in|cm|mm|em|ex|pt|pc)$/,l=/^(px|%|in|cm|mm|em|ex|pt|pc)$/;i.onLoad=function(){var a=this,b=a.getContentElement("advanced","advStyles");if(b)b.on("change",function(){var b=this.getStyle("width",""),d=b,c=a.getContentElement("info","txtWidth"),e=a.getContentElement("info","cmbWidthType"),f="px",g=!1;if(d){var i=h.exec(d);i&&(f=i[2],g=!0);d=parseFloat(d,10)}c&&c.setValue(d,!0);e&&e.setValue(f,!0);d&&
!g&&c&&c.setValue(b,!0);d=b=this.getStyle("height","");c=a.getContentElement("info","txtHeight");cmbHeightType=a.getContentElement("info","cmbHeightType");heightUnit="px";heightValid=!1;if(d){if(e=h.exec(d))heightUnit=e[2],heightValid=!0;d=parseFloat(d,10)}c&&c.setValue(d,!0);cmbHeightType&&cmbHeightType.setValue(heightUnit,!0);d&&!heightValid&&c&&c.setValue(b,!0)})};var f=function(a){var d=this.getValue(),b=h.exec(d),c=this.id;a.info||(a.info={});b?a.info[c]=d:l.exec(d)&&(a.info[c]="")};if("tableProperties"===
i.dialog.getName()){var c=i.getContents("info"),j=c.get("txtRows"),k=c.get("txtCols"),e=c.get("txtHeight"),g=c.get("txtWidth"),m=c.get("selHeaders"),o=c.get("txtBorder"),p=c.get("txtCellSpace"),q=c.get("txtCellPad"),n=c.get("cmbAlign"),r=c.get("txtCaption"),s=c.get("txtSummary"),t=c.get("requiredLabel")?c.get("requiredLabel"):{type:"html",html:""};j.controlStyle=this.styleWidth100Pc;k.controlStyle=this.styleWidth100Pc;g.controlStyle=this.styleWidth100Pc;e.controlStyle=this.styleWidth100Pc;e.title=
null;g.title=null;delete e.onLoad;m.controlStyle=this.styleWidth100Pc;m.inputStyle=this.styleWidth100Pc;o.controlStyle=this.styleWidth100Pc;p.controlStyle=this.styleWidth100Pc;q.controlStyle=this.styleWidth100Pc;n.controlStyle="width:97%";n.inputStyle="width:50%;";g.setup=function(a){(a=h.exec(a.$.style.width))?this.setValue(a[1]):this.setValue("")};g.validate=function(){var a=this.getValue(),d=h.exec(a);d?a=parseFloat(d[1],10):l.exec(a)&&(a="");return""==a||"number"==typeof a?!0:b.lang.table.invalidWidth};
g.onChange=function(){var a=this.getDialog().getContentElement("advanced","advStyles");if(a){var b=this.getValue();b&&(h.exec(b)||(b=""));a.updateStyle("width",b)}};g.commit=f;g.getValue=function(){return this.getInputElement().getValue()+this.getDialog().getContentElement("info","cmbWidthType").getValue()};e.setup=function(a){(a=h.exec(a.$.style.height))&&this.setValue(a[1])};e.validate=function(){var a=this.getValue(),c=h.exec(a);c?a=parseFloat(c[1],10):l.exec(a)&&(a="");return""==a||"number"==
typeof a?!0:b.lang.table.invalidHeight};e.onChange=function(){var a=this.getDialog().getContentElement("advanced","advStyles");if(a){var b=this.getValue();b&&(h.exec(b)||(b=""));a.updateStyle("height",b)}};e.commit=f;e.getValue=function(){return this.getInputElement().getValue()+this.getDialog().getContentElement("info","cmbHeightType").getValue()};c.label=b.lang.common.generalTab;c.elements=[{type:"hbox",children:[j,k]},{type:"hbox",children:[g,{id:"cmbWidthType",requiredContent:"table{width}",type:"select",
label:b.lang.table.widthUnit,style:this.styleWidth100Pc,"default":"px",items:[[b.lang.table.widthPx,"px"],[b.lang.table.widthPc,"%"],[b.lang.ibm.common.widthIn,"in"],[b.lang.ibm.common.widthCm,"cm"],[b.lang.ibm.common.widthMm,"mm"],[b.lang.ibm.common.widthEm,"em"],[b.lang.ibm.common.widthEx,"ex"],[b.lang.ibm.common.widthPt,"pt"],[b.lang.ibm.common.widthPc,"pc"]],setup:function(a){(a=h.exec(a.$.style.width))&&this.setValue(a[2])},commit:function(){},onChange:function(){this.getDialog().getContentElement("info",
"txtWidth").onChange()}}]},{type:"hbox",children:[e,{id:"cmbHeightType",requiredContent:"table{height}",type:"select",label:b.lang.table.ibm.heightUnit,style:this.styleWidth100Pc,"default":"px",items:[[b.lang.table.widthPx,"px"],[b.lang.table.widthPc,"%"],[b.lang.ibm.common.widthIn,"in"],[b.lang.ibm.common.widthCm,"cm"],[b.lang.ibm.common.widthMm,"mm"],[b.lang.ibm.common.widthEm,"em"],[b.lang.ibm.common.widthEx,"ex"],[b.lang.ibm.common.widthPt,"pt"],[b.lang.ibm.common.widthPc,"pc"]],setup:function(a){""!==
a.$.style.height&&(a=h.exec(a.$.style.height))&&this.setValue(a[2])},commit:function(){},onChange:function(){this.getDialog().getContentElement("info","txtHeight").onChange()}}]},{type:"hbox",children:[o,m]},{type:"hbox",children:[n]},t];f=i.getContents("advanced");c=f.get("advId");j=f.get("advLangDir");k=f.get("advCSSClasses");e=f.get("advStyles");g=f.get("requiredLabel")?f.get("requiredLabel"):{type:"html",html:""};f.elements=[{type:"vbox",children:[{type:"vbox",padding:2,children:[r,s]},{type:"hbox",
children:[p,q]},{type:"hbox",children:[c,j]},{type:"vbox",children:[k,e]},g]}]}}},!0);