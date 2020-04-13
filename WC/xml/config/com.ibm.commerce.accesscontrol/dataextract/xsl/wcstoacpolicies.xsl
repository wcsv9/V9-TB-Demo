<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!-- XSL Rule file to convert WCS52 to ACP-->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">Policies</xsl:variable>

   <!-- Acattr Element related Variable Definition -->
   <xsl:variable name="Acattr_Element_Name">Attribute</xsl:variable>

   <!-- Acaction Element related Variable Definition -->
   <xsl:variable name="Acaction_Element_Name">Action</xsl:variable>

   <!-- Acrelation Element related Variable Definition -->
   <xsl:variable name="Acrelation_Element_Name">Relation</xsl:variable>

   <!-- Acrescgry Element related Variable Definition -->
   <xsl:variable name="Acrescgry_Element_Name">ResourceCategory</xsl:variable>

   <!-- Acresprim Element related Variable Definition -->
   <xsl:variable name="Acresprim_Element_Name">ResourcePrimaryColumns</xsl:variable>

   <!-- Acresatrel Element related Variable Definition -->
   <xsl:variable name="Acresatrel_Element_Name">ResourceAttributes</xsl:variable>

   <!-- Acresact Element related Variable Definition -->
   <xsl:variable name="Acresact_Element_Name">ResourceAction</xsl:variable>

   <!-- Acresrel Element related Variable Definition -->
   <xsl:variable name="Acresrel_Element_Name">ResourceRelation</xsl:variable>

   <!-- Acactgrp Element related Variable Definition -->
   <xsl:variable name="Acactgrp_Element_Name">ActionGroup</xsl:variable>

   <!-- Acactactgp Element related Variable Definition -->
   <xsl:variable name="Acactactgp_Element_Name">ActionGroupAction</xsl:variable>

   <!-- Acresgrp Element related Variable Definition -->
   <xsl:variable name="Acresgrp_Element_Name">ResourceGroup</xsl:variable>
   
      <!-- ResConditions Element related Variable Definition -->
   <xsl:variable name="ResConditions_Element_Name">ResourceCondition</xsl:variable>
   <!--  <xsl:variable name="ResTest1">&lt;![CDATA[</xsl:variable>  -->
   <!--  <xsl:variable name="ResTest2">]]&gt;</xsl:variable>  -->

   <!-- Acresgpres Element related Variable Definition -->
   <xsl:variable name="Acresgpres_Element_Name">ResourceGroupResource</xsl:variable>

   <!-- Acrelgrp Element related Variable Definition -->
   <xsl:variable name="Acrelgrp_Element_Name">RelationGroup</xsl:variable>
   
      <!-- RelConditions Element related Variable Definition -->
   <xsl:variable name="RelConditions_Element_Name">RelationCondition</xsl:variable>

   <!-- Acpolicy Element related Variable Definition -->
   <xsl:variable name="Acpolicy_Element_Name">Policy</xsl:variable>

   <!-- Acpolgrp Element related Variable Definition -->
   <xsl:variable name="Acpolgrp_Element_Name">PolicyGroup</xsl:variable>

   <!-- Acpolgppol Element related Variable Definition -->
   <xsl:variable name="Acpolgppol_Element_Name">PolicyGroupPolicy</xsl:variable>

   <!-- Acplgpsubs Element related Variable Definition -->
   <xsl:variable name="Acplgpsubs_Element_Name">PolicyGroupSubscription</xsl:variable>

   <xsl:variable name="replace1">&gt;</xsl:variable>
   <xsl:variable name="replace">&lt;</xsl:variable>
   <xsl:variable name="by">
   <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 
   </xsl:variable>

<!-- Variable Name Definations Section Ends -->


