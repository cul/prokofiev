<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:pkv="http://example.org/prokofiev" exclude-result-prefixes="xs xd pkv ead xlink" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Sep 18, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> thc4</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
            <items><xsl:apply-templates select="//ead:c[@level = 'file']"></xsl:apply-templates></items>       
    </xsl:template>
    <xsl:template match="//ead:c[@level = 'file']">                
        <item>
            <xsl:apply-templates select="ead:did/*"/>
            <xsl:apply-templates select="ead:altformavail"/>
        </item>              
    </xsl:template>
    <xsl:template match="ead:container">
        <xsl:element name="{@type}"><xsl:value-of select="."/></xsl:element>
    </xsl:template>
    <xsl:template match="ead:unittitle">
        <xsl:element name="title"><xsl:value-of select="."/></xsl:element>
        <xsl:element name="date"><xsl:value-of select="ead:unitdate"/></xsl:element>
    </xsl:template>
    <xsl:template match="ead:physdesc">
        <xsl:element name="extent"><xsl:value-of select="ead:extent"/></xsl:element>
    </xsl:template>
    <xsl:template match="ead:unitdate"/>
    <xsl:template match="ead:altformavail">
        <xsl:element name="altformavail">
            <xsl:value-of select="ead:p"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ead:note/ead:p">
         <xsl:element name="{substring-before(translate(./text(), ' ', '_'), ':')}" inherit-namespaces="yes">
             <xsl:value-of select="substring(substring-after(./text(), ':'), 2)"/>
         </xsl:element>
    </xsl:template>

</xsl:stylesheet>
