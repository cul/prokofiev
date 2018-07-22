<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="outputxml">
        <xsl:for-each select="RECORD[TYPE_OF_WORK='Audio Tape']">
            
            

        
        <xsl:variable name="Recordnum">
            <xsl:number count="RECORD[TYPE_OF_WORK='Audio Tape']"></xsl:number>
        </xsl:variable>
        
        <xsl:text>&#xa;</xsl:text>
        
        <!-- Generate EAD number

        Type 7 starts numbering after OPERA  14633 -->
        
        <xsl:variable name="SPA">
            <xsl:number value="$Recordnum + 14632"/>
        </xsl:variable>
        
        <xsl:comment>&#x20;EAD SPA_<xsl:number value="$SPA"/>
         <xsl:text>;&#x20;</xsl:text>REFNUM:&#x20;<xsl:value-of select="REFNUM"></xsl:value-of><xsl:text>&#x20;</xsl:text>
      </xsl:comment>
        <xsl:text>&#xa;</xsl:text>
        
        <c level="file">
            <did>
                <unittitle><xsl:apply-templates select="TITLE"></xsl:apply-templates>
                    <xsl:apply-templates select="SECONDARY_TITLE"></xsl:apply-templates></unittitle>
                <xsl:text>&#xa;</xsl:text>
                <note>
                    <xsl:apply-templates select="AUTHORS/AUTHOR"></xsl:apply-templates>
                    <xsl:apply-templates select="SECONDARY_AUTHORS/SECONDARY_AUTHOR"></xsl:apply-templates>
                    <p>ID: SPA_<xsl:number value="$SPA"/></p>
                    <xsl:apply-templates select="PUBLISHER"></xsl:apply-templates>
                    <xsl:apply-templates select="YEAR"></xsl:apply-templates>
                    <xsl:apply-templates select="CUSTOM1"></xsl:apply-templates>
                    <xsl:apply-templates select="CALL_NUMBER"></xsl:apply-templates>
                    <xsl:apply-templates select="ACCESSION_NUMBER"></xsl:apply-templates>
                    <xsl:apply-templates select="TYPE_OF_WORK"></xsl:apply-templates>
                    <p>Previous holding library: Serge Prokofiev Archive at Goldsmiths College, University of London</p>
                    <xsl:apply-templates select="NOTES"></xsl:apply-templates>
                </note>
            </did>
        </c>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="TITLE">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="AUTHORS/AUTHOR">
        <p>Creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="SECONDARY_AUTHORS/SECONDARY_AUTHOR">
        <p>Secondary creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="YEAR">
        <p>Publication date:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="PUBLISHER">
        <xsl:choose>
            <xsl:when test="../PLACE_PUBLISHED='?'">
                <p>Publisher:&#x20;<xsl:value-of select="."/></p>
            </xsl:when>
            <xsl:when test="not(../PLACE_PUBLISHED)">
                <p>Publisher:&#x20;<xsl:value-of select="."/></p>
            </xsl:when>
            <xsl:otherwise>
                <p>Publisher:&#x20;<xsl:value-of select="."/>, <xsl:value-of select="../PLACE_PUBLISHED"/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="CUSTOM1">
        <p>Language:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="CALL_NUMBER">
        <p>Call Number:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="ACCESSION_NUMBER">
        <p>Accession Number:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="TYPE_OF_WORK">
        <p>Document type:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="NOTES">
        <p>Notes:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    
</xsl:stylesheet>

