<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match="outputxml">
<xsl:for-each select="c">
Title:   <xsl:apply-templates select="did/unittitle"></xsl:apply-templates><xsl:text>&#xa;</xsl:text>
<xsl:apply-templates select="did/note"></xsl:apply-templates>   Box: <xsl:apply-templates select="did/container"></xsl:apply-templates>
    <xsl:text>&#xa;</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>