<!-- Transformation Rules Section Starts -->

   <!-- Root Element Transformation Rule -->

   <xsl:strip-space elements="*"/>
   <!-- <xsl:preserve-space elements="acresgrp"/> -->
   
   <xsl:template match="/">
   <!--
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
        <xsl:text disable-output-escaping = "yes">&lt;!DOCTYPE </xsl:text> 
        <xsl:value-of select="$Policies_Root_Element_Name"/> 
        <xsl:text disable-output-escaping = "yes"> SYSTEM "../dtd/accesscontrolpolicies.dtd"</xsl:text> 
        <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 

   <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>        
   -->
   <xsl:element name="{$Policies_Root_Element_Name}">
         <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>
         <xsl:apply-templates/>
         <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
   </xsl:element>
   </xsl:template>


   <!-- Acattr Element Transformation Rule -->   
   <xsl:template match="acattr">
   
   <xsl:element name="{$Acattr_Element_Name}">

         <!--  <xsl:attribute name = "Name">
		    <xsl:choose>
			   <xsl:when test = "string-length(@acattr_id)=0">
                          <xsl:value-of select="$Resolve_Key_Prefix" />         
                          <xsl:apply-templates select="@attrname"/>
			   </xsl:when>
		         <xsl:otherwise>  
		              <xsl:apply-templates select="@acattr_id"/>  
		         </xsl:otherwise>  
	          </xsl:choose>
         </xsl:attribute>  -->

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@attrname"/>
         </xsl:attribute>

         <xsl:attribute name = "Type">
		    <xsl:choose>
			   <xsl:when test = "@datatype=1">
                          <xsl:value-of select="'String'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=2">
                          <xsl:value-of select="'Integer'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=3">
                          <xsl:value-of select="'Double'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=4">
                          <xsl:value-of select="'Currency'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=5">
                          <xsl:value-of select="'Decimal'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=6">
                          <xsl:value-of select="'URL Link'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=7">
                          <xsl:value-of select="'Image'" />
			   </xsl:when>
			   <xsl:when test = "@datatype=8">
                          <xsl:value-of select="'Date'" />
			   </xsl:when>
	          </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
   </xsl:template>


   <!-- Acaction Element Transformation Rule -->   

   <xsl:template match="acaction">

      <xsl:element name="{$Acaction_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@action"/>
         </xsl:attribute>

         <xsl:attribute name = "CommandName">
           <xsl:apply-templates select="@action"/>
         </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>

   </xsl:template>

   <!-- Acrelation Element Transformation Rule -->   

   <xsl:template match="acrelation">
 
      <xsl:element name="{$Acrelation_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@relationname"/>
         </xsl:attribute>

      </xsl:element>

   <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
  
   </xsl:template>


   <!-- Acrescgry Element Transformation Rule -->   

   <xsl:template match="acrescgry">
  
  <!--  <xsl:strip-space elements="acrscgdes acresprim acresatrel acresact acresrel"/> -->
  
      <xsl:element name="{$Acrescgry_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@resclassname"/>
         </xsl:attribute>   

         <xsl:attribute name = "ResourceBeanClass">
           <xsl:apply-templates select="@resclassname"/>
         </xsl:attribute>

         <xsl:if test="string-length(@resprimarytable)!=0">       
            <xsl:attribute name = "PrimaryResourceTable">
               <xsl:apply-templates select="@resprimarytable"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resownertable)!=0">       
            <xsl:attribute name = "PrimaryResourceOwnerTable">
               <xsl:apply-templates select="@resownertable"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resownercol)!=0">       
            <xsl:attribute name = "PrimaryResourceOwnerColumn">
               <xsl:apply-templates select="@resownercol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@reskeyowncol)!=0">       
            <xsl:attribute name = "ResourceKeyOwnerColumn">
               <xsl:apply-templates select="@reskeyowncol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resjoinkey)!=0">       
            <xsl:attribute name = "ResourceJoinKey">
               <xsl:apply-templates select="@resjoinkey"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:variable name="ResPrimCol" select="following::acresprim[attribute::acrescgry_id=current()/@acrescgry_id]"/>

         <xsl:if test="$ResPrimCol">

             <xsl:for-each select="$ResPrimCol">
                 <xsl:call-template name="ResourcePrimaryColumns1"/>
             </xsl:for-each>

         </xsl:if>	

         <xsl:variable name="ResAttr" select="following::acresatrel[attribute::acrescgry_id=current()/@acrescgry_id]"/>
         
         <xsl:if test="$ResAttr">

             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$ResAttr">
                 <xsl:call-template name="ResourceAttributes1"/>
             </xsl:for-each>

         </xsl:if>	

         <xsl:variable name="ResAct" select="following::acresact[attribute::acrescgry_id=current()/@acrescgry_id]"/>
         
         <xsl:if test="$ResAct">

             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$ResAct">
                 <xsl:call-template name="ResourceAction1"/>
             </xsl:for-each>

         </xsl:if>	

         <xsl:variable name="ResRel" select="following::acresrel[attribute::acrescgry_id=current()/@acrescgry_id]"/>
         
         <xsl:if test="$ResRel">

             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$ResRel">
                 <xsl:call-template name="ResourceRelation1"/>
             </xsl:for-each>

         </xsl:if>	
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
  
   </xsl:template>


   <!-- Acresprim Element Transformation Rule -->  
   <xsl:template  name = "ResourcePrimaryColumns1" >
 
      <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
 
      <xsl:element name="{$Acresprim_Element_Name}">

         <xsl:attribute name = "PrimaryResourceKeyColumn">
           <xsl:apply-templates select="@resprimarycol"/>
         </xsl:attribute>   

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>
  
   </xsl:template>


