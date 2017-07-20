<!-- convert Series_5_Articles (Physical).xml
          to Series_5_Articles (Physical)EAD.xml  - - MS 7/17/17 -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>   

    <xsl:template match="outputxml/RECORD">
        
        <xsl:variable name="Recordnum">
            <xsl:number count="RECORD"></xsl:number>
        </xsl:variable>
        
        <xsl:variable name="SPA">
            <xsl:number value="$Recordnum + 1913"/>
        </xsl:variable>
        
        
        <xsl:text>&#xa;</xsl:text>
        <xsl:comment>EAD SPA_<xsl:number value="$SPA"/></xsl:comment>
        <xsl:text>&#xa;</xsl:text>
 
        <c level="file">
                <did>
                    <unittitle><xsl:apply-templates select="ARTICLE_TITLE"></xsl:apply-templates>
                        <xsl:apply-templates select="SECONDARY_ARTICLE_TITLE|SECONDARY_ARTICLE_TITLES/SECONDARY_ARTICLE_TITLE"></xsl:apply-templates></unittitle>
                       <xsl:text>&#xa;</xsl:text>
                    <note>
                       <xsl:apply-templates select="AUTHORS/AUTHOR"></xsl:apply-templates>
                       <xsl:apply-templates select="SUBSIDIARY_AUTHORS/SUBSIDIARY_AUTHOR"></xsl:apply-templates>
                        
                           <p>ID: SPA_<xsl:number value="$SPA"/></p>    
                        
                           <p>Periodical: <xsl:apply-templates select="JOURNAL_TITLE"></xsl:apply-templates>
                              <xsl:apply-templates select="VOLUME"></xsl:apply-templates>
                              <xsl:apply-templates select="ISSUE"></xsl:apply-templates>
                              <xsl:apply-templates select="NUMBER"></xsl:apply-templates>
                              <xsl:apply-templates select="PAGES"></xsl:apply-templates></p>
                              <xsl:text>&#xa;</xsl:text>
                        
                        <xsl:apply-templates select="DATE"></xsl:apply-templates>
                        <xsl:apply-templates select="CUSTOM1"></xsl:apply-templates>
                        <xsl:apply-templates select="CALL_NUMBER"></xsl:apply-templates>
                        <xsl:apply-templates select="TYPE_OF_WORK"></xsl:apply-templates>
                        <xsl:apply-templates select="ALTERNATE_TITLE"></xsl:apply-templates>
                        <p>Previous holding library: Serge Prokofiev Archive at Goldsmiths College, University of London</p>
                        <xsl:apply-templates select="NOTES"></xsl:apply-templates>
                        
                    </note>
                </did>
            </c>

    </xsl:template>
    
    
    
    <xsl:template match="JOURNAL_TITLE">
        <xsl:value-of select="."/>
    </xsl:template>
      
    <xsl:template match="VOLUME">
        <xsl:text>, Volume </xsl:text><xsl:value-of select="."/>
    </xsl:template>       
    
    <xsl:template match="ISSUE">
        <xsl:text>, Issue</xsl:text><xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="NUMBER">
        <xsl:text>, Number </xsl:text><xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="PAGES">
        <xsl:text>, Page(s) </xsl:text><xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="ARTICLE_TITLE">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="SECONDARY_ARTICLE_TITLE|SECONDARY_ARTICLE_TITLES/SECONDARY_ARTICLE_TITLE">.&#x20;<xsl:value-of select="."/></xsl:template>

    <xsl:template match="AUTHORS/AUTHOR">
        <p>Creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="SUBSIDIARY_AUTHORS/SUBSIDIARY_AUTHOR">
         <p>Secondary creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="DATE">
        <p>Publication date:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="CUSTOM1">
        <p>Language:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="CALL_NUMBER">
        <p>Call Number:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="TYPE_OF_WORK">
        <p>Document type:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="ALTERNATE_TITLE">
        <p>Periodical type:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="NOTES">
        <p>Notes:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="REFNUM">
        REFNUM:  <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="REFERENCE_TYPE">
        <p>Reference TYPE: <xsl:value-of select="."/><xsl:text>&#x20;</xsl:text></p>
    </xsl:template>

</xsl:stylesheet>
