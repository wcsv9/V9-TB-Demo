<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2010, 2016 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>

<%@ include file="../../../Common/EnvironmentSetup.jspf" %>

<c:if test="${CommandContext.user.userId ne '-1002' && unregisterMktEvent ne '1'}">
	<script type="text/javascript">
		function triggerMarketingEvent() {
			shoppingActionsServicesDeclarationJS.registerMarketingEvent({productId:'<c:out value="${WCParam.productId}"/>',DM_ReqCmd:'ProductDisplay',storeId:'<c:out value="${storeId}"/>'});			
		};
	</script>
</c:if>	