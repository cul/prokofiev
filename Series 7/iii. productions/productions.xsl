<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="xml" indent="yes"/>
 
<xsl:template match="row">

    <xsl:text>&#xa;</xsl:text>
    <xsl:comment>EAD <xsl:value-of select="SPA_ID"/>
    </xsl:comment>
    <xsl:text>&#xa;</xsl:text>

 <c level="file">
     <did>
         <container type="Box" label="Box">
             <xsl:apply-templates select="Box_number"/>
         </container>        
         <unittitle>
             <xsl:value-of select="Description"/>
         </unittitle>
         
         <note>
             <p>Name of subject(s): <xsl:value-of select="Name_of_subjects"/></p><xsl:text>&#xa;</xsl:text>
             <p>ID: <xsl:value-of select="SPA_ID"/></p><xsl:text>&#xa;</xsl:text>        
        <xsl:if test="not(Date_qualifier='')">
             <xsl:choose>
                 <xsl:when test="not(Date='xxxx-xx-xx') and not(Date='')">
             <p>Date: <xsl:value-of select="Date"/> (<xsl:value-of select="Date_qualifier"/>)</p><xsl:text>&#xa;</xsl:text>
                 </xsl:when>
                <xsl:otherwise>
                    <p>Date: unknown</p>
                </xsl:otherwise>               
             </xsl:choose>
        </xsl:if>
            <p>Document type: <xsl:value-of select="Document_type"/></p>
            <p>Format: <xsl:value-of select="Format"/></p>
        <xsl:if test="not(Number_of_duplicates=0)">
            <p>Duplicates: <xsl:value-of select="Number_of_duplicates"/>, <xsl:value-of select="Duplicate_location"/></p>
        </xsl:if>             
        <xsl:if test="not(Digital='')">
            <p>Also available in Digital: <xsl:value-of select="Digital"/></p>
        </xsl:if>
                       <p>Previous holding library: Serge Prokofiev Archive at Goldsmiths College, University of London</p>

<!--           <p>Goldsmiths ID: <xsl:value-of select="Goldsmiths_ID"/></p>     
-->
        <xsl:if test="not(Notes='')">
             <p>Notes: <xsl:value-of select="Notes"/></p>
        </xsl:if>

<!--         <xsl:apply-templates select="Document_type"/>
             <xsl:apply-templates select="Type"/>
             <xsl:apply-templates select="Format"/>
             <xsl:apply-templates select="Version"/>
             <xsl:apply-templates select="Notes"/>
             <xsl:apply-templates select="Provenance"></xsl:apply-templates>-->
            &#xa;
         </note>
     </did>
 </c>

</xsl:template>
   
    <xsl:template match="Document_type"><p>Document type: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Format"><p>Format: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Version"><p>Original or Copy: <xsl:value-of select="."/></p></xsl:template>    
    <xsl:template match="Language"><p>Language: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Notes[string-length(text())>0]"><p>Notes: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Provenance"><p>Previous holding library: <xsl:value-of select="."/></p></xsl:template>

</xsl:stylesheet>
