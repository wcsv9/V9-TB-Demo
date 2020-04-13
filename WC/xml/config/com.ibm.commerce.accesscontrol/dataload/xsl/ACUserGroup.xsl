<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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


<!-- XSL Rule file to convert ACP to WCS52 -->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>
      <xsl:param name="WCS_DTD_PATH" select="'../../../schema/xml/wcs.dtd'"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">import</xsl:variable>

   <!-- Acuser Element related Variable Definition -->
   <xsl:variable name="Acuser_Element_Name">member</xsl:variable>
   <xsl:variable name="isa_Element_Name">isa</xsl:variable>

   <!-- Acusergrp Element related Variable Definition -->
   <xsl:variable name="Acusergrp_Element_Name">mbrgrp</xsl:variable>

   <!-- Acusergrpdesc Element related Variable Definition -->
   <xsl:variable name="Acusergrpdesc_Element_Name">mbrgrpdesc</xsl:variable>

   <!-- Acusergrpcond Element related Variable Definition -->
   <xsl:variable name="Acusergrpcond_Element_Name">mbrgrpcond</xsl:variable>

   <!-- Acusergrpusg Element related Variable Definition -->
   <xsl:variable name="Acusergrpusg_Element_Name">mbrgrpusg</xsl:variable>

   <!-- Acusergrpuser Element related Variable Definition -->
   <xsl:variable name="Acusergrpuser_Element_Name">mbrgrpmbr</xsl:variable>

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


   <!-- Acusergrp Element Transformation Rule -->   

   <xsl:template match="UserGroup">

      <xsl:element name="{$Acusergrp_Element_Name}">

         <xsl:attribute name = "MBRGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@MemberGroupID)=0">
                              <!--   <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="@OwnerID"/>  -->

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

                              <xsl:value-of select="$Resolve_Key_Prefix" />
                              <xsl:apply-templates select="@Name"/>
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@MemberGroupID"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "OWNER_ID">
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

         <xsl:attribute name = "FIELD1">
           <xsl:apply-templates select="@Field1"/>
         </xsl:attribute>

<!--         <xsl:attribute name = "DESCRIPTION">
             <xsl:apply-templates select="@Description"/>
         </xsl:attribute>
-->
         <xsl:attribute name = "FIELD2">
           <xsl:apply-templates select="@Field2"/>
         </xsl:attribute>

         <xsl:attribute name = "DN">
           <xsl:apply-templates select="@Dn"/>
         </xsl:attribute>

         <xsl:attribute name = "MBRGRPNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name = "FIELD3">
           <xsl:apply-templates select="@Field3"/>
         </xsl:attribute>

         <xsl:attribute name = "OID">
           <xsl:apply-templates select="@Oid"/>
         </xsl:attribute>

         <xsl:attribute name = "LASTUPDATE">
           <xsl:apply-templates select="@LastUpdate"/>
         </xsl:attribute>	

         <xsl:attribute name = "LASTUPDATEDBY">
           <xsl:apply-templates select="@LastUpdatedBy"/>
         </xsl:attribute>	

         <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
         <xsl:element name="{$isa_Element_Name}">
         <xsl:text disable-output-escaping="yes">&#10;   </xsl:text> 
         <xsl:element name="{$Acuser_Element_Name}">

            <xsl:attribute name = "TYPE">
              <xsl:value-of select="'G'" />
            </xsl:attribute>

         </xsl:element>
         <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
         </xsl:element>
         <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 

         <xsl:if test="string-length(@_action)!=0">       
           <xsl:attribute name = "_action">
             <xsl:apply-templates select="@_action"/>
           </xsl:attribute>        
         </xsl:if>
      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
      <xsl:element name="{$Acusergrpdesc_Element_Name}">
         <xsl:attribute name = "MBRGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@MemberGroupID)=0">
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

                              <xsl:value-of select="$Resolve_Key_Prefix" />
                              <xsl:apply-templates select="@Name"/>
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@MemberGroupID"/>  
	        	 </xsl:otherwise>  
                    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "LANGUAGE_ID">
            <xsl:value-of select="$Resolve_Key_Prefix"/> 
            <xsl:apply-templates select="parent::UserGroups/@LanguageID" /> 
         </xsl:attribute>

         <xsl:attribute name = "DISPLAYNAME">
           <xsl:apply-templates select="@Name"/>
         </xsl:attribute>

         <xsl:attribute name = "DESCRIPTION">
           <xsl:apply-templates select="@Description"/>
         </xsl:attribute>
      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
      <xsl:element name="{$Acusergrpcond_Element_Name}">

            <xsl:attribute name = "MBRGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@MemberGroupID)=0">

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

                              <xsl:value-of select="$Resolve_Key_Prefix" />
                              <xsl:apply-templates select="@Name"/>
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@MemberGroupID"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
            </xsl:attribute>

	    <xsl:attribute name = "CONDITIONS">
               <xsl:value-of select="UserCondition"/>
            </xsl:attribute>

      </xsl:element>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
      <xsl:element name="{$Acusergrpusg_Element_Name}">

            <xsl:attribute name = "MBRGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(@MemberGroupID)=0">

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

                              <xsl:value-of select="$Resolve_Key_Prefix" />
                              <xsl:apply-templates select="@Name"/>
		         </xsl:when>
		         <xsl:otherwise>   
		              <xsl:apply-templates select="@MemberGroupID"/>  
		         </xsl:otherwise>  
                    </xsl:choose>
            </xsl:attribute>

            <xsl:attribute name = "MBRGRPTYPE_ID">
              <xsl:value-of select="-2" />
            </xsl:attribute>

      </xsl:element>

      <xsl:for-each select="./UserGroupUser">
         <xsl:call-template name="UserGroupUser"/>
      </xsl:for-each>
      
  </xsl:template>  


  <!-- Acusergrpuser Element Transformation Rule -->  
 
  <xsl:template match="UserGroupUser" name = "UserGroupUser" >
   
      <xsl:element name="{$Acusergrpuser_Element_Name}"> 

         <xsl:attribute name = "MEMBER_ID">
           <xsl:apply-templates select="@UserID"/>
         </xsl:attribute>

         <xsl:attribute name = "MBRGRP_ID">
		    <xsl:choose>
			 <xsl:when test = "string-length(parent::UserGroup/@MemberGroupID)=0">
                              <xsl:value-of select="$Resolve_Key_Prefix" />         
                              <xsl:apply-templates select="parent::UserGroup/@Name"/>  
			 </xsl:when>
		         <xsl:otherwise>   
                              <xsl:apply-templates select="parent::UserGroup/@MemberGroupID"/> 
		         </xsl:otherwise>  
		    </xsl:choose>
         </xsl:attribute>

         <xsl:attribute name = "FIELD1">
           <xsl:apply-templates select="@Field1"/>
         </xsl:attribute>

         <xsl:attribute name = "CUSTOMERID">
           <xsl:apply-templates select="@CustomerID"/>
         </xsl:attribute>

         <xsl:attribute name = "EXCLUDE">
           <xsl:apply-templates select="@Exclude"/>
         </xsl:attribute>

      </xsl:element>

   </xsl:template>


<!-- Transformation Rules Section Ends -->
      
</xsl:stylesheet>


<!-- 

    CMVC control information.
    =========================
    Workfile       :  
    Version        :  1.0
    Put Timestamp  :  01/06/25 10:00:07
    Last Updated   :  01/06/25 11:00:27
    Author         :  Rathinagopal Sankaranarayanan

-->
