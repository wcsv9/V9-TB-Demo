<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2008, 2015 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<%-- 
  *****
  * This JSP displays the store locator content.
  * 
	* Parameters
	*
	* -fromUrl (optional)
	* If provided, clicking the Continue Shopping button will redirect back to the url specified
	*
	* -fromPage (optional)
	* It can be one of these options: "ProductDetails", "StoreLocator", or "ShoppingCart". If coming from the product details
	* page this page shows a short summary of the product at the top of the page. If coming from the shopping cart page then
	* the page will show the inventory information in the physical store list section. Otherwise, fromPage defaults to "StoreLocator"
	* and it will just show a default store locator page with search results and physical store list management.
	* 
	* -productId (optional)
	* The product id for the product that the shopper is checking inventory for.
	* 
	* -type (optional)
	* The type of product that the shopper is checking inventory for. This type parameter maybe "item", "product", "package" or "bundle".
  *****
--%>

<!-- BEGIN StoreLocator.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://commerce.ibm.com/base" prefix="wcbase" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="flow.tld" prefix="flow" %>
<%@ taglib uri="http://commerce.ibm.com/foundation" prefix="wcf" %>
<%@ include file="../../Common/EnvironmentSetup.jspf" %>

<c:set var="fromPage" value="StoreLocator" />
<c:if test="${!empty WCParam.fromPage}">
	<c:set var="fromPage" value="${fn:escapeXml(WCParam.fromPage)}" />
</c:if>
<c:if test="${!empty param.fromPage}">
	<c:set var="fromPage" value="${fn:escapeXml(param.fromPage)}" />
</c:if>

<c:if test="${!empty WCParam.fromUrl}">
	<c:set var="fromUrl" value="${WCParam.fromUrl}" />
</c:if>
<c:if test="${!empty param.fromUrl}">
	<c:set var="fromUrl" value="${param.fromUrl}" />
</c:if>

<wcf:url var="AjaxProvinceSelectionDisplayURL" value="AjaxProvinceSelectionDisplayView" type="Ajax">
	<wcf:param name="storeId" value="${param.storeId}" />
	<wcf:param name="catalogId" value="${param.catalogId}" />
	<wcf:param name="langId" value="${langId}" />
</wcf:url>
<wcf:url var="AjaxCitySelectionDisplayURL" value="AjaxCitySelectionDisplayView" type="Ajax">
	<wcf:param name="storeId" value="${param.storeId}" />
	<wcf:param name="catalogId" value="${param.catalogId}" />
	<wcf:param name="langId" value="${langId}" />						
</wcf:url>
<wcf:url var="AjaxStoreLocatorResultsURL" value="AjaxStoreLocatorResultsView" type="Ajax">
	<wcf:param name="storeId" value="${param.storeId}" />
	<wcf:param name="catalogId" value="${param.catalogId}" />
	<wcf:param name="orderId" value="${param.orderId}" />
	<wcf:param name="langId" value="${langId}" />						
</wcf:url>
<wcf:url var="AjaxSelectedStoreListURL" value="AjaxSelectedStoreListView" type="Ajax">
	<wcf:param name="storeId" value="${param.storeId}" />
	<wcf:param name="catalogId" value="${param.catalogId}" />
	<wcf:param name="orderId" value="${param.orderId}" />
	<wcf:param name="langId" value="${langId}" />
	<wcf:param name="fromPage" value="${fromPage}" />
</wcf:url>
<style>
<!--
div.content_wrapper>div.content_left_shadow>div.content_right_shadow>div.main_content {    max-width: 100%;margin: 0 auto;min-height: 100px;padding: 0px 0;}
div.content_wrapper>div.content_left_shadow>div.content_right_shadow, div.content_wrapper>div.content_left_shadow {padding-right: 0px;padding-left: 0;}
#gift_registry_box {margin: 8px auto 0;max-width: 1000px;}
-->
</style>
<script>
$(document).ready(function(){
  $("#global-message").click(function(){
    $("#foo").toggle();
  });
});

