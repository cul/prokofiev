<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="xml" indent="yes"/>
        <xsl:template match="outputxml">
            <xsl:apply-templates>
                <xsl:sort select="TYPE_OF_WORK"/>
                <xsl:sort select="CALL_NUMBER"/>
            </xsl:apply-templates>

        </xsl:template>
    
        <xsl:template match="RECORD">
            <xsl:if test="REFNUM !=''">
            <xsl:text>Refnum: </xsl:text>
            <xsl:apply-templates select="REFNUM"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="CALL_NUMBER !=''">
            <xsl:text>Call number: </xsl:text>
            <xsl:apply-templates select="CALL_NUMBER"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="AUTHORS/AUTHOR !=''">
            <xsl:text>Author: </xsl:text>
            <xsl:apply-templates select="AUTHORS/AUTHOR"></xsl:apply-templates>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="YEAR !=''">
            <xsl:text>Year: </xsl:text>
            <xsl:apply-templates select="YEAR"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="TITLE !=''">
            <xsl:text>Title: </xsl:text>
            <xsl:apply-templates select="TITLE"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="SECONDARY_AUTHORS/SECONDARY_AUTHOR !=''">
            <xsl:for-each select="SECONDARY_AUTHORS/SECONDARY_AUTHOR">
                <xsl:text>Secondary author: </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
            </xsl:if>
            <xsl:if test="PUBLISHER !=''">
            <xsl:text>Publisher: </xsl:text>
            <xsl:apply-templates select="PUBLISHER"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="TYPE_OF_WORK !=''">
            <xsl:text>Type of work: </xsl:text>
            <xsl:apply-templates select="TYPE_OF_WORK"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:if test="ACCESSION_NUMBER !=''">
            <xsl:text>Accession number: </xsl:text>
            <xsl:apply-templates select="ACCESSION_NUMBER"/>
            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
            <xsl:text>&#xa;&#xa;</xsl:text>
            
        </xsl:template>    
       
            


</xsl:stylesheet>