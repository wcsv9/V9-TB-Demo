<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2013, 2014 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>

<!-- BEGIN ProductPageContainer.jsp -->

<%@include file="../Common/EnvironmentSetup.jspf"%>
<%@taglib uri="http://commerce.ibm.com/pagelayout" prefix="wcpgl"%>
<script type="text/javascript" src="${jspStoreImgDir}javascript/sharer.min.js"></script>
<style>
.row.margin-true.product_pageDesign_pageGroup {margin: 0 auto;max-width: 1005px;}
.pdp-roduct-detail div#addToShoppingListBtn {display: none;}
</style>

<script>
 $(document).ready(function() {
   document.getElementById("fb").data-url = window.location.href;
   document.getElementById("tw").data-url = window.location.href;
   document.getElementById("pi").data-url = window.location.href;
   document.getElementById("em").data-subject = window.location.href;
    });
    </script>
<!--Start Page Content-->
<div id="contentWrapper">
	<c:set var="slotNumber" value="7"/>
	<c:set var="foundCurrentSlot7" value="false"/>
	<c:forEach var="childWidget" items="${pageDesign.widget.childWidget}">
		<c:if test="${childWidget.slot.internalSlotId == slotNumber && !foundCurrentSlot7}">
			<c:set var="foundCurrentSlot7" value="true"/>
		</c:if>
	</c:forEach>
	<div class="product_page_content rowContainer <c:if test='${foundCurrentSlot7 == true}'>bundle_package_page</c:if>" id="container_${pageDesign.layoutId}" role="main">		
		<div class="row margin-true">
			<div class="col12 slot1" data-slot-id="1"><wcpgl:widgetImport slotId="1"/></div>
		</div>
		
		<div class="row margin-true ${fn:toLowerCase(pageDesign.pageGroup)}_pageDesign_pageGroup">
		<c:choose>
			<c:when test="${foundCurrentSlot7 == true}">
				<div class="col6 acol6 ccol7 slot4" data-slot-id="4"><wcpgl:widgetImport slotId="4"/></div>
				<div id="productSlot56" class="acol12 col12 ccol5">
			</c:when>
			<c:otherwise>
				<div class="col6 acol6 ccol7 slot4" data-slot-id="4"><wcpgl:widgetImport slotId="4"/></div>
				<div id="productSlot56" class="acol12 col12 ccol5">
			</c:otherwise>
		</c:choose>
			<div class="col5 acol6 ccol12 left slot5" data-slot-id="5"><wcpgl:widgetImport slotId="5"/></div>
			<div class="col5 acol12 ccol12 left slot6 pdp-roduct-detail" data-slot-id="6"><wcpgl:widgetImport slotId="6"/></div>
			
			
			<div class="pdp-share-wishlist-section">
			<div class="sharelist">
			<span class="share">Share:</span> 
			<a class="sharer" id="fb" data-sharer="facebook" data-url="">&nbsp;</a>
			<a class="sharer" id="tw"  data-via="twitter"    data-hashtags="Moore"  data-url="">&nbsp;</a>
			<a class="sharer" id="pi" data-sharer="Pinterest" data-url="">&nbsp;</a>
			<a class="sharer" id="em" data-sharer="email" data-title="Moore's Product Share" data-url="Share" data-subject="Moore's Product Share" data-to=""> &nbsp;</a>
			</div>
			
			<div class="save-look">
			<%out.flush();%><c:import url="${env_jspStoreDir}Widgets/ShoppingList/ShoppingList.jsp"/><%out.flush();%>
			</div>
			</div>
			</div>		

		<c:choose>
			<c:when test="${foundCurrentSlot7 == true}">
				<div class="col12 acol12 ccol4 left slot7" data-slot-id="7"><wcpgl:widgetImport slotId="7"/></div>
				<div class="col12 acol12 ccol4 left slot8" data-slot-id="8"><wcpgl:widgetImport slotId="8"/></div>
			</c:when>
			<c:otherwise>
				<div class="col12 acol12 ccol6 left slot7" data-slot-id="7"><wcpgl:widgetImport slotId="7"/></div>
				<div class="col12 acol12 ccol6 left slot8" data-slot-id="8"><wcpgl:widgetImport slotId="8"/></div>
			</c:otherwise>
		</c:choose>

		<wcf:useBean var="tabSlotIds" classname="java.util.ArrayList"/>
		<%-- Double loop to get the slots into the array list in proper order. The service does not return the child widgets in any predictable order. --%>
		<c:set var="tabSlotCount" value="0"/>
		<c:forEach var="slotNumber" begin="9" end="11">
			<c:set var="foundCurrentSlot" value="false"/>
			<c:forEach var="childWidget" items="${pageDesign.widget.childWidget}">
				<c:if test="${childWidget.slot.internalSlotId == slotNumber && !foundCurrentSlot}">
					<wcf:set target="${tabSlotIds}" value="${slotNumber}" />
					<c:set var="foundCurrentSlot" value="true"/>
					<c:set var="tabSlotCount" value="${tabSlotCount+1}"/>
				</c:if>
			</c:forEach>
		</c:forEach>
		<c:if test="${!empty tabSlotIds}">
			<c:choose>
				<c:when test="${foundCurrentSlot7 == true}">
					<div class="col12 acol12 ccol12 right tabbedSlots9_10_11">
				</c:when>
				<c:otherwise>
					<div class="col12 acol12 ccol12 right tabbedSlots9_10_11">
				</c:otherwise>
			</c:choose>
			
		
			
