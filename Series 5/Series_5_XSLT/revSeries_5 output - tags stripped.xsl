<!-- convert CU EAD to legible output for record checking
     (i.e., without element tags) -->

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
<xsl:template match="c">
   <xsl:apply-templates select="did/unittitle"></xsl:apply-templates>
   <xsl:apply-templates select="did/note"></xsl:apply-templates>

</xsl:template>
   <xsl:template match="did/unittitle">  TITLE: <xsl:value-of select="."/><xsl:text>&#xa;</xsl:text></xsl:template>
   <xsl:template match="did/note"><xsl:value-of select="."/></xsl:template>   


   <!--
   <xsl:template match="/outputxml/c/did/unittitle[contains(text(), 'Subseries')]">
      <xsl:copy>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="/output/c/did/unittitle[not(contains(text(),'Subseries'))]">
      <xsl:apply-templates></xsl:apply-templates>
   </xsl:template>
   


      <xsl:template match="/">
      <xsl:apply-templates select="//did"></xsl:apply-templates>
   </xsl:template> 
   <xsl:template match="//did">XXxxx&#xa;</xsl:template>

      
      <xsl:template match="unittitle"><xsl:value-of select="."/>&#xa;</xsl:template>
      <xsl:template match="did/note"><xsl:value-of select="."/>&#xa;</xsl:template> 
      <xsl:apply-templates select="//unittitle"></xsl:apply-templates>
      <xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates select="//did/note"></xsl:apply-templates>
      
      
      
      
<xsl:template match="outputxml">
   <xsl:for-each select="c[@level='subseries']/did">
   <xsl:apply-templates select="unittitle"></xsl:apply-templates>
   </xsl:for-each>
</xsl:template>
 <xsl:template match="unittitle">SUBSERIES</xsl:template>

   <xsl:template match="c[@level = 'subseries']"><xsl:value-of select="."/></xsl:template>

   
<xsl:template match="c[@level = 'file']">

-->
</xsl:stylesheet>

