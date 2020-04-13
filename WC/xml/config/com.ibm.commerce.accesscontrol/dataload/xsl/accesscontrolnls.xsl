<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--

    Name: accesscontrolnls.xsl
    Description: This file contains the xsl rule for Access control NL-enablement.

-->

<!--

    Sample code copyright information.
    ==================================


    (C) Copyright IBM Corp. 2001  All rights reserved.
 
    US Government Users Restricted Rights Use, duplication or
    disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 
    The program is provided "as is" without any warranty express or
    implied, including the warranty of non-infringement and the implied
    warranties of merchantibility and fitness for a particular purpose.
    IBM will not be liable for any damages suffered by you as a result
    of using the Program. In no event will IBM be liable for any
    special, indirect or consequential damages or lost profits even if
    IBM has been advised of the possibility of their occurrence. IBM
    will not be liable for any third party claims against you.
    
 -->


<!-- XSL Rule file to convert ACPNLS to WCS52 -->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>
      <xsl:param name="WCS_DTD_PATH" select="'../../../schema/xml/wcs.dtd'"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">import</xsl:variable>


   <!-- Acattrdesc Element related Variable Definition -->
   <xsl:variable name="Acattrdesc_Element_Name">acattrdesc</xsl:variable>

   <!-- Acactdesc Element related Variable Definition -->
   <xsl:variable name="Acactdesc_Element_Name">acactdesc</xsl:variable>

   <!-- Acreldesc Element related Variable Definition -->
   <xsl:variable name="Acreldesc_Element_Name">acreldesc</xsl:variable>

   <!-- Acrscgdes Element related Variable Definition  ACRSCGDES   -->
   <xsl:variable name="Acrscgdes_Element_Name">acrscgdes</xsl:variable>

   <!-- Acacgpdesc Element related Variable Definition -->
   <xsl:variable name="Acacgpdesc_Element_Name">acacgpdesc</xsl:variable>

   <!-- Acresgpdes Element related Variable Definition -->
   <xsl:variable name="Acresgpdes_Element_Name">acresgpdes</xsl:variable>

   <!-- Acpoldesc Element related Variable Definition -->
   <xsl:variable name="Acpoldesc_Element_Name">acpoldesc</xsl:variable>

   <!-- Acplgpdesc Element related Variable Definition -->
   <xsl:variable name="Acplgpdesc_Element_Name">acplgpdesc</xsl:variable>
  

<!-- Variable Name Definations Section Ends -->


<!-- Transformation Rules Section Starts -->

   <!-- Root Element Transformation Rule -->

   <xsl:template match="/">
   <!--
        <xsl:text disable-output-escaping = "yes">&lt;!DOCTYPE </xsl:text> 
        <xsl:value-of select="$Policies_Root_Element_Name"/> 
        <xsl:text disable-output-escaping = "yes"> SYSTEM &quot;</xsl:text> 
        <xsl:value-of select="$WCS_DTD_PATH"/> 
        <xsl:text disable-output-escaping = "yes">&quot;</xsl:text> 
        <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 
-->
      <xsl:text disable-output-escaping = "yes">&#10;&#10;</xsl:text>        
      <xsl:element name="{$Policies_Root_Element_Name}">      
             <xsl:apply-templates/> 
      </xsl:element>      
   </xsl:template>


   <!-- Acattrdesc Element Transformation Rule   -->       
   <xsl:template match="Attribute_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
      <xsl:element name="{$Acattrdesc_Element_Name}">

         <xsl:attribute name = "ACATTR_ID">
		   <xsl:choose>
			   <xsl:when test = "string-length(@acattr_id)=0"> 
                                <xsl:value-of select="$Resolve_Key_Prefix"/> 
                                <xsl:apply-templates select="@AttributeName"/> 
			   </xsl:when>
		           <xsl:otherwise>
                                <xsl:apply-templates select="@acattr_id"/>
		           </xsl:otherwise>  
		   </xsl:choose> 
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

<!--
         <xsl:call-template name="Language_nls">
             <xsl:with-param name="LanguageName" select="parent::PoliciesNLS/@LanguageID"/>
         </xsl:call-template>
