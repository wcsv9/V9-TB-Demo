<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!-- XSL Rule file to convert WCS52 to ACP-->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">PoliciesNLS</xsl:variable>


   <!-- Acattrdesc Element related Variable Definition -->
   <xsl:variable name="Acattrdesc_Element_Name">Attribute_nls</xsl:variable>

   <!-- Acactdesc Element related Variable Definition -->
   <xsl:variable name="Acactdesc_Element_Name">Action_nls</xsl:variable>

   <!-- Acreldesc Element related Variable Definition -->
   <xsl:variable name="Acreldesc_Element_Name">Relation_nls</xsl:variable>

   <!-- Acrscgdes Element related Variable Definition -->
   <xsl:variable name="Acrscgdes_Element_Name">ResourceCategory_nls</xsl:variable>

   <!-- Acacgpdesc Element related Variable Definition -->
   <xsl:variable name="Acacgpdesc_Element_Name">ActionGroup_nls</xsl:variable>

   <!-- Acresgpdes Element related Variable Definition -->
   <xsl:variable name="Acresgpdes_Element_Name">ResourceGroup_nls</xsl:variable>

   <!-- Acpoldesc Element related Variable Definition -->
   <xsl:variable name="Acpoldesc_Element_Name">Policy_nls</xsl:variable>

   <!-- Acplgpdesc Element related Variable Definition -->
   <xsl:variable name="Acplgpdesc_Element_Name">PolicyGroup_nls</xsl:variable>




<!-- Variable Name Definations Section Ends -->


