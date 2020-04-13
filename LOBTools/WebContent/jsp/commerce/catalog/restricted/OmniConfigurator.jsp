<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML><%@page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>OmniConfigurator</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/lobtools/ConfiguratorUI/styles/lib.css"/>
<link rel="stylesheet" type="text/css" href="/lobtools/ConfiguratorUI/styles/app.css"/>
<script type="text/javascript" src="/lobtools/ConfiguratorUI/js/lib.js"></script>
<script type="text/javascript" src="/lobtools/ConfiguratorUI/js/app.js"></script>
<style type="text/css">
.ibm-omni-configurator .breadcrumb {
background-color: rgb(65, 120, 190);
color: rgb(255, 255, 255);
}
.ibm-omni-configurator .panel-heading .accordion-toggle.collapsed:after {
color: rgb(255, 255, 255);
}
.ibm-omni-configurator .panel-heading .accordion-toggle:after {
color: rgb(255, 255, 255);
}
.ibm-omni-configurator .panel-default > .panel-heading {
background-color: rgb(65, 120, 190);
color: rgb(255, 255, 255);
}
.ibm-omni-configurator .title_info {
border-bottom-color: rgb(65, 120, 190);
}
.configurator-btn-container {
width: 100%;
height: 30px;
margin-bottom: 10px;
}
.configurator-save-btn-container {
position: absolute;
top: 0px;
right: 140px;
outline: none;
width: 88px;
height: 28px;
background-image: none;
background-repeat: no-repeat;
background-color: rgb(65, 120, 190);
color: rgb(255, 255, 255);
font-weight: inherit;
font-style: inherit;
font-size: 13px;
font-family: Helvetica, Arial, sans-serif;
display: block;
pointer-events: auto;
line-height: 30px;
text-align: center;
vertical-align: middle;
margin-top: 10px;
border: 1px #4079be solid;
cursor:pointer;
}
.configurator-close-btn-container {
position: absolute;
top: 0px;
right: 40px;
outline: none;
width: 88px;
height: 28px;
background-image: none;
background-repeat: no-repeat;
background-color: rgb(255, 255, 255);
color: rgb(65, 120, 190);
font-weight: inherit;
font-style: inherit;
font-size: 13px;
font-family: Helvetica, Arial, sans-serif;
display: block;
pointer-events: auto;
line-height: 30px;
text-align: center;
vertical-align: middle;
margin-top: 10px;
border: 1px #4079be solid;
cursor:pointer;
}
</style>
</head>
<% 
	String organizationCode = (String)request.getParameter("organizationCode");
	String modelPath = (String)request.getParameter("Model");
	
	String identityId = (String)request.getParameter("wcidentityId");
	System.out.println("identityId="+identityId);
	String identitySignature = (String)request.getParameter("identitySignature");
	String storeId = (String)request.getParameter("storeId");
	String locale = (String)request.getParameter("LocaleCode");
	String currency = (String)request.getParameter("CurrencyCode");
	String catentryId = (String)request.getParameter("catentryId");
	String workspaceName = (String)request.getParameter("workspaceName");
	String workspaceTask = (String)request.getParameter("workspaceTask");
	String workspaceTaskGroup = (String)request.getParameter("workspaceTaskGroup");
	String configuratorServer = (String)request.getParameter("ConfiguratorServer");
	String saveButtonText = (String)request.getParameter("SaveButtonText");
	String closeButtonText = (String)request.getParameter("CloseButtonText");
	
	String contextUrl =(String) request.getAttribute("javax.servlet.forward.context_path");
	
	String returnUrl =  contextUrl + "/cmc/UpdateDynamicKitPreConfiguration";
	String returnParams = "storeId=" + storeId 
		+ "&catentryId=" + catentryId + "&workspaceName=" + workspaceName + "&workspaceTask=" 
		+ workspaceTask + "&workspaceTaskGroup=" + workspaceTaskGroup + "&locale=" + locale;
%>
<body>
		
		<script>
			var locale = "<%=locale%>";
			var locales = locale.split("_");
			var modellanguage = locales[0];
			var modelcountry = locales[1];
			var currency = "<%=currency%>";
			
			var bomXml = window.opener.PDKConfigXML;
			bomXml = bomXml.replace(/\r\n/g,"");  
        	bomXml = bomXml.replace(/\n/g,""); 
        	bomXml = bomXml.replace(/ConfiguratorBOM/g, "ExtractPicks");
        	var xmlRootNode = '<ExtractPicks Country="' + modelcountry + '" Currency="' + currency + '" Language="' + modellanguage + '"';
        	bomXml = bomXml.replace(/<ExtractPicks/g, xmlRootNode);
			
			var configModelData = {
				'modelPath': "<%=modelPath%>",
				'organizationCode': "<%=organizationCode%>",
				'modellanguage': modellanguage,
				'modelcountry': modelcountry,
				'ignoreCustomerEntitlements': false,
				'currency': currency,
				'firingPhase':"Initiate"
			};
			var configuratorServer = "<%=configuratorServer%>";
			configuratorServer = configuratorServer.replace(/\/api/g,"");
			var standAloneMode = false;
			var configurator_translationdata_path= "/lobtools/ConfiguratorUI";
			var standAloneMode = false;
			var sfdcDetails = {
				resourcePath:"/lobtools/ConfiguratorUI"
			};
			
		</script>
		<div class="configurator-btn-container">
			<div class="configurator-save-btn-container" onclick="onsave()">
			<%=saveButtonText%>
			</div>
			<div class="configurator-close-btn-container" onclick="window.opener.closeAllChildWindows()">
			<%=closeButtonText%>
			</div>
		</div>
		<div ng-app="ibmConfiguratorApp">
           <div class="shell ibm-omni-configurator" ng-controller="ShellController as vm" id="divId">
             <section class="well">
               <ibm-configurator resize="vm.resize()" model="vm.data"/>
             </section>
           </div>
		</div>
<script>

var identityInput = "<%=identityId%>";
function onsave(){
	generateBOM( function (bomXML) {
		var returnParams = "<%=returnParams%>" +'&identityId='+encodeURIComponent(identityInput)+'&ConfigXML='+bomXML;
		saveRequest("<%=returnUrl%>", returnParams);
	})
}

var xmlhttp;
function saveRequest(returnUrl, returnParams) {
	sendRequest(
			"POST",
			returnUrl,
			true,
			returnParams,
			function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					window.opener.closeAllChildWindows();
				}
				//alert("xmlhttp.readyState:"+xmlhttp.readyState+"---xmlhttp.status:"+xmlhttp.status+"---xmlhttp.responseText:"+xmlhttp.responseText);
			});
}

function sendRequest(method, url, isAsyns, params, action) {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open(method, url, isAsyns);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(params);
	xmlhttp.onreadystatechange = action;
}

</script>	
</body>
</html>