<!-- Acresatrel Element Transformation Rule -->  
 
 <xsl:template  name = "ResourceAttributes1" >

    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <xsl:variable name="ResAttrRel" select="preceding::acattr[attribute::acattr_id=current()/@acattr_id]"/>

    <xsl:if test="$ResAttrRel">
 
      <xsl:element name="{$Acresatrel_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$ResAttrRel/@attrname"/>
         </xsl:attribute>   

         <xsl:attribute name = "AttributeTableName">
           <xsl:apply-templates select="@attrtblname"/>
         </xsl:attribute> 

         <xsl:attribute name = "AttributeColumnName">
           <xsl:apply-templates select="@attrcolname"/>
         </xsl:attribute> 

         <xsl:attribute name = "ResourceKeyColumnName">
           <xsl:apply-templates select="@reskeycolname"/>
         </xsl:attribute> 

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>

  </xsl:if>	

 </xsl:template>


   <!-- Acresact Element Transformation Rule -->  
 
 <xsl:template  name = "ResourceAction1" >
   
    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <xsl:variable name="ResActRel" select="preceding::acaction[attribute::acaction_id=current()/@acaction_id]"/>

    <xsl:if test="$ResActRel">
 
      <xsl:element name="{$Acresact_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$ResActRel/@action"/>
         </xsl:attribute>   

      </xsl:element>

  </xsl:if>	

 </xsl:template>


   <!-- Acresrel Element Transformation Rule -->  
 
 <xsl:template  name = "ResourceRelation1" >
   
    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <xsl:variable name="ResRelRel" select="preceding::acrelation[attribute::acrelation_id=current()/@acrelation_id]"/>

    <xsl:if test="$ResRelRel">
 
      <xsl:element name="{$Acresrel_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$ResRelRel/@relationname"/>
         </xsl:attribute>   

         <xsl:if test="string-length(@resreltable)!=0">       
            <xsl:attribute name = "RelationTable">
               <xsl:apply-templates select="@resreltable"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resrelmemcol)!=0">       
            <xsl:attribute name = "RelationMemberColumn">
               <xsl:apply-templates select="@resrelmemcol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resrelkeycol)!=0">       
            <xsl:attribute name = "RelationKeyColumn">
               <xsl:apply-templates select="@resrelkeycol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resrelcol)!=0">       
            <xsl:attribute name = "RelationNameColumn">
               <xsl:apply-templates select="@resrelcol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resjoincol)!=0">       
            <xsl:attribute name = "ResourceJoinColumn">
               <xsl:apply-templates select="@resjoincol"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@resourcetype)!=0">       
            <xsl:attribute name = "ResourceType">
               <xsl:apply-templates select="@resourcetype"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>

  </xsl:if>	

 </xsl:template>


   <!-- Acactgrp Element Transformation Rule -->   

   <xsl:template match="acactgrp">

      <xsl:element name="{$Acactgrp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@groupname"/>
         </xsl:attribute>

         <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="@member_id"/> 
         </xsl:attribute>

         <xsl:if test="string-length(@field1)!=0">       
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:variable name="ActGrpAct" select="following::acactactgp[attribute::acactgrp_id=current()/@acactgrp_id]"/>

         <xsl:if test="$ActGrpAct">

             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$ActGrpAct">
                 <xsl:call-template name="ActionGroupAction1"/>
             </xsl:for-each>

         </xsl:if>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      
   </xsl:template>


