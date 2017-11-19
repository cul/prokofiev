<!-- convert Series_5_BookSections.xml to
          to Series_5_BookSections EAD.xml  - - MS 7/19/17 -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="outputxml/RECORD">

      <xsl:variable name="Recordnum">
          <xsl:number count="RECORD"></xsl:number>
      </xsl:variable>

        <xsl:text>&#xa;</xsl:text>
        
<!-- Generate EAD number
     Change 0 to start number (minus 1) -->

      <xsl:variable name="SPA">
          <xsl:number value="$Recordnum + 13763"/>
      </xsl:variable>

      <xsl:comment>EAD SPA_<xsl:number value="$SPA"/></xsl:comment>
      <xsl:text>&#xa;</xsl:text>


        <c level="file">
                <did>
                    <unittitle><xsl:apply-templates select="ARTICLE_TITLE|ARTICLE_TITLES/ARTICLE_TITLE"></xsl:apply-templates>
                        <xsl:apply-templates select="SECONDARY_TITLE"></xsl:apply-templates></unittitle>
                       <xsl:text>&#xa;</xsl:text>
                    <note>
                       <xsl:apply-templates select="AUTHORS/AUTHOR"></xsl:apply-templates>
                       <xsl:apply-templates select="SUBSIDIARY_AUTHORS/SUBSIDIARY_AUTHOR"></xsl:apply-templates>

                           <p>ID: SPA_<xsl:number value="$SPA"/></p>
                        
                        <xsl:if test="BOOK_TITLE">
                            <p>Book title: <xsl:apply-templates select="BOOK_TITLE"></xsl:apply-templates>
                             <xsl:apply-templates select="EDITOR"></xsl:apply-templates></p>               
                            <xsl:text>&#xa;</xsl:text>
                        </xsl:if>
                        
                        <xsl:apply-templates select="PAGES"></xsl:apply-templates>
                        <xsl:apply-templates select="PUBLISHER"></xsl:apply-templates>                        
                        <xsl:apply-templates select="YEAR"></xsl:apply-templates>
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



    <xsl:template match="BOOK_TITLE">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="SECONDARY_TITLE">
        <xsl:text>.&#x20;</xsl:text><xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="PAGES">
        <p><xsl:text>Pages:&#x20;</xsl:text><xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="EDITOR">
        <xsl:text>, </xsl:text><xsl:value-of select="."/><xsl:text> (ed.)</xsl:text>
    </xsl:template>

    <xsl:template match="ARTICLE_TITLE|ARTICLE_TITLES/ARTICLE_TITLE">
        <xsl:value-of select="."/>
    </xsl:template>



    <xsl:template match="AUTHORS/AUTHOR">
        <p>Creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="SUBSIDIARY_AUTHORS/SUBSIDIARY_AUTHOR">
         <p>Secondary creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="YEAR">
        <p>Publication date:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="PUBLISHER">
        <p>Publisher:&#x20;<xsl:value-of select="."/>&#x2c;&#x20;<xsl:value-of select="../PLACE_PUBLISHED"/></p>
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



</xsl:stylesheet>
