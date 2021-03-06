

<% // All JSPs requires the first 4 packages for getResource.jsp which is used for multi language support %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ibm.commerce.server.*" %>
<%@ page import="com.ibm.commerce.command.*" %>
<%@ page import="com.ibm.commerce.catalog.beans.*" %>
<%@ page import="com.ibm.commerce.beans.*" %>
<%@ page import="com.ibm.commerce.catalog.objects.CatalogEntryAccessBean" %>
<%@ page import="com.ibm.commerce.tools.util.ResourceDirectory" %>
<%@ include file="../common/common.jsp" %>
<%@ include file="KitUtil.jsp" %> 

<%
try {

	CommandContext cmdContext 		= (CommandContext) request.getAttribute(com.ibm.commerce.server.ECConstants.EC_COMMANDCONTEXT);
	Locale jLocale 					= cmdContext.getLocale();
	Hashtable nlsKit 				= (Hashtable) ResourceDirectory.lookup("catalog.KitNLS", jLocale);

	
	JSPHelper jhelper 				= new JSPHelper(request);
	
	String skuString 				= jhelper.getParameter("inputSku");
	StringTokenizer st 				= null;
	String reqPara					= new String("");
	
	Vector skuInputVector 			= new Vector();
	Vector skuOutputVector 			= new Vector();
	Vector invalidSkuOutputVector 	= new Vector();
	
	Integer storeId					= cmdContext.getStoreId();
	Integer langId					= cmdContext.getLanguageId();

	// Tokenizer the skuString
	if (skuString != null) {
		st = new StringTokenizer(skuString, ",");
		while (st.hasMoreTokens()) {
			skuInputVector.add(st.nextToken().trim());
		}
	}

%>
<jsp:useBean id="catalogEntries" class="com.ibm.commerce.catalog.objects.CatalogEntryAccessBean" scope="page">
<% 
	// loop through the sku
	for (int i = 0; i < skuInputVector.size(); i++) 
	{
		Enumeration catEntry = catalogEntries.findBySKUNumberAndStore((String) skuInputVector.elementAt(i), storeId);
		Vector strSkuRecord = new Vector();
		boolean valid = true;

		// store the valid sku
		if (catEntry.hasMoreElements()) {
		
			CatalogEntryAccessBean catEntryab = (CatalogEntryAccessBean) catEntry.nextElement();
			
			// store only the itemBean type
			if (catEntryab.getType().equals("ItemBean")) {
			String catEntDesc = null;
			try{
			 	catEntDesc = catEntryab.getDescription(langId).getName();
			}
			catch (javax.persistence.NoResultException e) {
				catEntDesc = "";
			}
			
			
				strSkuRecord.add(catEntryab.getPartNumber());
				strSkuRecord.add(catEntryab.getCatalogEntryReferenceNumber());
				strSkuRecord.add(catEntDesc);
				strSkuRecord.add(catEntryab.getType());
					
				skuOutputVector.add(strSkuRecord);

			// else reject 
			} else {
				valid = false;
			}
				
		// else reject
		} else {
			valid = false;
		}
		
		if (!valid)
			invalidSkuOutputVector.add((String) skuInputVector.elementAt(i));
	}
%>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">

<%--
 =================================================================
  Licensed Materials - Property of IBM

  WebSphere Commerce

  (C) Copyright IBM Corp. 2003, 2016 All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or
  disclosure restricted by GSA ADP Schedule Contract with
  IBM Corp.
 =================================================================
--%>
<SCRIPT SRC="/wcs/javascript/tools/common/Util.js"></SCRIPT>
<SCRIPT SRC="/wcs/javascript/tools/catalog/KitContents.js"></SCRIPT>
<script src="/wcs/javascript/tools/catalog/KitWizard.js"></script>
<html>

<script language="javascript">

	var jsSkuArray = new Array();
	
	function getSku() {
		return jsSkuArray;
	}

<%

	for (int i = 0; i < skuOutputVector.size(); i++) {
	
		String strSku = (String) ((Vector) skuOutputVector.elementAt(i)).elementAt(0);
		String strCatId = (String) ((Vector) skuOutputVector.elementAt(i)).elementAt(1);
		String strItemDesc = (String) ((Vector) skuOutputVector.elementAt(i)).elementAt(2);

%>
	jsSkuArray[<%=i%>] = new SKUObj('<%=strCatId%>', '<%=UIUtil.toJavaScript(strSku)%>', '<%=UIUtil.toJavaScript(strItemDesc)%>', "", "1", <%=i%>, "ItemBean");
<%
	}
	
	if (skuOutputVector.size() > 0) {
%>
	parent.kitAddSkuTable.skuIsReady();
<%
	} 
	if (invalidSkuOutputVector.size() > 0) {
		String strMsg = new String("");
		for (int i = 0; i < invalidSkuOutputVector.size() - 1; i++) {
			strMsg += (String) invalidSkuOutputVector.elementAt(i) + ", ";
		}
		strMsg += (String) invalidSkuOutputVector.elementAt(invalidSkuOutputVector.size() - 1);
%>
	alertDialog(convertFromTextToHTML(replaceField("<%=getNLString(nlsKit,"invalidSku")%>", "?", "<%=UIUtil.toJavaScript(strMsg)%>")));
<%
	}
%>


</script>


<head>
<TITLE><%=UIUtil.toHTML((String)nlsKit.get("titleKitAddHidden"))%></TITLE>

</head>

<body marginheight="0" marginwidth="0">

</body>
</html>



<%
} 
catch (Exception e)
{
	com.ibm.commerce.exception.ExceptionHandler.displayJspException(request, response, e);
}
%>
