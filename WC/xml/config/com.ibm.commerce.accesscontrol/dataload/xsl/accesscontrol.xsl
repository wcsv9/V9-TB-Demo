<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--

    Sample code copyright information.
    ==================================


    (C) Copyright IBM Corp. 2019  All rights reserved.
 
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


<!-- XSL Rule file to convert ACP to WCS52 -->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>
      <xsl:param name="WCS_DTD_PATH" select="'../wcs.dtd'"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>
   <xsl:variable name="CONDITIONS_Default">testdata</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">import</xsl:variable>


   <!-- Acattr Element related Variable Definition -->
   <xsl:variable name="Acattr_Element_Name">acattr</xsl:variable>

   <!-- Acaction Element related Variable Definition -->
   <xsl:variable name="Acaction_Element_Name">acaction</xsl:variable>

   <!-- Acrelation Element related Variable Definition -->
   <xsl:variable name="Acrelation_Element_Name">acrelation</xsl:variable>

   <!-- Acrescgry Element related Variable Definition -->
   <xsl:variable name="Acrescgry_Element_Name">acrescgry</xsl:variable>

   <!-- Acresprim Element related Variable Definition -->
   <xsl:variable name="Acresprim_Element_Name">acresprim</xsl:variable>

   <!-- Acresatrel Element related Variable Definition -->
   <xsl:variable name="Acresatrel_Element_Name">acresatrel</xsl:variable>

   <!-- Acresact Element related Variable Definition -->
   <xsl:variable name="Acresact_Element_Name">acresact</xsl:variable>

   <!-- Acresrel Element related Variable Definition -->
   <xsl:variable name="Acresrel_Element_Name">acresrel</xsl:variable>

   <!-- Acactgrp Element related Variable Definition -->
   <xsl:variable name="Acactgrp_Element_Name">acactgrp</xsl:variable>

   <!-- Acactactgp Element related Variable Definition -->
   <xsl:variable name="Acactactgp_Element_Name">acactactgp</xsl:variable>

   <!-- Acresgrp Element related Variable Definition -->
   <xsl:variable name="Acresgrp_Element_Name">acresgrp</xsl:variable>

   <!-- Acresgpres Element related Variable Definition -->
   <xsl:variable name="Acresgpres_Element_Name">acresgpres</xsl:variable>

   <!-- Acrelgrp Element related Variable Definition -->
   <xsl:variable name="Acrelgrp_Element_Name">acrelgrp</xsl:variable>

   <!-- Acpolicy Element related Variable Definition -->
   <xsl:variable name="Acpolicy_Element_Name">acpolicy</xsl:variable>

   <xsl:variable name="AcresrelTable_Column_Value">""</xsl:variable>
   <xsl:variable name="AcresrelmemCol_Column_Value">""</xsl:variable>

   <!-- Acpolgrp Element related Variable Definition -->
   <xsl:variable name="Acpolgrp_Element_Name">acpolgrp</xsl:variable>

   <!-- Acpolgppol Element related Variable Definition -->
   <xsl:variable name="Acpolgppol_Element_Name">acpolgppol</xsl:variable>

   <!-- Acplgpsubs Element related Variable Definition -->
   <xsl:variable name="Acplgpsubs_Element_Name">acplgpsubs</xsl:variable>



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
      <xsl:element name="{$Policies_Root_Element_Name}">      
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>


   <!-- Acattr Element Transformation Rule -->   
   <xsl:template match="Attribute">
 
      <xsl:element name="{$Acattr_Element_Name}">

         <xsl:attribute name = "ACATTR_ID">
		    <xsl:choose>
			   <xsl:when test = "string-length(@acattr_id)=0">
                          <xsl:value-of select="$Resolve_Key_Prefix" />         
                          <xsl:apply-templates select="@Name"/>
			   </xsl:when>
		         <xsl:otherwise>  
		              <xsl:apply-templates select="@acattr_id"/>  
		         </xsl:otherwise>  
	          </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ATTRNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>        

	   <xsl:attribute name = "DATATYPE">
		    <xsl:choose>
			   <xsl:when test = "@Type='String'">
                          <xsl:value-of select="1" />
			   </xsl:when>
			   <xsl:when test = "@Type='Integer'">
                          <xsl:value-of select="2" />
			   </xsl:when>
			   <xsl:when test = "@Type='Double'">
                          <xsl:value-of select="3" />
			   </xsl:when>
			   <xsl:when test = "@Type='Currency'">
                          <xsl:value-of select="4" />
			   </xsl:when>
			   <xsl:when test = "@Type='Decimal'">
                          <xsl:value-of select="5" />
			   </xsl:when>
			   <xsl:when test = "@Type='URL Link'">
                          <xsl:value-of select="6" />
			   </xsl:when>
			   <xsl:when test = "@Type='Image'">
                          <xsl:value-of select="7" />
			   </xsl:when>
			   <xsl:when test = "@Type='Date'">
                          <xsl:value-of select="8" />
			   </xsl:when>
	          </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>
         
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
  
   </xsl:template>
   
   
   <!-- Acaction Element Transformation Rule -->   
   <xsl:template match="Action">

      <xsl:element name="{$Acaction_Element_Name}">

         <xsl:attribute name = "ACACTION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acaction_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@CommandName"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acaction_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACTION">
           <xsl:apply-templates select="@CommandName"/>
         </xsl:attribute>
	
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:template>


   <!-- Acrelation Element Transformation Rule -->   
   <xsl:template match="Relation">

      <xsl:element name="{$Acrelation_Element_Name}">

         <xsl:attribute name = "ACRELATION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acrelation_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@Name"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acrelation_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "RELATIONNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>
	
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
  </xsl:template>  
   
  
  <!-- Acrescgry Element Transformation Rule -->   
   
   <xsl:template match="ResourceCategory">

      <xsl:element name="{$Acrescgry_Element_Name}">

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@ResourceBeanClass"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acrescgry_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@PrimaryResourceTable)!=0"> 
            <xsl:attribute name = "RESPRIMARYTABLE">
               <xsl:apply-templates select="@PrimaryResourceTable"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@PrimaryResourceOwnerTable)!=0"> 
            <xsl:attribute name = "RESOWNERTABLE">
               <xsl:apply-templates select="@PrimaryResourceOwnerTable"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@PrimaryResourceOwnerColumn)!=0"> 
            <xsl:attribute name = "RESOWNERCOL">
               <xsl:apply-templates select="@PrimaryResourceOwnerColumn"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@ResourceKeyOwnerColumn)!=0"> 
            <xsl:attribute name = "RESKEYOWNCOL">
               <xsl:apply-templates select="@ResourceKeyOwnerColumn"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:attribute name = "RESCLASSNAME">
           <xsl:apply-templates select="@ResourceBeanClass"/>
         </xsl:attribute>

         <xsl:if test="string-length(@ResourceJoinKey)!=0">       
            <xsl:attribute name = "RESJOINKEY">
               <xsl:apply-templates select="@ResourceJoinKey"/>
            </xsl:attribute>
         </xsl:if>
         
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

      <xsl:for-each select="./ResourcePrimaryColumns">
         <xsl:call-template name="ResourcePrimaryColumns"/>
      </xsl:for-each>

      <xsl:for-each select="./ResourceAttributes">
         <xsl:call-template name="ResourceAttributes"/>
      </xsl:for-each>

      <xsl:for-each select="./ResourceAction">
         <xsl:call-template name="ResourceAction"/>
      </xsl:for-each>

      <xsl:for-each select="./ResourceRelation">
         <xsl:call-template name="ResourceRelation"/>
      </xsl:for-each>

   </xsl:template>


   <!-- Acresprim Element Transformation Rule -->  
   <xsl:template match="ResourcePrimaryColumns" name = "ResourcePrimaryColumns" >
 
      <xsl:element name="{$Acresprim_Element_Name}">

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ResourceCategory/@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ResourceCategory/@ResourceBeanClass"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ResourceCategory/@acrescgry_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

	 <xsl:attribute name = "RESPRIMARYCOL">
            <xsl:apply-templates select="@PrimaryResourceKeyColumn"/>
         </xsl:attribute>
       
         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
   </xsl:template>

   <!-- Acresatrel Element Transformation Rule -->  
 
 <xsl:template match="ResourceAttributes" name = "ResourceAttributes" >
   
   <!--  <xsl:if test="string-length(/descendant::Attribute[attribute::Name=current()/@Name])!=0">  -->
    <xsl:variable name="ResAttr" select="preceding::Attribute[attribute::Name=current()/@Name]"/>
    <xsl:if test="$ResAttr"> 
 
      <xsl:element name="{$Acresatrel_Element_Name}">

         <xsl:attribute name = "ACATTR_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::Attribute[attribute::Name=current()/@Name]/@acattr_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@Name"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::Attribute[attribute::Name=current()/@Name]/@acattr_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ResourceCategory/@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ResourceCategory/@ResourceBeanClass"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ResourceCategory/@acrescgry_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ATTRTBLNAME">
           <xsl:apply-templates select="@AttributeTableName"/>
         </xsl:attribute>

         <xsl:attribute name = "ATTRCOLNAME">
           <xsl:apply-templates select="@AttributeColumnName"/>
         </xsl:attribute>

         <xsl:attribute name = "RESKEYCOLNAME">
           <xsl:apply-templates select="@ResourceKeyColumnName"/>
         </xsl:attribute>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:if>

   </xsl:template>


   <!-- Acresact Element Transformation Rule -->  
 
 <xsl:template match="ResourceAction" name = "ResourceAction" >
   
   <!--  <xsl:if test="string-length(/descendant::Action[attribute::Name=current()/@Name])!=0"> -->
   
    <xsl:variable name="ResAction" select="preceding::Action[attribute::Name=current()/@Name]"/>
    <xsl:if test="$ResAction"> 
 
      <xsl:element name="{$Acresact_Element_Name}">

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ResourceCategory/@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ResourceCategory/@ResourceBeanClass"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ResourceCategory/@acrescgry_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACACTION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::Action[attribute::Name=current()/@Name]/@acaction_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <!--  <xsl:apply-templates select="@CommandName"/>  -->
                              <xsl:apply-templates select="/descendant::Action[attribute::Name=current()/@Name]/@CommandName"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::Action[attribute::Name=current()/@Name]/@acaction_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>
	
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:if>


   </xsl:template>
   

   <!-- Acresrel Element Transformation Rule -->  
 
 <xsl:template match="ResourceRelation" name = "ResourceRelation" >
   
   <!--  <xsl:if test="string-length(/descendant::Relation[attribute::Name=current()/@Name])!=0">  -->
    <xsl:variable name="ResRelation" select="preceding::Relation[attribute::Name=current()/@Name]"/>
    <xsl:if test="$ResRelation"> 
      <xsl:element name="{$Acresrel_Element_Name}">

         <xsl:attribute name = "ACRELATION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::Relation[attribute::Name=current()/@Name]/@acrelation_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@Name"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::Relation[attribute::Name=current()/@Name]/@acrelation_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ResourceCategory/@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ResourceCategory/@ResourceBeanClass"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ResourceCategory/@acrescgry_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "RESRELTABLE">
              <xsl:if test="string-length(@RelationTable)!=0">         
                  <xsl:apply-templates select="@RelationTable"/>
              </xsl:if>
              <xsl:if test="string-length(@RelationTable)=0">         
	          <xsl:value-of select="$AcresrelTable_Column_Value"/>
              </xsl:if>
         </xsl:attribute>

         <xsl:attribute name = "RESRELMEMCOL">
              <xsl:if test="string-length(@RelationMemberColumn)!=0">         
                  <xsl:apply-templates select="@RelationMemberColumn"/>
              </xsl:if>
              <xsl:if test="string-length(@RelationMemberColumn)=0">         
	          <xsl:value-of select="$AcresrelmemCol_Column_Value"/>
              </xsl:if>
         </xsl:attribute>

         <xsl:if test="string-length(@RelationKeyColumn)!=0">
            <xsl:attribute name = "RESRELKEYCOL">
               <xsl:apply-templates select="@RelationKeyColumn"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@RelationNameColumn)!=0">
            <xsl:attribute name = "RESRELCOL">
               <xsl:apply-templates select="@RelationNameColumn"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@ResourceJoinColumn)!=0">       
            <xsl:attribute name = "RESJOINCOL">
               <xsl:apply-templates select="@ResourceJoinColumn"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@ResourceType)!=0">       
            <xsl:attribute name = "RESOURCETYPE">
               <xsl:apply-templates select="@ResourceType"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:if>

   </xsl:template>


   <!-- Acactgrp Element Transformation Rule -->   

   <xsl:template match="ActionGroup">

      <xsl:element name="{$Acactgrp_Element_Name}">

         <xsl:attribute name = "ACACTGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acactgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@Name"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acactgrp_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "GROUPNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name = "MEMBER_ID">
           <xsl:apply-templates select="@OwnerID"/>
         </xsl:attribute>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

	
         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
      <xsl:for-each select="./ActionGroupAction">
         <xsl:call-template name="ActionGroupAction"/>
      </xsl:for-each>
      
  </xsl:template>  


  <!-- Acactactgp Element Transformation Rule -->  
 
  <xsl:template match="ActionGroupAction" name = "ActionGroupAction" >
   
   <!--  <xsl:if test="string-length(/descendant::Action[attribute::Name=current()/@Name])!=0"> -->
    <xsl:variable name="ActGrpAct" select="preceding::Action[attribute::Name=current()/@Name]"/>
    <xsl:if test="$ActGrpAct">
      <xsl:element name="{$Acactactgp_Element_Name}">

         <xsl:attribute name = "ACACTGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ActionGroup/@acactgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ActionGroup/@Name"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ActionGroup/@acactgrp_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACACTION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::Action[attribute::Name=current()/@Name]/@acaction_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                                 <!--  <xsl:apply-templates select="@Name"/>  -->
                              <xsl:apply-templates select="/descendant::Action[attribute::Name=current()/@Name]/@CommandName"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::Action[attribute::Name=current()/@Name]/@acaction_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:if>
  
   </xsl:template>

   <!-- Acpolgrp Element Transformation Rule -->   

   <xsl:template match="PolicyGroup">

      <xsl:element name="{$Acpolgrp_Element_Name}">

         <xsl:attribute name = "ACPOLGRP_ID">
	       <xsl:value-of select="$Resolve_Key_Prefix" />         
             <xsl:apply-templates select="@Name"/>   
             <!-- Do not allow the specification of acpolgrp_id -->

		<xsl:value-of select="$Resolve_Key_Prefix" />         
		<xsl:choose>
			<xsl:when test="@OwnerID='RootOrganization'">
				<xsl:value-of select="-2001" />
			</xsl:when>
			<xsl:when test="@OwnerID='DefaultOrganization'">
				<xsl:value-of select="-2000" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@OwnerID"/>
			</xsl:otherwise>
		</xsl:choose>

	   </xsl:attribute>

         <xsl:attribute name = "NAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name = "MEMBER_ID">
		<xsl:choose>
			<xsl:when test="@OwnerID='RootOrganization'">
				<xsl:value-of select="-2001" />
			</xsl:when>
			<xsl:when test="@OwnerID='DefaultOrganization'">
				<xsl:value-of select="-2000" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@OwnerID"/>
			</xsl:otherwise>
		</xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
      <xsl:for-each select="./PolicyGroupPolicy">
         <xsl:call-template name="PolicyGroupPolicy"/>
      </xsl:for-each>

      <xsl:for-each select="./PolicyGroupSubscription">
         <xsl:call-template name="PolicyGroupSubscription"/>
	</xsl:for-each>
      
  </xsl:template>  


  <!-- ******* Acpolgppol Element Transformation Rule ************* -->  
 
  <xsl:template match="PolicyGroupPolicy" name = "PolicyGroupPolicy" >
    
   <xsl:variable name="PolGrpPol" select="preceding::Policy[attribute::Name=current()/@Name]"/>
   <xsl:if test="$PolGrpPol">
    <xsl:if test="$PolGrpPol/@PolicyType='groupableStandard' or $PolGrpPol/@PolicyType='groupableTemplate'">
      <xsl:element name="{$Acpolgppol_Element_Name}">

         <xsl:attribute name = "ACPOLGRP_ID">
		<xsl:value-of select="$Resolve_Key_Prefix" />         
		<xsl:value-of select="parent::PolicyGroup/@Name"/>

		<xsl:value-of select="$Resolve_Key_Prefix" />         
		<xsl:choose>
			<xsl:when test="parent::PolicyGroup/@OwnerID='RootOrganization'">
				<xsl:value-of select="-2001" />
			</xsl:when>
			<xsl:when test="parent::PolicyGroup/@OwnerID='DefaultOrganization'">
				<xsl:value-of select="-2000" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="parent::PolicyGroup/@OwnerID"/>
			</xsl:otherwise>
		</xsl:choose>
	   </xsl:attribute>

         <xsl:attribute name = "ACPOLICY_ID">
             <xsl:value-of select="$Resolve_Key_Prefix" /> 
		 <xsl:value-of select="@Name" />
		 <!-- <xsl:apply-templates select="/descendant::Policy[attribute::Name=current()/@Name]/@Name"/>  -->

 		 <xsl:value-of select="$Resolve_Key_Prefix" />
		 <xsl:if test="string-length(@PolicyOwnerID)=0">
			<xsl:choose>
				<xsl:when test="parent::PolicyGroup/@OwnerID='RootOrganization'">
					<xsl:value-of select="-2001" />
				</xsl:when>
				<xsl:when test="parent::PolicyGroup/@OwnerID='DefaultOrganization'">
					<xsl:value-of select="-2000" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="parent::PolicyGroup/@OwnerID"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

		<xsl:if test="string-length(@PolicyOwnerID)!=0">
			<xsl:choose>
				<xsl:when test="@PolicyOwnerID='RootOrganization'">
					<xsl:value-of select="-2001" />
				</xsl:when>
				<xsl:when test="@PolicyOwnerID='DefaultOrganization'">
					<xsl:value-of select="-2000" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@PolicyOwnerID"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

	     </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
    </xsl:if>
    <xsl:if test="not($PolGrpPol/@PolicyType='groupableStandard' or $PolGrpPol/@PolicyType='groupableTemplate')">
	<!-- This policy has the incorrect policy type. -->
	<xsl:message terminate="no">
		Error: PolicyType of policy <xsl:value-of select ="./@Name" /> should be either groupableStandard or groupableTemplate.
	</xsl:message>
    </xsl:if>
  </xsl:if>
  <xsl:if test ="not($PolGrpPol)">
	<!-- This policy has not been previously defined. Log error and continue. -->
	<xsl:message terminate="no">
		Error: Policy <xsl:value-of select ="./@Name" /> is not defined.
	</xsl:message>
  </xsl:if>
 </xsl:template>

  <!-- Acplgpsubs Element Transformation Rule -->  
    
  <xsl:template match="PolicyGroupSubscription" name = "PolicyGroupSubscription" >

      <xsl:element name="{$Acplgpsubs_Element_Name}">

         <xsl:attribute name = "ACPOLGRP_ID">
		<xsl:value-of select="$Resolve_Key_Prefix" />
		<xsl:value-of select="parent::PolicyGroup/@Name"/>

		<xsl:value-of select="$Resolve_Key_Prefix" />         
		<xsl:choose>
			<xsl:when test="parent::PolicyGroup/@OwnerID='RootOrganization'">
				<xsl:value-of select="-2001" />
			</xsl:when>
			<xsl:when test="parent::PolicyGroup/@OwnerID='DefaultOrganization'">
				<xsl:value-of select="-2000" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="parent::PolicyGroup/@OwnerID"/>
			</xsl:otherwise>
		</xsl:choose>
	   </xsl:attribute>

         <xsl:attribute name = "ORGENTITY_ID">
		
		<xsl:choose> 
			<xsl:when test="@OrganizationID='RootOrganization'">
				<xsl:value-of select="-2001" />
			</xsl:when>
			<xsl:when test="@OrganizationID='DefaultOrganization'">
				<xsl:value-of select="-2000" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@OrganizationID" />
			</xsl:otherwise>
		</xsl:choose>
	   </xsl:attribute>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

   </xsl:template>


