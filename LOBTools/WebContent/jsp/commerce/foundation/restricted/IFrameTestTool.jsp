
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2018 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	response.setHeader("X-Frame-Options","SAMEORIGIN");
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="${pageContext.request.locale.language}" lang="${pageContext.request.locale.language}">

<head>
<title>IFrameTestTool</title>

<script>
<!-- 
//hide script from old browsers

function messageReceiver(event) {
	console.log(event);
	if (event.data) {
		if (event.data.action == "RENDER_VIEW_DATA") {
			document.getElementById("renderViewData").innerHTML = JSON.stringify(event.data);
		}
		if (event.data.action == "JWT") {
			document.getElementById("jwt").innerHTML = JSON.stringify(event.data);
		}
	}
}

function postFetchRenderViewData() {
	if (window.parent) {
		window.parent.postMessage({"action":"FETCH_RENDER_VIEW_DATA"}, "*");
	}
}

function renewJWT() {
	if (window.parent) {
		window.parent.postMessage({"action":"JWT_FETCH_REQUEST"}, "*");
	}
}

function showHelp(helpType) {
	if (window.parent) {
		window.parent.postMessage({"action":"SHOW_HELP","data":{"helpType":helpType}}, "*");
	}
}

function postSuccessStatus() {
	if (window.parent) {
		window.parent.postMessage({"action":"POST_STATUS","data":{"statusType":"success", "statusContent": "successful message" }}, "*");
	}
}

function postErrorStatus() {
	if (window.parent) {
		window.parent.postMessage({"action":"POST_STATUS","data":{"statusType":"error", "statusContent": "error message" }}, "*");
	}
}

function startProgressIndicator() {
	if (window.parent) {
		window.parent.postMessage({"action":"START_PROGRESS_INDICATOR"}, "*");
	}
}

function stopProgressIndicator() {
	if (window.parent) {
		window.parent.postMessage({"action":"STOP_PROGRESS_INDICATOR"}, "*");
	}
}

window.addEventListener("message", messageReceiver, false);
//-->
</script>
</head>

<body>

<p>Test IFrameTool</p>

<div><button onclick="postFetchRenderViewData()">Post FETCH_RENDER_VIEW_DATA</button></div>
<br/>
<div id="renderViewData"></div>
<br/>
<div><button onclick="renewJWT()">Renew JWT</button></div>
<br/>
<div id="jwt"></div>
<br/>
<div><button onclick="postSuccessStatus()">Post Success</button></div>
<br/>
<div><button onclick="postErrorStatus()">Post Error</button></div>
<br/>
<div><button onclick="startProgressIndicator()">Start Progress Indicator</button></div>
<br/>
<div><button onclick="stopProgressIndicator()">Stop Progress Indicator</button></div>
<br/>
<div><button onclick="showHelp('gettingStarted')">Post SHOW_HELP GETTING_STARTED</button></div>
<br/>
<div><button onclick="showHelp('infoCenter')">Post SHOW_HELP INFO_CENTER</button></div>
<br/>
<div><button onclick="showHelp('contextSensitive')">Post SHOW_HELP CONTEXT_SENSITIVE_HELP</button></div>

</body>

</html>