-->

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>  


   <!-- Acactdesc Element Transformation Rule -->  
   <xsl:template match="Action_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
      <xsl:element name="{$Acactdesc_Element_Name}">

         <xsl:attribute name = "ACACTION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acaction_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@ActionName"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="@acaction_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>


   <!-- Acreldesc Element Transformation Rule -->   
   <xsl:template match="Relation_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acreldesc_Element_Name}">

         <xsl:attribute name = "ACRELATION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acrelation_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@RelationName"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acrelation_id"/>  
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>


   <!-- Acrscgdes Element Transformation Rule -->   
   <xsl:template match="ResourceCategory_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acrscgdes_Element_Name}">

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@ResourceCategoryName"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acrescgry_id"/>  
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>
 
         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>


   <!-- Acacgpdesc Element Transformation Rule -->   
   <xsl:template match="ActionGroup_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acacgpdesc_Element_Name}">

         <xsl:attribute name = "ACACTGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acactgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@ActionGroupName"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acactgrp_id"/>  
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:value-of select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>


   <!-- Acresgpdes Element Transformation Rule -->   
   <xsl:template match="ResourceGroup_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acresgpdes_Element_Name}">

         <xsl:attribute name = "ACRESGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acresgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@ResourceGroupName"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acresgrp_id"/>  
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>

   <!-- Acpoldesc Element Transformation Rule -->   
   <xsl:template match="Policy_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acpoldesc_Element_Name}">

         <xsl:attribute name = "ACPOLICY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acpolicy_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@PolicyName"/>   
	                      <xsl:choose>
	                           <xsl:when test="@OwnerID='RootOrganization'">
                                        <xsl:value-of select="$Resolve_Key_Prefix"/>         
                                        <xsl:value-of select="-2001"/>
		                   </xsl:when>
	                           <xsl:when test="@OwnerID='DefaultOrganization'">
                                        <xsl:value-of select="$Resolve_Key_Prefix"/>         
                                        <xsl:value-of select="-2000"/>
		                   </xsl:when>
		                   <xsl:otherwise> 
		                        <xsl:value-of select="$Resolve_Key_Prefix"/> 
		                        <xsl:apply-templates select="@OwnerID"/> 
		                   </xsl:otherwise>  
                              </xsl:choose>
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acpolicy_id"/>  
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>

   <!-- Acplgpdesc Element Transformation Rule -->   
   <xsl:template match="PolicyGroup_nls">
   
   <xsl:text disable-output-escaping = "yes">&#10;   </xsl:text>
    <xsl:element name="{$Acplgpdesc_Element_Name}">

         <xsl:attribute name = "ACPOLGRP_ID">
	         <xsl:value-of select="$Resolve_Key_Prefix" />         
               <xsl:value-of select="@PolicyGroupName"/>   

               <xsl:value-of select="$Resolve_Key_Prefix"/>         
		   <xsl:choose>
	               <xsl:when test="@OwnerID='RootOrganization'">
	                     <xsl:value-of select="-2001"/>
	               </xsl:when>
	               <xsl:when test="@OwnerID='DefaultOrganization'">
                           <xsl:value-of select="-2000"/>
	               </xsl:when>
	               <xsl:otherwise> 
	                     <xsl:apply-templates select="@OwnerID"/> 
	               </xsl:otherwise>  
               </xsl:choose>
         </xsl:attribute>

	   <xsl:attribute name = "DISPLAYNAME">
            <xsl:apply-templates select="@DisplayName_nls"/>
         </xsl:attribute>
       
         <xsl:attribute name = "DESCRIPTION">
            <xsl:apply-templates select="@Description_nls"/>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::PoliciesNLS/@LanguageID" /> 
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>      
   </xsl:template>


<!--
   <xsl:template name = "Language_nls" >
   <xsl:param name="LanguageName"/> 

         <xsl:attribute name = "LANGUAGE_ID">
   		    <xsl:choose>
   		           <xsl:when test = "$LanguageName='en_US'">
                             <xsl:value-of select="-1" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='fr_FR'">
                             <xsl:value-of select="-2" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='de_DE'">
                             <xsl:value-of select="-3" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='it_IT'">
                             <xsl:value-of select="-4" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='es_ES'">
                             <xsl:value-of select="-5" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='pt_BR'">
                             <xsl:value-of select="-6" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='zh_CN'">
                             <xsl:value-of select="-7" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='zh_TW'">
                             <xsl:value-of select="-8" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='ko_KR'">
                             <xsl:value-of select="-9" />
   			   </xsl:when>
   			   <xsl:when test = "$LanguageName='ja_JP'">
                             <xsl:value-of select="-10" />
   			   </xsl:when>
   	          </xsl:choose>
         </xsl:attribute>

   </xsl:template>
-->


<!-- Transformation Rules Section Ends -->
      
</xsl:stylesheet>


<!-- 

    CMVC control information.
    =========================
    Workfile       :  
    Version        :  1.0
    Put Timestamp  :  01/05/27 14:30:07
    Last Updated   :  01/06/04 20:29:27
    Author         :  Rathinagopal Sankaranarayanan

-->