function showhide() {
  var x = document.getElementById("foo");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>
<c:choose>
	<%-- If categoryId is empty --%>
	<c:when test="${empty param.categoryId}">
		<c:set var="patternName" value="ProductURL"/>
	</c:when>
	<%-- If only categoryId is present and top_category, parent_category_rn either empty or same as categoryId --%>
	<c:when test="${(empty param.top_category or (param.categoryId eq param.top_category)) and (empty param.parent_category_rn or (param.categoryId eq param.parent_category_rn))}">
		<c:set var="patternName" value="ProductURLWithCategory"/>
	</c:when>
	<%-- If categoryId, top_category and parent_category_rn are present and different --%>
	<c:when test="${(not empty param.top_category) and (not empty param.parent_category_rn) and (param.categoryId ne param.parent_category_rn) and (param.categoryId ne param.top_category) and (param.parent_category_rn ne param.top_category)}">
		<c:set var="patternName" value="ProductURLWithParentAndTopCategory"/>
	</c:when>
	<%-- here, categoryId will be present and either top_category or parent_category_rn will be different from categoryId --%>
	<c:otherwise>
		<c:set var="patternName" value="ProductURLWithParentCategory"/>
	</c:otherwise>
</c:choose>
<wcf:url var="ProductDisplayURL" patternName="${patternName}" value="Product2">
	<wcf:param name="langId" value="${langId}" />						
	<wcf:param name="storeId" value="${param.storeId}" />
	<wcf:param name="catalogId" value="${param.catalogId}" />
	<wcf:param name="productId" value="${param.productId}"/>
	<wcf:param name="categoryId" value="${param.categoryId}"/>		  
	<wcf:param name="parent_category_rn" value="${param.parent_category_rn}"/>
	<wcf:param name="top_category" value="${param.top_category}" />
	<wcf:param name="urlLangId" value="${urlLangId}" />
</wcf:url>

<c:catch var="topGeoNodeException">
	<wcf:rest var="topGeoNodes" url="store/{storeId}/geonode/byTopGeoNode">
		<wcf:var name="storeId" value="${WCParam.storeId}" encode="true"/>
		<wcf:param name="siteLevelSearch" value="false"/>
	</wcf:rest>
</c:catch>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvjetzrk_8KJ_QD4Szje_MCtUQ--LabIs&v=3.exp&sensor=false"></script>
    <script> var map; </script>


<script type="text/javascript">
	StoreLocatorControllersDeclarationJSStore.setCommonParameters('<c:out value="${langId}"/>','<c:out value="${WCParam.storeId}"/>','<c:out value="${WCParam.catalogId}"/>','<c:out value="${WCParam.orderId}"/>','<c:out value="${WCParam.fromPage}"/>');
	StoreLocatorContextsJS.setCommonParameters('<c:out value="${langId}"/>','<c:out value="${WCParam.storeId}"/>','<c:out value="${WCParam.catalogId}"/>','<c:out value="${WCParam.orderId}"/>','<c:out value="${WCParam.fromPage}"/>');
	
	<fmt:message bundle="${storeText}" key='MISSING_CITY' var="MISSING_CITY"/>
	<fmt:message bundle="${storeText}" key='EXCEED_PHYSICAL_STORE_SIZE' var="EXCEED_PHYSICAL_STORE_SIZE"/>
	
	MessageHelper.setMessage("MISSING_CITY", <wcf:json object="${MISSING_CITY}"/>);
	MessageHelper.setMessage("EXCEED_PHYSICAL_STORE_SIZE", <wcf:json object="${EXCEED_PHYSICAL_STORE_SIZE}"/>);

	$(document).ready(storeLocatorJSStore.initProvinceSelections);
</script>


<c:choose>
	<c:when test="${fromPage == 'ProductDetails'}">
		<c:set var="productId" value="" />
		<c:set var="catalogEntry" value="" />
		<c:if test="${!empty WCParam.productId}">
			<c:set var="productId" value="${WCParam.productId}" />
		</c:if>
		<c:if test="${!empty param.productId}">
			<c:set var="productId" value="${param.productId}" />
		</c:if>
		
		<c:if test="${!empty productId}">
			<c:catch var="searchServerException">
				<wcf:rest var="catalogNavigationView" url="${searchHostNamePath}${searchContextPath}/store/${WCParam.storeId}/productview/byId/${productId}" >	
					<wcf:param name="langId" value="${langId}"/>
					<wcf:param name="currency" value="${env_currencyCode}"/>
					<wcf:param name="responseFormat" value="json"/>		
					<wcf:param name="catalogId" value="${WCParam.catalogId}"/>
					<c:forEach var="contractId" items="${env_activeContractIds}">
						<wcf:param name="contractId" value="${contractId}"/>
					</c:forEach>
				</wcf:rest>
			</c:catch>
			<c:if test="${!empty catalogNavigationView && !empty catalogNavigationView.catalogEntryView[0]}">
				<c:set var="catalogEntry" value="${catalogNavigationView.catalogEntryView[0]}"/>
				<c:set var="typeCode" value="${catalogEntry.catalogEntryTypeCode}" />
			</c:if>
		</c:if>

		<div id="check_product_availability_container" class="contentgrad_header">
			<div id="WC_StoreLocator_div_1" class="left_corner"></div>
			<div id="WC_StoreLocator_div_2" class="left"><span class="contentgrad_text"><fmt:message bundle="${storeText}" key="STORELOCATOR_TITLE2" /></span></div>
			<div id="WC_StoreLocator_div_3" class="right_corner"></div>
		</div>
	</c:when>
</c:choose>
<a id="global-message" href="#" onclick="toggle_visibility('foo');">Temporary Store Closure Announcement  <img src="http://clipart-library.com/images/8T65ajoRc.png"></a>
<div id="foo" style="display: none;">
<p>We take great pride in being part of your most memorable moments and have been working hard to meet your evolving needs throughout the spread of COVID-19 (the coronavirus). That will continue.
<button id="global-message" onclick="showhide()" class="gb-close x" aria-controls="content-2" aria-expanded="true" aria-label="Close">x</button></p><p>At the same time, nothing is more important than the safety and wellness of our teams, customers and communities. We have been fortunate that there havenât been any reported cases of COVID-19 linked to a Menâs Wearhouse store, but based on the latest guidance from the Centers for Disease Control (CDC) and World Health Organization (WHO), we have made the decision to temporarily close all of our Menâs Wearhouse stores through the end of March to help prevent further spread of the coronavirus in our local communities.</p><p>Our employees will be paid throughout this period, and we will continue to serve our customers through our online business. <br>Specifically:</p><ol><li><strong>You can continue to shop online as usual.</strong> Our website, <a href="http://menswearhouse.com/">menswearhouse.com</a>, is not affected by the store closure. For the safety of our employees and their families, we have however temporarily closed our distribution center until at least March 28 which will delay shipments of orders. Please bear with us during this time and we will get your order to you as soon as possible.</li><li><strong>Rental and custom orders will not be available for pick up in-store.</strong> We will be reaching out directly to customers with existing orders to help them reschedule their order or provide them with either a gift card and an additional 20% discount or a refund. If you currently have a rental garment, please hold on to it. We will provide return instructions when our stores and distribution center reopen.</li><li><strong>Future rental orders can still be placed and managed online.</strong> We are ready to serve you as you prepare for future event dates. Please visit our rental pages on <a href="https://www.menswearhouse.com">menswearhouse.com</a>, to start your rental order.</li></ol><p>If you have any questions, our Customer Support team is ready to connect with you via chat, text, or email at <a href="https://www.menswearhouse.com/support">menswearhouse.com/support</a>.</p><p>We will be actively monitoring the situation and relying on guidance from the CDC, WHO and local health authorities to guide our decision on when we will reopen our stores. Thank you in advance for your understanding and continued support during this interim period.</p><p>We wish you and your loved ones good health and will provide additional updates as we have them.</p>

<div class="footer-top-sec"><button id="global-message" onclick="showhide()" class="gb-close text" aria-controls="content-2" aria-expanded="true" aria-label="Close">Collapse</button></div>

</div>	
<div id="gift_registry_box">

<c:if test="${fromPage == 'ProductDetails'}">
	<c:if test="${!empty catalogEntry}">
		<div id="check_product_availability">
			<c:choose>
				<c:when test="${(fn:startsWith(catalogEntry.thumbnail, 'http://') || fn:startsWith(catalogEntry.thumbnail, 'https://'))}">
					<wcst:resolveContentURL var="thumbNail" url="${catalogEntry.thumbnail}"/>
				</c:when>
				<c:when test="${fn:startsWith(catalogEntry.thumbnail, '/store/0/storeAsset')}">
					<c:set var="thumbNail" value="${storeContextPath}${catalogEntry.thumbnail}" />
				</c:when>
				<c:otherwise>
					<c:set var="thumbNail" value="${catalogEntry.thumbnail}" />
				</c:otherwise>
			</c:choose>
			<img src="${thumbNail}" alt="${catalogEntry.shortDescription}"/>
			<c:if test="${typeCode == 'ItemBean'}">
				<div id="WC_StoreLocator_div_7" class="product_options">
					<h1><a id="WC_StoreLocator_links_1" href='<c:out value="${ProductDisplayURL}"/>'><c:out value="${catalogEntry.name}" escapeXml="false" /></a></h1>
			</c:if>
			<c:if test="${typeCode == 'ProductBean'}">
				<div id="WC_StoreLocator_div_8" class="product_options">
					<h1><a id="WC_StoreLocator_links_2" href='<c:out value="${ProductDisplayURL}"/>'><c:out value="${catalogEntry.name}" escapeXml="false" /></a></h1>
			</c:if>
			<c:if test="${typeCode == 'PackageBean' || typeCode == 'DynamicKitBean'}">
				<div id="WC_StoreLocator_div_9" class="product_options">
					<h1><a id="WC_StoreLocator_links_3" href='<c:out value="${ProductDisplayURL}"/>'><c:out value="${catalogEntry.name}" escapeXml="false" /></a></h1>
			</c:if>
			<c:if test="${typeCode == 'BundleBean'}">
				<div id="WC_StoreLocator_div_10" class="product_options">
					<h1><a id="WC_StoreLocator_links_4" href='<c:out value="${ProductDisplayURL}"/>'><span class="bopis_link"><c:out value="${catalogEntry.name}" escapeXml="false" /></a></h1>
			</c:if>
			<div id="WC_StoreLocator_div_11" class="font3"><fmt:message bundle="${storeText}" key="PRICE_LABEL" /><%@ include file="../ReusableObjects/CatalogEntryPriceDisplay.jspf" %></div>
			</div>
		</div>
    	<br clear="all" />
	</c:if>
</c:if>
<%-- 
<c:choose>
	<c:when test="${fromPage != 'ShoppingCart'}">	
		<div class="store_locator_title"><span aria-level="1" role="heading"><fmt:message bundle="${storeText}" key="STORELOCATOR_TITLE1"/></span></div>
		<div class="gift_header"><span aria-level="2" role="heading"><fmt:message bundle="${storeText}" key="STORE_LIST_TITLE"/></span>
			<div id="hideStoreListHeader" class="checkout_show_icon" style="display:block">
				<div id="WC_StoreLocator_div_14" class="hide"><a role="button" class="tlignore" id="WC_StoreLocator_links_5" href="Javascript:storeLocatorJSStore.hideStoreList();"><fmt:message bundle="${storeText}" key="STORE_LIST_HIDE" /> <img src="<c:out value='${jspStoreImgDir}images/'/>collapse_icon.gif" border="0" alt=""/></a></div>
			</div>
			<div id="showStoreListHeader" class="checkout_show_icon" style="display:none">
				<div id="WC_StoreLocator_div_18" class="hide"><a role="button" class="tlignore" id="WC_StoreLocator_links_6" href="Javascript:storeLocatorJSStore.showStoreList();"><fmt:message bundle="${storeText}" key="STORE_LIST_SHOW" /> <img src="<c:out value='${jspStoreImgDir}images/'/>expand_icon.gif" border="0" alt=""/></a></div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="gift_header"><span aria-level="1" role="heading"><fmt:message bundle="${storeText}" key="STORE_LIST_TITLE"/></span>
			<%@ include file="../../Snippets/ReusableObjects/CheckoutTopESpotDisplay.jspf"%>
			<div id="hideStoreListHeader" class="checkout_show_icon checkout_top_location" style="display:block">
				<div id="WC_StoreLocator_div_14" class="hide"><a role="button" class="tlignore" id="WC_StoreLocator_links_5" href="Javascript:storeLocatorJSStore.hideStoreList();"><fmt:message bundle="${storeText}" key="STORE_LIST_HIDE" /> <img src="<c:out value='${jspStoreImgDir}images/'/>collapse_icon.gif" border="0" alt=""/></a></div>
			</div>
			<div id="showStoreListHeader" class="checkout_show_icon checkout_top_location" style="display:none">
				<div id="WC_StoreLocator_div_18" class="hide"><a role="button" class="tlignore" id="WC_StoreLocator_links_6" href="Javascript:storeLocatorJSStore.showStoreList();"><fmt:message bundle="${storeText}" key="STORE_LIST_SHOW" /> <img src="<c:out value='${jspStoreImgDir}images/'/>expand_icon.gif" border="0" alt=""/></a></div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
--%>
<!-- your store list -->
<%-- 
<span id="selectedStoreList_ACCE_Label" class="spanacce"><fmt:message bundle="${storeText}" key="ACCE_Region_Your_Store_List"/></span>
<div wcType="RefreshArea" id="selectedStoreList" refreshurl="<c:out value='${AjaxSelectedStoreListURL}'/>" declareFunction="StoreLocatorControllersDeclarationJSStore.selectedStoreListRefreshController()" style="display:block;" ariaMessage="<fmt:message bundle='${storeText}' key='ACCE_Status_Your_Store_List_Updated'/>" ariaLiveId="${ariaMessageNode}" role="region" aria-labelledby="selectedStoreList_ACCE_Label">
	<% out.flush(); %>
	<c:import url="/${sdb.jspStoreDir}/Snippets/StoreLocator/SelectedStoreList.jsp">
		<c:param name="storeId" value="${param.storeId}" />
		<c:param name="catalogId" value="${param.catalogId}" />
		<c:param name="langId" value="${langId}" />
	</c:import>	
	<% out.flush(); %>
</div>
--%>
<!-- your store list -->

<!-- store locator -->
<%-- 
<c:choose>
	<c:when test="${fromPage != 'ShoppingCart'}">	
		<h2 class="gift_header"><fmt:message bundle="${storeText}" key="STORELOCATOR_TITLE1"/></h2>
	</c:when>
	<c:otherwise>
		<h1 class="gift_header"><fmt:message bundle="${storeText}" key="STORELOCATOR_TITLE1"/></h1>
	</c:otherwise>
</c:choose>

<div class="gift_content">
	<a href="#" role="button" class="button_primary" id="findNearest" onclick="javascript:GeolocationJS.launch();">
		<div class="left_border"></div>
		<div class="button_text"><fmt:message bundle="${storeText}" key="MSTLOC_FIND_NEAREST" /></div>
		<div class="right_border"></div>
	</a>
</div>
--%>
<wcf:url var="StoreLocatorView1" value="AjaxStoreLocatorDisplayView">
	<wcf:param name="storeId"   value="${storeId}"  />
	<wcf:param name="catalogId" value="${catalogId}"/>
	<wcf:param name="langId" value="${langId}" />
</wcf:url>



<div class="store-breadcrumb">
<ul class="breadcrumb " itemscope="" itemtype="//schema.org/BreadcrumbList">
<li class="breadcrumb-item" itemprop="itemListElement" itemscope="" itemtype="//schema.org/ListItem">
<a itemprop="item" href="/wcs/shop/en/auroraesite">Home<meta itemprop="name" content="Home"> </a>
<span aria-hidden="true">&bull;</span> <meta itemprop="position" content="1">
</li>
<li class="breadcrumb-item" itemprop="itemListElement" itemscope="" itemtype="//schema.org/ListItem">
 <a id="storeLocatorQuickLink" href="${fn:escapeXml(StoreLocatorView1)}">&nbsp;Find a Store <!--<fmt:message bundle="${storeText}" key="HEADER_STORE_LOCATOR"/>--> </a>
<meta itemprop="position" content="2">
</li>
</ul>
</div>
<div class="storelocatr">
	<%--<span class="instruction"><fmt:message bundle="${storeText}" key="SELECT_ENTER_OPTIONS"/></span>  --%>
	</br>
	<div id="location">
		<c:set var="formName" value="searchByGeoNodeForm" />
		<form id='<c:out value="${formName}" />' name='<c:out value="${formName}" />'>

			<div id="WC_StoreLocator_div_29" class="location_select">
							 <input class="searchbox" id="zipCityInput" type="text" placeholder="ZIP or City, State" name="zipCityInput" value="${ zipCityInputValue}" aria-label="Enter State, City or Zipcode" />
			
			</div>
                    <!-- <div class="ctnr-find-btn">
                        <button class="btn btn-action btn-search icon-search" type="submit">
                            <span class="icon-text">Search store</span>
                        </button>
                    </div> -->
			<div id="WC_StoreLocator_div_38" class="location_selectbtn">
				<div id="WC_StoreLocator_div_39" class="location_select_button">
					<a href="#" role="button" class="blue-btn" id="cityGo" onclick="Javascript:setCurrentId('cityGo'); storeLocatorJSStore.refreshResultsFromCity(document.${formName}, '<c:out value='${fromPage}'/>');">FIND</a>
				</div>
			</div>
			<%@ include file="StoreLocator_body_ext.jspf"%>
		</form>
		<br clear="all"/>
	</div>
</div>

<span id="storeLocatorResults_ACCE_Label" class="spanacce"><fmt:message bundle="${storeText}" key="ACCE_Region_Store_Result_List"/></span>
<div wcType="RefreshArea" id="storeLocatorResults" refreshurl="<c:out value='${AjaxStoreLocatorResultsURL}'/>" ariaMessage="<fmt:message bundle='${storeText}' key='ACCE_Status_Store_Result_List_Updated'/>" ariaLiveId="${ariaMessageNode}" declareFunction="StoreLocatorControllersDeclarationJSStore.storeLocatorResultsRefreshController" role="region" aria-labelledby="storeLocatorResults_ACCE_Label">
	<% out.flush(); %>
	<c:import url="/${sdb.jspStoreDir}/Snippets/StoreLocator/StoreLocatorResults.jsp">
		<c:param name="storeId" value="${param.storeId}" />
		<c:param name="catalogId" value="${param.catalogId}" />
		<c:param name="langId" value="${langId}" />
	</c:import>	
	<% out.flush(); %>
</div>
<div id="temp-map">
<div  id="map-canvas"></div>
</div>
<div class="store-lo-shopnow">
<c:choose>
	<c:when test="${!empty fromUrl}">
		<div class="button_footer_line no_float">
			<a href="#" role="button" class="sl-container-link" id="continueShoppingStoreLocator" onclick="javascript:setPageLocation('<c:out value="${fromUrl}"/>')">
				<div class="left_border"></div>
				<div class="button_text">&nbsp;</div>
				<div class="right_border"></div>
			</a>
			<img alt="4 For $119 Dress Shirts" src="https://images.menswearhouse.com/is/image/TMW/20-2142749-042320-SL?scl=1&qlt=90">
		</div>
	</c:when>
	<c:when test="${fromPage == 'ProductDetails' or fromPage == 'InventoryStatus'}">
		<div class="button_footer_line no_float">
			<a href="#" role="button" class="sl-container-link" id="continueShoppingStoreLocator" onclick="javascript:setPageLocation('<c:out value="${ProductDisplayURL}"/>')">
				<div class="left_border"></div>
				<div class="button_text">&nbsp;</div>
				<div class="right_border"></div>
			</a>
			<img alt="4 For $119 Dress Shirts" src="https://images.menswearhouse.com/is/image/TMW/20-2142749-042320-SL?scl=1&qlt=90">
		</div>
	</c:when>
	<c:when test="${fromPage == 'StoreLocator'}">
		<div class="button_footer_line no_float">
			<a href="#" role="button" class="sl-container-link" id="continueShoppingStoreLocator" onclick="javascript:setPageLocation('<c:out value="${env_TopCategoriesDisplayURL}"/>')">
				<div class="left_border"></div>
				<div class="button_text">&nbsp;</div>
				<div class="right_border"></div>
			</a>
			<img alt="4 For $119 Dress Shirts" src="https://images.menswearhouse.com/is/image/TMW/20-2142749-042320-SL?scl=1&qlt=90">
		</div>
	</c:when>
</c:choose>
<div class="clear"></div>
</div>
<div id="WC_CheckoutBottomESpotDisplay_div_2" class="espot_checkout_bottom_right">
	<%out.flush();%>
		<wcpgl:widgetImport useIBMContextInSeparatedEnv="${isStoreServer}" url= "${env_siteWidgetsDir}com.ibm.commerce.store.widgets.ContentRecommendation/ContentRecommendation.jsp">
			<wcpgl:param name="storeId" value="${storeId}" />
			<wcpgl:param name="catalogId" value="${catalogId}" />
			<wcpgl:param name="emsName" value="StroeLocatorRecom" />
		</wcpgl:widgetImport>
	<%out.flush();%>									
</div>
<script>

function initialize() {

var myLatLng = {lat: 51.05000, lng:-114.05800};
  var mapOptions = {

    zoom: 8,

    center: myLatLng

  };

  map = new google.maps.Map(document.getElementById('map-canvas'),

      mapOptions);

       var marker = new google.maps.Marker({

          position: myLatLng,

          map: map

        });
}

 google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- END StoreLocator.jsp -->
