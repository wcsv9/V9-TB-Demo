<?xml version="1.0"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


<!-- XSL Rule file to convert WCS52 to ACP-->

<!-- Parameter Definations Section Starts -->
<!-- Supply the Values for xsl:param from the command line as -param name="value" while invoking XSLTransformation -->

      <xsl:param name="ACPMEMVAR1_Default" select="''"/>

<!-- Variable Name Definations Section Starts -->

   <xsl:variable name="Resolve_Key_Prefix">@</xsl:variable>

   <!-- Root Element related Variable Definition -->
   <xsl:variable name="Policies_Root_Element_Name">UserGroups</xsl:variable>

   <!-- Acusergrp Element related Variable Definition -->
   <xsl:variable name="Acusergrp_Element_Name">UserGroup</xsl:variable>

   <!-- UserConditions Element related Variable Definition -->
   <xsl:variable name="UserConditions_Element_Name">UserCondition</xsl:variable>

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
        <xsl:text disable-output-escaping = "yes"> SYSTEM "../dtd/ACUserGroups.dtd"</xsl:text> 
        <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 

   <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>        
   -->

   <xsl:element name="{$Policies_Root_Element_Name}">
	<xsl:variable name="LangCount1" select="count(//mbrgrpdesc)"/> 
	<xsl:if test="$LangCount1 > 1">
		<xsl:for-each select="//mbrgrpdesc">
			<xsl:attribute name = "LanguageID">
				<xsl:variable name="LocaleName" select="preceding::language[attribute::language_id=current()/@language_id]"/>
				<xsl:if test="$LocaleName">
					<xsl:apply-templates select="$LocaleName/@localename"/>
				</xsl:if>
			</xsl:attribute> 
		</xsl:for-each>
	</xsl:if>
  
         <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>
         <xsl:apply-templates/>
         <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
   </xsl:element>
   </xsl:template>


 <!-- Acresgrp Element Transformation Rule --> 

   <xsl:template match="mbrgrp">

      <xsl:element name="{$Acusergrp_Element_Name}">

         <xsl:attribute name = "Name">
           <xsl:apply-templates select="@mbrgrpname"/>
         </xsl:attribute>

         <xsl:attribute name = "OwnerID">
		        <xsl:apply-templates select="@owner_id"/> 
         </xsl:attribute>

         <xsl:variable name="UsrGrpDesc" select="following::mbrgrpdesc[attribute::mbrgrp_id=current()/@mbrgrp_id]"/>
         <xsl:if test="$UsrGrpDesc">
            <xsl:if test="string-length($UsrGrpDesc/@description)!=0">
               <xsl:attribute name ="Description">
                  <xsl:apply-templates select="$UsrGrpDesc/@description"/>
               </xsl:attribute>
            </xsl:if> 
         </xsl:if> 

         <xsl:if test="string-length(@mbrgrp_id)!=0">
            <xsl:if test="@mbrgrp_id &lt;= 0">
               <xsl:attribute name = "MemberGroupID">
                  <xsl:apply-templates select="@mbrgrp_id"/>
               </xsl:attribute>
            </xsl:if> 
         </xsl:if> 

        <xsl:variable name="UsrGrpCond" select="following::mbrgrpcond[attribute::mbrgrp_id=current()/@mbrgrp_id]"/>

         <xsl:if test="$UsrGrpCond">

         <xsl:if test="string-length($UsrGrpCond/@conditions)!=0">
            <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
            <xsl:element name="{$UserConditions_Element_Name}">
                 <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
                 <xsl:text disable-output-escaping = "yes">  &lt;![CDATA[</xsl:text> 
                 <xsl:text disable-output-escaping="yes">&#10;     </xsl:text>
                 
                 <xsl:call-template name="do-replace">
                      <xsl:with-param name="text" select="string($UsrGrpCond/@conditions)"/>
                 </xsl:call-template> 
                 <!--  <xsl:value-of select="$UsrGrpCond/@conditions"/>  -->
                 <!--  <xsl:apply-templates select="$UsrGrpCond/@conditions"/>  -->
                 <xsl:text disable-output-escaping = "yes">  ]]&gt;</xsl:text>
                 <xsl:text disable-output-escaping="yes">&#10;</xsl:text> 
            </xsl:element>
         </xsl:if>
         </xsl:if>

      <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&#10;&#10;</xsl:text>
  
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
            <xsl:text disable-output-escaping = "yes">&gt;</xsl:text> 

            <xsl:call-template name="do-replace">
               <xsl:with-param name="text" select="substring-after($test1,$replace1)"/>
            </xsl:call-template>

         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$test1"/>
         </xsl:otherwise>
      </xsl:choose>

</xsl:template>

 <!--
   <xsl:template name = "BlankLine" >
        <xsl:text disable-output-escaping="yes">&#10;</xsl:text>
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
