<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="outputxml">
        
     <xsl:for-each select="RECORD">  
        
       <xsl:sort select="YEAR"/>
         <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="./YEAR"/>

     </xsl:for-each>    

    </xsl:template>

    
</xsl:stylesheet>