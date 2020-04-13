<!-- ========================================================================
//********************************************************************
//*-------------------------------------------------------------------
//* Licensed Materials - Property of IBM
//*
//* WebSphere Commerce
//*
//* (c) Copyright IBM Corp. 2001, 2002
//*
//* US Government Users Restricted Rights - Use, duplication or
//* disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//*
//*-------------------------------------------------------------------
//*
 ===========================================================================
 OrderByContractReportOutputView.jsp
 ===========================================================================-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
<%@page import="java.util.*" %>

<%@include file="common.jsp"%>
<%@include file="ReportOutputHelper.jsp"%>

<%
    String reportPrefix = "OrderByContract";
%>

<html>

   <head>
     <%=fHeader%>
     <%=generateHeaderInformation(reportPrefix, reportsRB, request)%>
   </head>

   <body CLASS=content ONLOAD="javascript:parent.setContentFrameLoaded(true)">
      <%=generateOutputHeading(reportPrefix, reportsRB)%>
      <%=generateOutputInputCriteria(reportPrefix, reportsRB, reportsCommandContext.getLocale())%>
      <%=generateOutputTable(reportPrefix, reportsRB, reportsCommandContext.getLocale())%>
   </body>

</html>