<!-- Transformation Rules Section Starts -->

   <!-- Root Element Transformation Rule -->

   <xsl:strip-space elements="*"/>
   <!-- <xsl:preserve-space elements="acattr"/> -->
   
   <xsl:template match="/">
   <!--
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping = "yes">&lt;!DOCTYPE </xsl:text> 
        <xsl:value-of select="$Policies_Root_Element_Name"/> 
        <xsl:text disable-output-escaping = "yes"> SYSTEM "../dtd/accesscontrolpoliciesnls.dtd"</xsl:text> 
        <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 

        <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>        
   -->

        <xsl:element name="{$Policies_Root_Element_Name}">
   
               <xsl:variable name="LangCount1" select="count(//acattrdesc)"/> 
               <xsl:variable name="LangCount2" select="count(//acactdesc)"/> 
               <xsl:variable name="LangCount3" select="count(//acreldesc)"/> 
               <xsl:variable name="LangCount4" select="count(//acrscgdes)"/> 
               <xsl:variable name="LangCount5" select="count(//acacgpdesc)"/> 
               <xsl:variable name="LangCount6" select="count(//acresgpdes)"/> 
               <xsl:variable name="LangCount7" select="count(//acpoldesc)"/> 
               <xsl:variable name="LangCount8" select="count(//acplgpdesc)"/> 
  
  	      <xsl:choose>
  	         <xsl:when test="$LangCount1 > 1">
                     <xsl:for-each select="//acattrdesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount2 > 1">
                     <xsl:for-each select="//acactdesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount3 > 1">
                     <xsl:for-each select="//acreldesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount4 > 1">
                     <xsl:for-each select="//acrscgdes">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount5 > 1">
                     <xsl:for-each select="//acacgpdesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount6 > 1">
                     <xsl:for-each select="//acresgpdes">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
  		 </xsl:when>
  
  	         <xsl:when test="$LangCount7 > 1">
                     <xsl:for-each select="//acpoldesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
                 </xsl:when>

  	         <xsl:when test="$LangCount8 > 1">
                     <xsl:for-each select="//acplgpdesc">
                       <xsl:attribute name = "LanguageID">
                       <xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
                            <xsl:if test="$LocaleName">
                                 <xsl:apply-templates select="$LocaleName/@localename"/>
                            </xsl:if>
                       </xsl:attribute> 
                     </xsl:for-each>
                 </xsl:when>


  	      </xsl:choose>

             <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>
             <xsl:apply-templates/>
        </xsl:element>
   </xsl:template>


   <!-- Acattrdesc Element Transformation Rule -->   

   <xsl:template match="acattrdesc">

      <xsl:element name="{$Acattrdesc_Element_Name}">

        <xsl:variable name="AttrName" select="preceding::acattr[attribute::acattr_id=current()/@acattr_id]"/>

        <xsl:if test="$AttrName">
             <xsl:attribute name = "AttributeName">
              <xsl:apply-templates select="$AttrName/@attrname"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acactdesc Element Transformation Rule -->   

   <xsl:template match="acactdesc">

      <xsl:element name="{$Acactdesc_Element_Name}">

        <xsl:variable name="ActionName" select="preceding::acaction[attribute::acaction_id=current()/@acaction_id]"/>

        <xsl:if test="$ActionName">
             <xsl:attribute name = "ActionName">
              <xsl:apply-templates select="$ActionName/@action"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acreldesc Element Transformation Rule -->   

   <xsl:template match="acreldesc">

      <xsl:element name="{$Acreldesc_Element_Name}">

        <xsl:variable name="RelName" select="preceding::acrelation[attribute::acrelation_id=current()/@acrelation_id]"/>

        <xsl:if test="$RelName">
             <xsl:attribute name = "RelationName">
              <xsl:apply-templates select="$RelName/@relationname"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acrscgdes Element Transformation Rule -->   

   <xsl:template match="acrscgdes">

      <xsl:element name="{$Acrscgdes_Element_Name}">

        <xsl:variable name="RescgryName" select="preceding::acrescgry[attribute::acrescgry_id=current()/@acrescgry_id]"/>

        <xsl:if test="$RescgryName">
             <xsl:attribute name = "ResourceCategoryName">
              <xsl:apply-templates select="$RescgryName/@resclassname"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acacgpdesc Element Transformation Rule -->   

   <xsl:template match="acacgpdesc">

      <xsl:element name="{$Acacgpdesc_Element_Name}">

        <xsl:variable name="ActgrpName" select="preceding::acactgrp[attribute::acactgrp_id=current()/@acactgrp_id]"/>

        <xsl:if test="$ActgrpName">
             <xsl:attribute name = "ActionGroupName">
              <xsl:apply-templates select="$ActgrpName/@groupname"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acresgpdes Element Transformation Rule -->   

   <xsl:template match="acresgpdes">

      <xsl:element name="{$Acresgpdes_Element_Name}">

        <xsl:variable name="ResgrpName" select="preceding::acresgrp[attribute::acresgrp_id=current()/@acresgrp_id]"/>

        <xsl:if test="$ResgrpName">
             <xsl:attribute name = "ResourceGroupName">
              <xsl:apply-templates select="$ResgrpName/@grpname"/>
            </xsl:attribute>   
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


   <!-- Acpoldesc Element Transformation Rule -->   

   <xsl:template match="acpoldesc">

      <xsl:element name="{$Acpoldesc_Element_Name}">

        <xsl:variable name="PolName" select="preceding::acpolicy[attribute::acpolicy_id=current()/@acpolicy_id]"/>

        <xsl:if test="$PolName">
             <xsl:attribute name = "PolicyName">
              <xsl:apply-templates select="$PolName/@policyname"/>
            </xsl:attribute>   
            <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="$PolName/@member_id"/> 
            </xsl:attribute>
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>


<!-- Acplgpdesc Element Transformation Rule -->   

   <xsl:template match="acplgpdesc">

      <xsl:element name="{$Acplgpdesc_Element_Name}">

        <xsl:variable name="PolGrp" select="preceding::acpolgrp[attribute::acpolgrp_id=current()/@acpolgrp_id]"/>

        <xsl:if test="$PolGrp">
             <xsl:attribute name = "PolicyGroupName">
              <xsl:apply-templates select="$PolGrp/@name"/>
            </xsl:attribute>   
            <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="$PolGrp/@member_id"/> 
            </xsl:attribute>
        </xsl:if>

        <xsl:attribute name = "DisplayName_nls">
             <xsl:apply-templates select="@displayname"/>
        </xsl:attribute>

        <xsl:attribute name = "Description_nls">
             <xsl:apply-templates select="@description"/>
        </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>

   </xsl:template>



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
