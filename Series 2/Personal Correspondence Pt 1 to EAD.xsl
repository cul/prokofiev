
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<!-- xsl for letters 1912-1929 -->

    <xsl:output method="xml" indent="yes"/>

 <!--  1. Download Google Sheets doc as csv file
       2. Import file in Oxygen - convert to XML:
          File->Import->Text
          Check box: "First row contains field names"
       3. Column headers turned into tag names
          Check header names for consistency (caps, underscores, etc.)
 -->


<xsl:template match="row">
  

    <xsl:variable name="Recordnum">
        <xsl:number count="row"></xsl:number>
    </xsl:variable>

    <!--SPA # for this series starts at 1502
         Therefore seed number for variable is 1501-->

    <xsl:variable name="SPA">
        <xsl:number value="$Recordnum + 1501"/>
    </xsl:variable>

    <xsl:variable name="Unitdate">

    </xsl:variable>
    <xsl:text>&#xa;</xsl:text>
    <xsl:comment>EAD SPA_<xsl:number value="$SPA"/>, Access_ID: <xsl:apply-templates select="Access_ID"></xsl:apply-templates>
    </xsl:comment>
    <xsl:text>&#xa;</xsl:text>


 <c level="file">
     <did>
     <!-- if no exact date, choose implied date -->
     <xsl:choose>
         <xsl:when test="Exact_Unitdate[string-length(text())>0]">
             <unittitle>
                 <xsl:apply-templates select="Sender_Name"/>
                 <xsl:text> to </xsl:text>
                 <xsl:apply-templates select="Recipient_Name"/>
                 <xsl:text>, </xsl:text>
                 <unitdate>
                 <xsl:apply-templates select="Exact_Unitdate"/>
                 </unitdate>
             </unittitle>
         </xsl:when>

         <xsl:otherwise>
             <unittitle>
                 <xsl:apply-templates select="Sender_Name"/>
                 <xsl:text> to </xsl:text>
                 <xsl:apply-templates select="Recipient_Name"/>
                 <xsl:text>, </xsl:text>
                 <unitdate>
                 <xsl:apply-templates select="Implied_Unitdate"/>
                 </unitdate>
             </unittitle>
         </xsl:otherwise>

     </xsl:choose>

     
         <container type="Box" label="Box">
            <xsl:apply-templates select="Box_No"/>
         </container>

         <container type="Folder" label="Folder">
            <xsl:apply-templates select="Folder_Name"/>
         </container>

         <note>

             <p>ID: SPA_<xsl:number value="$SPA"/></p><xsl:text>&#xa;</xsl:text>

             
             <xsl:apply-templates select="Sender_Address_Merged"/>
             <xsl:apply-templates select="Sender_Organization"/>
             <xsl:apply-templates select="Recipient_Address_Merged"/>
             <xsl:apply-templates select="Recipient_Organization"/>
             <xsl:apply-templates select="Extent_Pages"/>
             <xsl:apply-templates select="Language"/>
             <xsl:apply-templates select="Type"/>
             <xsl:apply-templates select="Format"/>
             <xsl:apply-templates select="Version"/>
             <xsl:apply-templates select="Notes"/>
             <xsl:apply-templates select="Provenance"></xsl:apply-templates>

             <p>Goldsmiths locator: <xsl:choose>
                 <xsl:when test="Goldsmiths_Binder[text()='Not applicable']">
                     <xsl:text>Not applicable</xsl:text>

                 </xsl:when>

                 <xsl:otherwise>
                     <xsl:apply-templates select="Goldsmiths_Binder"/>
                     <xsl:apply-templates select="Goldsmiths_Binder_Starting_Page"/>
                 </xsl:otherwise>

             </xsl:choose>&#xa;
             </p>
         </note>
     </did>
 </c>

</xsl:template>
    
    <xsl:template match="Access_ID"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Box_No"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Folder_name"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Goldsmiths_Binder">Binder&#x20;<xsl:value-of select="."/></xsl:template>
    <xsl:template match="Goldsmiths_Binder_Starting_Page"><xsl:text>, page </xsl:text><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Exact_Unitdate"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Extent_Pages"><p>Extent: <xsl:value-of select="."/> page(s)</p></xsl:template>
    <xsl:template match="Sender_Name"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Implied_Unitdate"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Sender_Address_Merged[string-length(text())>0]"><p>Sender address: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Sender_Organization[string-length(text())>0]"><p>Sender organization: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Recipient_Name"><xsl:value-of select="."/></xsl:template>
    <xsl:template match="Recipient_Address_Merged[string-length(text())>0]"><p>Recipient address: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Recipient_Organization[string-length(text())>0]"><p>Recipient organization: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Type"><p>Document type: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Format"><p>Format: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Version"><p>Original or Copy: <xsl:value-of select="."/></p></xsl:template>    
    <xsl:template match="Language"><p>Language: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Notes[string-length(text())>0]"><p>Notes: <xsl:value-of select="."/></p></xsl:template>
    <xsl:template match="Provenance"><p>Previous holding library: <xsl:value-of select="."/></p></xsl:template>
</xsl:stylesheet>
