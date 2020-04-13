<?xml version="1.0" encoding="UTF-8"?>

<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2008, 2016 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<%@page contentType="text/xml;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://commerce.ibm.com/foundation" prefix="wcf"%>
<c:set var="responseMap" value="${requestScope['com.ibm.commerce.responseMap']}"/>
<c:set var="roles" value="${responseMap.roles[0]}"/>
<c:set var="siteAdministrator" value="false"/>
<c:set var="sellerAdministrator" value="false"/>
<c:set var="buyerAdministrator" value="false"/>
<c:set var="buyerApprover" value="false"/>
<c:set var="channelManager" value="false"/>
<c:set var="customerServiceRepresentative" value="false"/>
<c:set var="customerServiceSupervisor" value="false"/>
<c:forTokens var="role" items="${roles}" delims=",">
	<c:if test="${role=='siteAdministrator'}">
		<c:set var="siteAdministrator" value="true"/>
	</c:if>
	<c:if test="${role=='sellerAdministrator'}">
		<c:set var="sellerAdministrator" value="true"/>
	</c:if>
	<c:if test="${role=='buyerAdministrator'}">
		<c:set var="buyerAdministrator" value="true"/>
	</c:if>
	<c:if test="${role=='buyerApprover'}">
		<c:set var="buyerApprover" value="true"/>
	</c:if>
	<c:if test="${role=='channelManager'}">
		<c:set var="channelManager" value="true"/>
	</c:if>
	<c:if test="${role=='customerServiceRepresentative'}">
		<c:set var="customerServiceRepresentative" value="true"/>
	</c:if>
	<c:if test="${role=='customerServiceSupervisor'}">
		<c:set var="customerServiceSupervisor" value="true"/>
	</c:if>
</c:forTokens>

<values>
  <identityId><wcf:cdata data="${responseMap.encryptedIdentityId}"/></identityId>
  <unencryptedIdentityId><wcf:cdata data="${responseMap.identityTokenID[0]}"/></unencryptedIdentityId>
  <identitySignature><wcf:cdata data="${responseMap.identityTokenSignature[0]}"/></identitySignature>
  <logonId><wcf:cdata data="${param.logonId}"/></logonId>
  <userId><wcf:cdata data="${responseMap.userId[0]}"/></userId>
  <WCToken><wcf:cdata data="${responseMap.WCToken}"/></WCToken>
  <WCTrustedToken><wcf:cdata data="${responseMap.WCTrustedToken}"/></WCTrustedToken>
  <firstName><wcf:cdata data="${responseMap.firstName[0]}"/></firstName>
  <lastName><wcf:cdata data="${responseMap.lastName[0]}"/></lastName>
  <ibmId><wcf:cdata data="${responseMap.ibmId[0]}"/></ibmId>
  <jwt><wcf:cdata data="${responseMap.jwt}"/></jwt>
  <siteAdministrator>${siteAdministrator}</siteAdministrator>
  <sellerAdministrator>${sellerAdministrator}</sellerAdministrator>
  <buyerAdministrator>${buyerAdministrator}</buyerAdministrator>
  <buyerApprover>${buyerApprover}</buyerApprover>
  <channelManager>${channelManager}</channelManager>
  <customerServiceRepresentative>${customerServiceRepresentative}</customerServiceRepresentative>
  <customerServiceSupervisor>${customerServiceSupervisor}</customerServiceSupervisor>
</values>
