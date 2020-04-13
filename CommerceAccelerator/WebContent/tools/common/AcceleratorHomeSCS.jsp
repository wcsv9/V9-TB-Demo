<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2009 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="com.ibm.commerce.tools.xml.*" %>
<%@ page import="com.ibm.commerce.tools.util.*" %>
<%@ page import="com.ibm.commerce.tools.common.*" %>
<%@ page import="com.ibm.commerce.command.*" %>
<%@ page import="com.ibm.commerce.server.*" %>
<%@ page import="java.util.*" %>
<%@ include file="../common/common.jsp" %>

<%
	CommandContext commandContext = (CommandContext)request.getAttribute(ECConstants.EC_COMMANDCONTEXT);
	Locale locale = commandContext.getLocale();
	Hashtable resourceBundle = (Hashtable) ResourceDirectory.lookup("common.mccNLS", locale);
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%= locale.getLanguage() %>" lang="<%= locale.getLanguage() %>">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><%= resourceBundle.get("title") %></title>
<link rel="stylesheet" type="text/css" href="<%= UIUtil.getCSSFile(locale) %>" />
</head>

<body class="entry">

<div align="center" style="padding-top: 30px; padding-bottom: 30px;">
	<table class="entry_table" border="0" cellpadding="0" cellspacing="0" width="899">
		<tbody>
			<tr>
				<td class="entry_title" height="5" colspan="3"></td>
			</tr>
			<tr>
				<td class="entry_text" valign="top" colspan="3">
					<%= resourceBundle.get("scs_intro") %> <%= resourceBundle.get("helpText") %>
				</td>
			</tr>
			<tr>
				<td class="entry_title" width="449"><%= resourceBundle.get("title_products") %></td>
				<td class="entry_divider" width="1"></td>
				<td class="entry_title" width="449"></td>
			</tr>
			<tr>
				<td class="entry_text" valign="top" width="449">
					<%= resourceBundle.get("scs_sec1_text") %>
					<ul class="entry_list">
						<%= resourceBundle.get("scs_sec1_list") %>
					</ul>
				</td>
				<td class="entry_divider" width="1"></td>
				<td class="entry_text" valign="top" width="449"></td>
			</tr>
		</tbody>
	</table>
</div>

</body>

</html>