<!-- Acactactgp Element Transformation Rule -->  
 
 <xsl:template  name = "ActionGroupAction1" >

    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <xsl:variable name="ActGrpActRel" select="preceding::acaction[attribute::acaction_id=current()/@acaction_id]"/>

    <xsl:if test="$ActGrpActRel">
 
      <xsl:element name="{$Acactactgp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$ActGrpActRel/@action"/>
         </xsl:attribute>   

         <xsl:if test="string-length(@field1)!=0">
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>

  </xsl:if>	

 </xsl:template>

   <!-- Acpolgrp Element Transformation Rule -->   

   <xsl:template match="acpolgrp">

      <xsl:element name="{$Acpolgrp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@name"/>
         </xsl:attribute>

         <xsl:attribute name = "OwnerID">
		        <xsl:value-of select="@member_id"/> 
         </xsl:attribute>

         <xsl:variable name="PolGrpPol" select="following::acpolgppol[attribute::acpolgrp_id=current()/@acpolgrp_id]"/>
         <xsl:if test="$PolGrpPol">
             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$PolGrpPol">
                 <xsl:call-template name="PolicyGroupPolicy1"/>
             </xsl:for-each>
         </xsl:if>

         <xsl:variable name="PolGrpSubscription" select="following::acplgpsubs[attribute::acpolgrp_id=current()/@acpolgrp_id]"/>
         <xsl:if test="$PolGrpSubscription">
             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$PolGrpSubscription">
                 <xsl:call-template name="PolicyGroupSubscription1"/>
             </xsl:for-each>
         </xsl:if>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      
   </xsl:template>


<!-- Acpolgppol Element Transformation Rule -->  
 
 <xsl:template  name = "PolicyGroupPolicy1" >

    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <!-- Get the corresponding acpolicy record in order to retrieve the name -->
    <xsl:variable name="PolicyRel" select="preceding::acpolicy[attribute::acpolicy_id=current()/@acpolicy_id]"/>

    <!-- Get the corresponding acpolgrp record in order to check if PolicyOwnerID is needed -->
    <xsl:variable name="PolicyGroupRel" select ="preceding::acpolgrp[attribute::acpolgrp_id=current()/@acpolgrp_id]"/>

    <!-- With comments, we should get an error; otherwise we won't know if there's a problem. <xsl:if test="$PolicyRel"> -->
 
      <xsl:element name="{$Acpolgppol_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$PolicyRel/@policyname"/>
         </xsl:attribute>   

	   <xsl:if test="$PolicyRel/@member_id!=$PolicyGroupRel/@member_id"> 
         	<xsl:attribute name = "PolicyOwnerID">
            	<xsl:value-of select="$PolicyRel/@member_id"/>
            </xsl:attribute>   
         </xsl:if>
      </xsl:element>

    <!-- </xsl:if> -->
 </xsl:template>

<!-- Acplgpsubs Element Transformation Rule -->  
 
 <xsl:template  name = "PolicyGroupSubscription1" >

    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>

    <xsl:element name="{$Acplgpsubs_Element_Name}">

         <xsl:attribute name = "OrganizationID">
		        <xsl:value-of select="@orgentity_id"/> 
         </xsl:attribute>   

      </xsl:element>

 </xsl:template>

