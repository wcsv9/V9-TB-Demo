<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2011, 2013 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>



<!-- BEGIN QuickInfo.jsp -->
<%@ include file="/Widgets_801/Common/EnvironmentSetup.jspf" %>
<%@ include file="/Widgets_801/Common/nocache.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://commerce.ibm.com/foundation" prefix="wcf" %>
<%@ taglib uri="http://commerce.ibm.com/base" prefix="wcbase" %>
<%@ taglib uri="flow.tld" prefix="flow" %>
<%@ taglib uri="http://commerce.ibm.com/foundation-fep/stores" prefix="wcst" %>
<%@ taglib uri="http://commerce.ibm.com/json" prefix="json" %>


<script type="text/javascript">
    $(document).ready(function() {
    <fmt:message bundle="${storeText}" key="ERR_RESOLVING_SKU" var="ERR_RESOLVING_SKU"/>
    <fmt:message bundle="${storeText}" key="QUANTITY_INPUT_ERROR" var="QUANTITY_INPUT_ERROR"/>
    <fmt:message bundle="${storeText}" key="WISHLIST_ADDED" var="WISHLIST_ADDED"/>
	MessageHelper.setMessage("ERR_RESOLVING_SKU", <wcf:json object="${ERR_RESOLVING_SKU}"/>);
	MessageHelper.setMessage("QUANTITY_INPUT_ERROR", <wcf:json object="${QUANTITY_INPUT_ERROR}"/>);
	MessageHelper.setMessage("WISHLIST_ADDED", <wcf:json object="${WISHLIST_ADDED}"/>);

    });
</script>


	
<%@ include file="ext/QuickInfo_Data.jspf" %>
<c:if test = "${param.custom_data ne 'true'}">
	<%@ include file="QuickInfo_Data.jspf" %>
</c:if>

<%@ include file="ext/QuickInfo_UI.jspf" %>
<c:if test = "${param.custom_view ne 'true'}">
	<%@ include file="QuickInfo_UI.jspf" %>
</c:if>
<jsp:useBean id="QuickInfo_TimeStamp" class="java.util.Date" scope="request"/>

<!-- END QuickInfo.jsp -->