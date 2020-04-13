
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
	response.setHeader("X-Frame-Options","DENY");
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="${pageContext.request.locale.language}" lang="${pageContext.request.locale.language}">

<head>
<title>Configure Management Center</title>
<script src="${pageContext.request.contextPath}/javascript/shell/Configure.js"></script>
<script>
<!-- 
//hide script from old browsers
if ("<c:out value="${param.reset}"/>" == "true") {
	resetDarkFeatures();
}
setDarkFeature("<c:out value="${param.featureName}"/>", "<c:out value="${param.featureEnabled}"/>");
loadDarkFeatures();
//-->
</script>
</head>

<body>

<script type="text/javascript">
for (var i in darkFeatures) {
	document.writeln(i + '=' + (!darkFeatures[i]) + '<br>');
}
</script>

</body>

</html>