<!-- ********** END *************** -->

 <!-- Acresgrp Element Transformation Rule --> 

   <xsl:template match="acresgrp">

      <xsl:element name="{$Acresgrp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@grpname"/>
         </xsl:attribute>

         <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="@member_id"/> 
         </xsl:attribute>

         <xsl:if test="string-length(@description)!=0">
            <xsl:attribute name = "Description">
               <xsl:apply-templates select="@description"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@conditions)!=0">
            <xsl:text disable-output-escaping="yes">&#10;    </xsl:text>
            <xsl:element name="{$ResConditions_Element_Name}">
                 <xsl:text disable-output-escaping="yes">&#10;        </xsl:text>
                 <xsl:text disable-output-escaping = "yes">&lt;![CDATA[</xsl:text> 
                 <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
                 
                 <xsl:call-template name="do-replace">
                      <xsl:with-param name="text" select="string(@conditions)"/>
                 </xsl:call-template>
                 <!--  <xsl:value-of select="@conditions"/>  -->
                 <!--  <xsl:apply-templates select="@conditions"/>  -->
                 <xsl:text disable-output-escaping = "yes">           ]]&gt;</xsl:text>
                 <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
            </xsl:element>
         </xsl:if>

         <xsl:if test="string-length(@field1)!=0">
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@field2)!=0">
            <xsl:attribute name = "Field2">
               <xsl:apply-templates select="@field2"/>
            </xsl:attribute>
         </xsl:if>
         
         <xsl:variable name="ResGrpRes" select="following::acresgpres[attribute::acresgrp_id=current()/@acresgrp_id]"/>

         <xsl:if test="$ResGrpRes">

             <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
             
             <xsl:for-each select="$ResGrpRes">
                 <xsl:call-template name="ResourceGroupResource1"/>
             </xsl:for-each>

         </xsl:if>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
  
   </xsl:template>