<%-- 			 <div class="tabButtonContainer" role="tablist">
				<div class="tab_header tab_header_double">
					<c:forEach var="tabSlotId" items="${tabSlotIds}" varStatus="status">
						<c:set var="tabSlotName" value="Title${tabSlotId}"/>
						<c:forEach var="childWidget" items="${pageDesign.widget.childWidget}">
							<c:if test="${childWidget.slot.internalSlotId == tabSlotName}">
								<c:set var="tabWidgetDefIdentifier" value="${childWidget.widgetDefinitionId}"/>
								<c:set var="tabWidgetIdentifier" value="${childWidget.widgetId}"/>
							</c:if>
						</c:forEach>
							
						<c:choose>
							<c:when test="${status.first}">
								<c:set var="tabClass" value="active_tab focused_tab" />
								<c:set var="tabIndex" value="0" /> 
							</c:when>
							<c:otherwise>
								<c:set var="tabClass" value="inactive_tab" />
								<c:set var="tabIndex" value="-1" />
							</c:otherwise>
						</c:choose>
						<c:set var="tabNumber" value="${status.index+1}" scope="request"/>
						<div id="tab${status.count}" tabindex="${tabIndex}" class="tab_container ${tabClass}" 
								aria-labelledby="contentRecommendationWidget_${tabSlotName}_${tabWidgetDefIdentifier}_${tabWidgetIdentifier}" aria-controls="tab${status.count}Widget"
								onfocus="ProductTabJS.focusTab('tab${status.count}');" onblur="ProductTabJS.blurTab('tab${status.count}');" 
								role="tab" aria-setsize="${tabSlotCount}" aria-posinset="${status.count}" aria-selected="${status.first == true ? 'true' : 'false'}" 	
								onclick="ProductTabJS.selectTab('tab${status.count}');" 
								onkeydown="ProductTabJS.selectTabWithKeyboard('${status.count}','${tabSlotCount}', event);">
								<wcpgl:widgetImport slotId="${tabSlotName}"/>
						</div>
						<c:remove var="tabNumber"/>
					</c:forEach>
				</div>
			</div> 

		 <c:forEach var="tabSlotId" items="${tabSlotIds}" varStatus="status">
				<c:set var="tabStyle" value=""/>
				<c:if test="${!status.first}">
					<c:set var="tabStyle" value="style='display:none'" />
				</c:if>
				<div role="tabpanel" class="tab left" data-slot-id="${tabSlotId}" id="tab${status.count}Widget" aria-labelledby="tab${status.count}" ${tabStyle}>
					<div class="content">
						<wcpgl:widgetImport slotId="${tabSlotId}"/>
					</div>
				</div>
				<c:remove var="tabStyle"/>
			</c:forEach> 
			----- --%>
			<div class="content">
						
			<div id="tab1" tabindex="0" class="tab_container active_tab focused_tab" 
			aria-labelledby="contentRecommendationWidget_Title10_-3005_1039" aria-controls="tab1Widget" role="tab" aria-setsize="2" aria-posinset="1" aria-selected="true" >
								People Also Searching For
						</div>
							<div role="tabpanel" class="tab left" data-slot-id="10" id="tab1Widget" aria-labelledby="tab1" style="display:block;">
					<div class="content">
						<wcpgl:widgetImport slotId="10"/>
					</div>
					</div>
			</div>
		</c:if>
		<div class="clear_float"></div>
		</div>				
	</div>
</div>

<!-- END ProductPageContainer.jsp -->
