<?xml version="1.0" encoding="UTF-8"?>

<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2011 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>

<%@page contentType="text/xml;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<objects
	recordSetCompleteIndicator="${recordSetCompleteIndicator}"	
	recordSetStartNumber="${recordSetStartNumber}"
	recordSetCount="${recordSetCount}"
	recordSetTotal="${recordSetTotal}">
	<c:forEach var="model" items="${responseData}">
		<c:if test="${model.type == 'Group'}">
			<c:set var="referenceObjectType" value="ChildConfigModelDirectory"/>
			<c:set var="primaryObjectType" value="ConfigModelDirectory"/>
			<c:if test="${param.storeId != model.objectStoreId}">
				<c:set var="referenceObjectType" value="ChildInheritedConfigModelDirectory"/>
				<c:set var="primaryObjectType" value="InheritedConfigModelDirectory"/>
			</c:if>			
			<object objectType="${referenceObjectType}">
				<modelName>${model.name}</modelName>  
			  	<path>${model.path}</path>
			  	<fullPath>${model.path}/${model.name}</fullPath>
			  	<objectStoreId>${model.objectStoreId}</objectStoreId>
		 		<object objectType="${primaryObjectType}">
		  			<modelName>${model.name}</modelName>  
		  			<path>${model.path}</path>
		  			<fullPath>${model.path}/${model.name}</fullPath>
		  			<objectStoreId>${model.objectStoreId}</objectStoreId>
		 		</object>
			 </object>
		</c:if>
		<c:if test="${model.type == 'Model'}">
			<c:set var="referenceObjectType" value="ChildConfigModel"/>
			<c:set var="primaryObjectType" value="ConfigModel"/>
			<c:if test="${param.storeId != model.objectStoreId}">
				<c:set var="referenceObjectType" value="ChildInheritedConfigModel"/>
				<c:set var="primaryObjectType" value="InheritedConfigModel"/>
			</c:if>
			<object objectType="${referenceObjectType}">
				<modelName>${model.name}</modelName>  
			  	<path>${model.path}</path>
			  	<fullPath>${model.path}</fullPath>
			  	<objectStoreId>${model.objectStoreId}</objectStoreId>
				<object objectType="${primaryObjectType}">
		  			<modelName>${model.name}</modelName>  
		  			<path>${model.purePath}</path>
		  			<fullPath>${model.path}</fullPath>
		  			<objectStoreId>${model.objectStoreId}</objectStoreId>
		 		</object>	 	
		 	</object>
	 	</c:if>	
	</c:forEach>
</objects>