<!-- Acresgpres Element Transformation Rule --> 
 
 <xsl:template  name = "ResourceGroupResource1" >

    <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
   
    <xsl:variable name="ResGrpResRel" select="preceding::acrescgry[attribute::acrescgry_id=current()/@acrescgry_id]"/>

    <xsl:if test="$ResGrpResRel">
 
      <xsl:element name="{$Acresgpres_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="$ResGrpResRel/@resclassname"/>
         </xsl:attribute>   

         <xsl:if test="string-length(@field1)!=0">
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>

  </xsl:if>	

 </xsl:template>


 <!-- Acrelgrp Element Transformation Rule --> 

   <xsl:template match="acrelgrp">

      <xsl:element name="{$Acrelgrp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@grpname"/>
         </xsl:attribute>

         <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="@member_id"/> 
         </xsl:attribute>

         <xsl:if test="string-length(@description)!=0">
            <xsl:attribute name = "Description">
               <xsl:apply-templates select="@description"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@conditions)!=0">
            <xsl:text disable-output-escaping="yes">&#10;    </xsl:text>
            <xsl:element name="{$RelConditions_Element_Name}">
                 <xsl:text disable-output-escaping="yes">&#10;        </xsl:text>
                 <xsl:text disable-output-escaping = "yes">&lt;![CDATA[</xsl:text> 
                 <xsl:text disable-output-escaping="yes">&#10;   </xsl:text>
                 
                 <xsl:call-template name="do-replace">
                      <xsl:with-param name="text" select="string(@conditions)"/>
                 </xsl:call-template>
                 <!--  <xsl:value-of select="@conditions"/>  -->
                 <!--  <xsl:apply-templates select="@conditions"/>  -->
                 <xsl:text disable-output-escaping = "yes">           ]]&gt;</xsl:text>
                 <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
            </xsl:element>
         </xsl:if>

         <xsl:if test="string-length(@field1)!=0">
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
  
   </xsl:template>


 <!-- Acpolicy Element Transformation Rule --> 
   
   <xsl:template match="acpolicy">

      <xsl:element name="{$Acpolicy_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@policyname"/>
         </xsl:attribute>
         
         <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="@member_id"/> 
         </xsl:attribute>

         <xsl:variable name="UserGrpName" select="preceding::mbrgrp[attribute::mbrgrp_id=current()/@mbrgrp_id]"/>

         <xsl:if test="$UserGrpName">

            <xsl:attribute name = "UserGroup">
              <xsl:apply-templates select="$UserGrpName/@mbrgrpname"/>
            </xsl:attribute>   

            <xsl:if test="@member_id!=$UserGrpName/@owner_id"> 
                 <xsl:attribute name = "UserGroupOwner">
                     <xsl:apply-templates select="$UserGrpName/@owner_id"/>
                 </xsl:attribute>   
            </xsl:if>

         </xsl:if>

         <xsl:variable name="ActionGrpName" select="preceding::acactgrp[attribute::acactgrp_id=current()/@acactgrp_id]"/>

         <xsl:if test="$ActionGrpName">
 
            <xsl:attribute name = "ActionGroupName">
              <xsl:apply-templates select="$ActionGrpName/@groupname"/>
            </xsl:attribute>   

         </xsl:if>

         <xsl:variable name="ResGrpName" select="preceding::acresgrp[attribute::acresgrp_id=current()/@acresgrp_id]"/>

         <xsl:if test="$ResGrpName">
 
            <xsl:attribute name = "ResourceGroupName">
              <xsl:apply-templates select="$ResGrpName/@grpname"/>
            </xsl:attribute>   

         </xsl:if>

         <xsl:if test="string-length(@policytype)!=0">
            <xsl:attribute name = "PolicyType">
		   <xsl:choose>
			<xsl:when test="@policytype=0"> 
	           		<xsl:value-of select="'standard'" />
               	</xsl:when>
			<xsl:when test="@policytype=1"> 
	           		<xsl:value-of select="'template'" />
               	</xsl:when>
			<xsl:when test="@policytype=2"> 
	           		<xsl:value-of select="'groupableStandard'" />
               	</xsl:when>
			<xsl:when test="@policytype=3"> 
	           		<xsl:value-of select="'groupableTemplate'" />
               	</xsl:when>
			<xsl:otherwise/>
		   </xsl:choose>
            </xsl:attribute>
         </xsl:if>

         <xsl:variable name="RelGrpName" select="preceding::acrelgrp[attribute::acrelgrp_id=current()/@acrelgrp_id]"/>

         <xsl:if test="$RelGrpName">
 
            <xsl:attribute name = "RelationGroupName">
              <xsl:apply-templates select="$RelGrpName/@grpname"/>
            </xsl:attribute>   

            <xsl:if test="@member_id!=$RelGrpName/@member_id"> 
                 <xsl:attribute name = "RelationGroupOwner">
                     <xsl:apply-templates select="$RelGrpName/@member_id"/>
                 </xsl:attribute>   
            </xsl:if>

         </xsl:if>

         <xsl:variable name="RelName" select="preceding::acrelation[attribute::acrelation_id=current()/@acrelation_id]"/>

         <xsl:if test="$RelName">
             <xsl:attribute name = "RelationName">
              <xsl:apply-templates select="$RelName/@relationname"/>
            </xsl:attribute>   
         </xsl:if>

         <xsl:if test="string-length(@field1)!=0">
            <xsl:attribute name = "Field1">
               <xsl:apply-templates select="@field1"/>
            </xsl:attribute>
         </xsl:if>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
  
   </xsl:template>


   <xsl:template name = "do-replace">
      <xsl:param name="text"/>

      <xsl:if test="contains($text,$replace)">
         <xsl:value-of select="substring-before($text,$replace)"/>
         <xsl:text disable-output-escaping = "yes">&lt;</xsl:text> 
      </xsl:if>

      <xsl:variable name="test1">
         <xsl:choose>
            <xsl:when test="contains($text,$replace)">
               <xsl:value-of select="substring-after($text,$replace)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$text"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>

      <xsl:choose>
         <xsl:when test="contains($test1,$replace1)">
            <xsl:value-of select="substring-before($test1,$replace1)"/>
            <xsl:text disable-output-escaping = "yes">&gt;&#10;</xsl:text> 

            <xsl:call-template name="do-replace">
               <xsl:with-param name="text" select="substring-after($test1,$replace1)"/>
            </xsl:call-template>

         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$test1"/>
         </xsl:otherwise>
      </xsl:choose>

   </xsl:template>


   <xsl:template name = "BlankLine" >
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
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