<!-- *********** END ************** -->


   <!-- Acresgrp Element Transformation Rule -->   

   <xsl:template match="ResourceGroup">

      <xsl:element name="{$Acresgrp_Element_Name}">

         <xsl:attribute name = "ACRESGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acresgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@Name"/>   
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@acresgrp_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "MEMBER_ID">
           <xsl:apply-templates select="@OwnerID"/>
         </xsl:attribute>

         <xsl:attribute name = "GRPNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:if test="string-length(@Description)!=0"> 
            <xsl:attribute name = "DESCRIPTION">
               <xsl:apply-templates select="@Description"/>
            </xsl:attribute>
         </xsl:if> 

         <xsl:variable name="CondVar1" select="./ResourceCondition"/>

         <xsl:if test="$CondVar1">
            <xsl:attribute name = "CONDITIONS">
               <xsl:value-of select="ResourceCondition"/>
            </xsl:attribute>
	 </xsl:if> 
	
         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@Field2)!=0">       
            <xsl:attribute name = "FIELD2">
               <xsl:apply-templates select="@Field2"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
      <xsl:for-each select="./ResourceGroupResource">
         <xsl:call-template name="ResourceGroupResource"/>
      </xsl:for-each>
      
  </xsl:template>  


  <!-- Acresgpres Element Transformation Rule -->  
 
  <xsl:template match="ResourceGroupResource" name = "ResourceGroupResource" >
   
   <!--  <xsl:if test="string-length(/descendant::ResourceCategory[attribute::Name=current()/@Name])!=0"> -->
    <xsl:variable name="ResGrpRes" select="preceding::ResourceCategory[attribute::Name=current()/@Name]"/>
    <xsl:if test="$ResGrpRes">
 
      <xsl:element name="{$Acresgpres_Element_Name}">

         <xsl:attribute name = "ACRESGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::ResourceGroup/@acresgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::ResourceGroup/@Name"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::ResourceGroup/@acresgrp_id"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACRESCGRY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::ResourceCategory[attribute::Name=current()/@Name]/@acrescgry_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                                <!--  <xsl:apply-templates select="@Name"/>  -->
                                <xsl:apply-templates select="/descendant::ResourceCategory[attribute::Name=current()/@Name]/@ResourceBeanClass"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::ResourceCategory[attribute::Name=current()/@Name]/@acrescgry_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

    </xsl:if> 
  
   </xsl:template>


   <!-- Acrelgrp Element Transformation Rule -->   

   <xsl:template match="RelationGroup">

      <xsl:element name="{$Acrelgrp_Element_Name}">

         <xsl:attribute name = "ACRELGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acrelgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@Name"/>   
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
		              <xsl:apply-templates select="@acrelgrp_id"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "MEMBER_ID">
           <xsl:apply-templates select="@OwnerID"/>
         </xsl:attribute>

         <xsl:attribute name = "GRPNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:if test="string-length(@Description)!=0"> 
            <xsl:attribute name = "DESCRIPTION">
               <xsl:apply-templates select="@Description"/>
            </xsl:attribute>
         </xsl:if> 

         <xsl:variable name="CondVar2" select="./RelationCondition"/>

         <xsl:if test="$CondVar2">
            <xsl:attribute name = "CONDITIONS">
               <xsl:value-of select="RelationCondition"/>
            </xsl:attribute>
	 </xsl:if> 
	
         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>
      
   </xsl:template>  


   <!-- Acpolicy Element Transformation Rule -->   
   <xsl:template match="Policy">

      <xsl:element name="{$Acpolicy_Element_Name}">

         <xsl:attribute name = "ACPOLICY_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@acpolicy_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@Name"/>   
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

         <xsl:attribute name = "POLICYNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name = "MEMBER_ID">
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

         <xsl:attribute name = "MBRGRP_ID">

         <xsl:if test="string-length(@UserGroupOwner)!=0">       
	      <xsl:choose>
	           <xsl:when test="@UserGroupOwner='RootOrganization'">
                        <xsl:value-of select="$Resolve_Key_Prefix"/>         
                        <xsl:value-of select="-2001"/>
		   </xsl:when>
	           <xsl:when test="@UserGroupOwner='DefaultOrganization'">
                        <xsl:value-of select="$Resolve_Key_Prefix"/>         
                        <xsl:value-of select="-2000"/>
		   </xsl:when>
		   <xsl:otherwise> 
		        <xsl:value-of select="$Resolve_Key_Prefix"/> 
		        <xsl:apply-templates select="@UserGroupOwner"/> 
		   </xsl:otherwise>  
              </xsl:choose>
         </xsl:if>

         <xsl:if test="string-length(@UserGroupOwner)=0">       
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
         </xsl:if>

           <xsl:value-of select="$Resolve_Key_Prefix" /> 
           <xsl:apply-templates select="@UserGroup"/> 
		    <!--  <xsl:choose>
			 <xsl:when test = "string-length(/descendant::UserGroup[attribute::Name=current()/@UserGroup]/@MemberGroupID)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@UserGroup"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::UserGroup[attribute::Name=current()/@UserGroup]/@MemberGroupID"/> 
		         </xsl:otherwise>
		    </xsl:choose>   -->
         </xsl:attribute>

         <xsl:attribute name = "ACACTGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::ActionGroup[attribute::Name=current()/@ActionGroupName]/@acactgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@ActionGroupName"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::ActionGroup[attribute::Name=current()/@ActionGroupName]/@acactgrp_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "ACRESGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::ResourceGroup[attribute::Name=current()/@ResourceGroupName]/@acresgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@ResourceGroupName"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::ResourceGroup[attribute::Name=current()/@ResourceGroupName]/@acresgrp_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
         </xsl:attribute>

         <xsl:if test="string-length(@PolicyType)!=0"> 
            <xsl:attribute name = "POLICYTYPE">
               <!--  <xsl:apply-templates select="@PolicyType"/>  -->
		   <xsl:choose>
               	<xsl:when test="@PolicyType='template'"> 
	           		<xsl:value-of select="1" />
               	</xsl:when>
               	<xsl:when test="@PolicyType='standard'"> 
	          		<xsl:value-of select="0" />
               	</xsl:when>
			<xsl:when test="@PolicyType='groupableStandard'"> 
	           		<xsl:value-of select="2" />
               	</xsl:when>
               	<xsl:when test="@PolicyType='groupableTemplate'"> 
	          		<xsl:value-of select="3" />
               	</xsl:when>
			<xsl:otherwise />
		   </xsl:choose>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@RelationGroupName)!=0"> 
            <xsl:attribute name = "ACRELGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::RelationGroup[attribute::Name=current()/@RelationGroupName]/@acrelgrp_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@RelationGroupName"/> 

			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::RelationGroup[attribute::Name=current()/@RelationGroupName]/@acrelgrp_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>

                    <xsl:if test="string-length(@RelationGroupOwner)!=0">       
	              <xsl:choose>
	                <xsl:when test="@RelationGroupOwner='RootOrganization'">
                          <xsl:value-of select="$Resolve_Key_Prefix"/>         
                          <xsl:value-of select="-2001"/>
		        </xsl:when>
	                <xsl:when test="@RelationGroupOwner='DefaultOrganization'">
                          <xsl:value-of select="$Resolve_Key_Prefix"/>         
                          <xsl:value-of select="-2000"/>
		        </xsl:when>
		        <xsl:otherwise> 
		          <xsl:value-of select="$Resolve_Key_Prefix"/> 
		          <xsl:apply-templates select="@RelationGroupOwner"/> 
		        </xsl:otherwise>  
                      </xsl:choose>
                    </xsl:if>

                    <xsl:if test="string-length(@RelationGroupOwner)=0">       
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
		          <xsl:value-of select="-2001"/> 
		        </xsl:otherwise>  
                      </xsl:choose>
                    </xsl:if>
             </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@RelationName)!=0"> 
            <xsl:attribute name = "ACRELATION_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(/descendant::Relation[attribute::Name=current()/@RelationName]/@acrelation_id)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" /> 
                              <xsl:apply-templates select="@RelationName"/> 
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="/descendant::Relation[attribute::Name=current()/@RelationName]/@acrelation_id"/> 
		         </xsl:otherwise>
		    </xsl:choose>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@Field1)!=0">       
            <xsl:attribute name = "FIELD1">
               <xsl:apply-templates select="@Field1"/>
            </xsl:attribute>
         </xsl:if>

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
       </xsl:element>

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
