<!-- convert Series_5_SOVMUZ.xml
          to Series_5_SOVMUZ EAD.xml  - - rev MS 9/23/17 -->

<!-- number series after digital articles -->
<!-- update to start SPA number after ORA 
     add <p>Periodical type:</p>   11/21/17  -->


<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>

<xsl:template match="outputxml">

<outputxml>
   <xsl:text>&#xa;</xsl:text>


    <xsl:for-each select="RECORD">

<!-- set EAD number variable -->
        <xsl:variable name="Recordnum">
            <xsl:number count="RECORD"></xsl:number>
        </xsl:variable>

<!-- Generate EAD number = $Recordnum + (Start Number minus 1) -->
        <xsl:variable name="SPA">
            <xsl:number value="$Recordnum + 14507"/>
        </xsl:variable>


        <xsl:text>&#xa;</xsl:text>
        <xsl:comment>EAD SPA_<xsl:number value="$SPA"/></xsl:comment>
        <xsl:text>&#xa;</xsl:text>


        <c level="file">
            <did>
                <unittitle><xsl:apply-templates select="ARTICLE_TITLE"></xsl:apply-templates>
                    <xsl:apply-templates select="SUBSIDIARY_ARTICLE_TITLE"></xsl:apply-templates></unittitle>
                <xsl:text>&#xa;</xsl:text>
                <note>
                    <xsl:apply-templates select="AUTHORS/ARTICLE_AUTHOR"></xsl:apply-templates>
                    <xsl:apply-templates select="AUTHORS/SUBSIDIARY_AUTHOR"></xsl:apply-templates>
                    <xsl:apply-templates select="AUTHORS/TRANSLATOR"></xsl:apply-templates>
                    <p>ID: SPA_<xsl:number value="$SPA"/></p>

                    <p>Periodical: <xsl:apply-templates select="PERIODICAL_TITLE"></xsl:apply-templates>
                        <xsl:apply-templates select="NUMBER"></xsl:apply-templates>
                        <xsl:apply-templates select="PAGES"></xsl:apply-templates></p>
                    <xsl:text>&#xa;</xsl:text>

        <!--            <xsl:apply-templates select="AUTHORS/PERIODICAL_EDITOR"></xsl:apply-templates> -->
                    <xsl:apply-templates select="PUBLISHER"></xsl:apply-templates>

                    <!-- if <DATE> tag exists, use <DATE>; else, use <YEAR> -->

                    <xsl:choose>

                        <xsl:when test="DATE[string-length(text())>0]">
                            <xsl:apply-templates select="DATE"></xsl:apply-templates>
                        </xsl:when>

                        <xsl:otherwise>
                            <xsl:apply-templates select="YEAR"></xsl:apply-templates>
                        </xsl:otherwise>

                    </xsl:choose>

                    <xsl:apply-templates select="LANGUAGE"></xsl:apply-templates>
<!--                <xsl:apply-templates select="CUSTOM1"></xsl:apply-templates>  -->
                    <xsl:apply-templates select="CALL_NUMBER"></xsl:apply-templates>
                    <xsl:apply-templates select="ARTICLE_TYPE_OF_WORK"></xsl:apply-templates>
                    <xsl:apply-templates select="PERIODICAL_TYPE_OF_WORK"></xsl:apply-templates>
                    <p>Previous holding library: Serge Prokofiev Archive at Goldsmiths College, University of London</p>
                    <xsl:apply-templates select="NOTES"></xsl:apply-templates>

                </note>
            </did>
        </c>
        <xsl:text>&#xa;</xsl:text>



      </xsl:for-each>

    <xsl:text>&#xa;</xsl:text>

    </outputxml>
</xsl:template>


    <xsl:template match="RECORD/PERIODICAL_TITLE">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="NUMBER">
        <xsl:choose>
            <xsl:when test=".[contains(text(),'Highlights')]">
            <xsl:text>, </xsl:text><xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
            <xsl:text>, Number </xsl:text><xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="PAGES">
        <xsl:text>, Page(s) </xsl:text><xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="ARTICLE_TITLE">
        <xsl:value-of select="."/>&#xa;
    </xsl:template>

    <xsl:template match="SUBSIDIARY_ARTICLE_TITLE">.&#x20;<xsl:value-of select="."/></xsl:template>

    <xsl:template match="AUTHORS/ARTICLE_AUTHOR">
        <p>Creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="AUTHORS/SUBSIDIARY_AUTHOR">
         <p>Secondary creator:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="AUTHORS/TRANSLATOR">
        <p>Secondary creator:&#x20;<xsl:value-of select="."/> (trans.)</p>
    </xsl:template>

    <xsl:template match="AUTHORS/PERIODICAL_EDITOR">
        <p>Editor: <xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="PUBLISHER">
        <p>Publisher:&#x20;<xsl:value-of select="."/>&#x2c;&#x20;<xsl:value-of select="../PLACE_PUBLISHED"/></p>
    </xsl:template>

    <xsl:template match="DATE">
        <p>Publication date:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="YEAR">
        <p>Publication date:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="LANGUAGE">
        <p>Language:&#x20;<xsl:value-of select="."/><xsl:text>&#x20;</xsl:text></p><xsl:text>&#xa;</xsl:text>
    </xsl:template>

<!--
    <xsl:template match="CUSTOM1">
        <p>Language:&#x20;<xsl:value-of select="."/><xsl:text>&#x20;</xsl:text></p><xsl:text>&#xa;</xsl:text>
    </xsl:template>
  -->

    <xsl:template match="CALL_NUMBER">
        <p>Call Number:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="ARTICLE_TYPE_OF_WORK">
        <p>Document type:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="PERIODICAL_TYPE_OF_WORK">
        <p>Periodical type:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="NOTES">
        <p>Notes:&#x20;<xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="REFERENCE_TYPE">
        <p>Reference TYPE: <xsl:value-of select="."/><xsl:text>&#x20;</xsl:text></p>
    </xsl:template>

</xsl:stylesheet>
