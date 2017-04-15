<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="XML">
    <outputxml>
        <xsl:apply-templates select = "RECORDS/RECORD[REFERENCE_TYPE=1 or REFERENCE_TYPE=4 or REFERENCE_TYPE=8 or REFERENCE_TYPE=20]">
            <xsl:sort select="REFERENCE_TYPE" data-type="number"/>
            <xsl:sort select="CALL_NUMBER" />
        </xsl:apply-templates> 
    </outputxml>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

