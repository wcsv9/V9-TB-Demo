<?xml version="1.0" encoding="UTF-8"?>

<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2012, 2013 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<%@page contentType="text/xml;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://commerce.ibm.com/foundation" prefix="wcf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<objects>
	<%-- Get the OnlineStore noun for the calling store--%>
	<wcf:getData type="com.ibm.commerce.infrastructure.facade.datatypes.OnlineStoreType[]"
			var="onlineStores"
			expressionBuilder="findByUniqueID">
		<wcf:param name="accessProfile" value="IBM_All"/>
		<wcf:param name="storeId" value="${param.storeId}"/>
		<wcf:param name="usage" value="IBM_CustomerFacingStore"/>
	</wcf:getData>
	
	<c:set var="storeIdList" value=""/> 
	<jsp:useBean id="storeNameList" class="java.util.HashMap" type="java.util.Map"/>
	<jsp:useBean id="dataLanguageIdList" class="java.util.HashMap" type="java.util.Map"/>
	<jsp:useBean id="requestedDataLanguageIds" class="java.util.HashMap" type="java.util.Map"/>
	
	<c:if test="${!empty param.dataLanguageIds}">
		<c:forEach var="langId" items="${param.dataLanguageIds}">
			<c:set target="${requestedDataLanguageIds}" property="${langId}" value="${langId}"/>
		</c:forEach>
	</c:if>

	<c:if test="${(empty onlineStores)}">
		<wcf:getData type="com.ibm.commerce.infrastructure.facade.datatypes.OnlineStoreType[]"
			var="onlineStores"
			expressionBuilder="findByRelatedStoreUniqueID"
			maxItems="${param.maxItems}"
			varShowVerb="showVerb">
			<wcf:param name="accessProfile" value="IBM_Admin_All" />
			<wcf:param name="usage" value="IBM_CustomerFacingStore"/>
			<wcf:param name="storeId" value="${param.storeId}" />
		</wcf:getData>
	</c:if>
	<c:if test="${!(empty onlineStores)}">
		<c:forEach var="onlineStore" items="${onlineStores}">
			<c:choose>
				<c:when test="${storeIdList == ''}">
					<c:set var="storeIdList" value="${onlineStore.onlineStoreIdentifier.uniqueID}"/>
				</c:when>
				<c:otherwise>
					<c:set var="storeIdList" value="${storeIdList},${onlineStore.onlineStoreIdentifier.uniqueID}"/>
				</c:otherwise>
			</c:choose>
			<c:set target="${storeNameList}" property="${onlineStore.onlineStoreIdentifier.uniqueID}" value="${onlineStore.onlineStoreIdentifier.externalIdentifier.nameIdentifier}"/>
			<%-- Get the supported languages for each store --%>
			<c:if test="${! empty (onlineStore.onlineStoreSupportedLanguages.supportedLanguages)}">
				<c:set var="supportedLangIds" value=""/>
				<c:forEach var="supportedLangId" items="${onlineStore.onlineStoreSupportedLanguages.supportedLanguages}">
					<c:if test="${supportedLangId == onlineStore.onlineStoreSupportedLanguages.defaultLanguage || !empty(requestedDataLanguageIds[supportedLangId])}" >
						<c:choose>
							<c:when test="${supportedLangIds == ''}">
								<c:set var="supportedLangIds" value="${supportedLangId}"/>
							</c:when>
							<c:otherwise>
								<c:set var="supportedLangIds" value="${supportedLangIds},${supportedLangId}"/>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</c:if>
			<c:set target="${dataLanguageIdList}" property="${onlineStore.onlineStoreIdentifier.uniqueID}" value="${supportedLangIds}"/>
		</c:forEach>
	</c:if>
	
	<wcf:getData type="com.ibm.commerce.infrastructure.facade.datatypes.OnlineStoreType"
		var="onlineStore"
		expressionBuilder="findStoreByUniqueIDWithLanguage">
		<wcf:param name="usage" value="IBM_ViewCatalogTool"/>
		<wcf:contextData name="storeId" data="${param.storeId}"/>
		<wcf:param name="storeId" value="${param.storeId}"/>
		<wcf:param name="dataLanguageIds" value="${param.dataLanguageIds}"/>
	</wcf:getData>
	<c:if test="${!empty onlineStore && !empty onlineStore.defaultCatalog}">
		<c:forEach var="defaultCat" items="${onlineStore.defaultCatalog}">
			<c:if test="${!empty defaultCat.catalogIdentifier && defaultCat.storeIdentifier.uniqueID == param.storeId}">
				<c:set var="defaultCatalogId" value="${defaultCat.catalogIdentifier.uniqueID}"/>
			</c:if>			
			<c:if test="${!empty defaultCat.catalogIdentifier && defaultCat.storeIdentifier.uniqueID != param.storeId}">
				<c:set var="inheritedDefaultCatalogId" value="${defaultCat.catalogIdentifier.uniqueID}"/>
			</c:if>			
		</c:forEach>
		<c:if test="${defaultCatalogId == null}">
			<c:set var="defaultCatalogId" value="${inheritedDefaultCatalogId}"/>
		</c:if>
	</c:if>
	<c:if test="${defaultCatalogId == null}">
			<c:set var="defaultCatalogId" value="${param.catalogId}"/>
	</c:if>

	<%--For each storeId in the storeIdList, get the SEO URL for the specified object and supported languages--%>
	<c:if test="${!(empty storeIdList)}">
		<c:forEach var="currentStoreId" items="${storeIdList}">
			<c:set var="storeName" value="${storeNameList[currentStoreId]}"/> 
			<c:set var="supportedDataLangIds" value="${dataLanguageIdList[currentStoreId]}"/>
			<wcf:getData type="com.ibm.commerce.catalog.facade.datatypes.CatalogEntryType[]"
				var="catalogEntry" 
				expressionBuilder="getCatalogEntrySEOByID">
				<wcf:contextData name="storeId" data="${currentStoreId}"/>
				<wcf:contextData name="catalogId" data="${defaultCatalogId}"/>
				<wcf:param name="catEntryId" value="${param.catentryId}"/>
				<wcf:param name="dataLanguageIds" value="${supportedDataLangIds}"/>
			</wcf:getData>
			<c:if test="${!(empty catalogEntry)}">
				<c:forEach var="catentry" items="${catalogEntry}">
					<jsp:directive.include file="serialize/SerializeCatalogEntryPageSeoUrl.jspf"/>  
	 			</c:forEach>
			</c:if> 
		</c:forEach>
	</c:if>
	
</objects>
