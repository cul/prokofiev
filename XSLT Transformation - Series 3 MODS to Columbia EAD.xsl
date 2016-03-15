<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:strip-space elements="*"/>
   <xsl:template match="/">
      <c level="series">
         <xsl:apply-templates/>
      </c>
   </xsl:template>
   <xsl:template match="mods">
      <xsl:variable name="genres">
         <xsl:for-each select="genre[@type='music_genre']">
            <xsl:text>; </xsl:text>
            <xsl:value-of select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="contenttypes">
         <xsl:for-each select="genre[@type='music_type']">
            <xsl:text>; </xsl:text>
            <xsl:value-of select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="allcreators">
         <xsl:for-each select="name/namePart">
            <xsl:text>; </xsl:text>
            <xsl:value-of select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:comment>EAD <xsl:value-of select="identifier[@type='SPA_ID']"/></xsl:comment>
      <xsl:text>&#xa;</xsl:text>
      <c level="file">
         <xsl:text>&#xa;&#x20;</xsl:text>
         <did>
            <xsl:text>&#xa;&#x20;</xsl:text>
            <xsl:apply-templates select="location/shelfLocator[contains(.,'Box')]"/>
            <unittitle>
               <xsl:choose>
                  <xsl:when test="titleInfo[@type='alternative']">
                     <xsl:apply-templates select="titleInfo[@type='alternative']"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="titleInfo[not(@*)]/title"/>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:apply-templates select="originInfo/dateCreated"/>
               <xsl:text>&#x20;</xsl:text>
            </unittitle>
            <xsl:text>&#xa;&#x20;</xsl:text>
            <note>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="identifier[@type='opus']"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="titleInfo[not(@*)]"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="name"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="identifier[@type='SPA_ID']"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="originInfo"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="location/shelfLocator[contains(.,'Call Number')]"/>
               <p>Document type: Notated music</p>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <p>Genre(s): <xsl:value-of select="substring($genres,3)"/></p>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <p>Content type(s): <xsl:value-of select="substring($contenttypes,3)"/></p>
               <xsl:text>&#x20;</xsl:text>
               <xsl:apply-templates select="language"/>
               <xsl:apply-templates select="note[not(@*)]"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="location/physicalLocation[@type='previous']"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
            </note>
         </did>
      </c>
   </xsl:template>
   <xsl:template match="titleInfo[@type='alternative']">
      <xsl:value-of select="title"/>
   </xsl:template>
   <xsl:template match="titleInfo[not(@*)]">
      <p>Standard title: <xsl:value-of select="translate(title, '&#x20;&#x9;&#xD;&#xa;', ' ')"/></p>
   </xsl:template>
   <xsl:template match="location/shelfLocator[contains(.,'Box')]">
      <container type="Box">
         <xsl:value-of select=" replace(.,'Box ','')"/>
      </container>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <xsl:template match="location/shelfLocator[contains(.,'Call Number')]">
      <p>Call Number:<xsl:value-of select=" replace(.,'Call Number ','')"/></p>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <!-- This is the template for the date created, it wraps in brackets for approximate dates-->
   <xsl:template match="originInfo/dateCreated">
      <xsl:text>&#xa;&#x20;</xsl:text>
      <unitdate>
         <xsl:if test="@qualifier='approximate'">[</xsl:if>
         <xsl:value-of select="."/>
         <xsl:if test="@qualifier='approximate'">]</xsl:if>
      </unitdate>
      <xsl:text>&#xa;</xsl:text>
   </xsl:template>
   <xsl:template match="identifier[@type='opus']">
      <p>Opus: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="identifier[@type='SPA_ID']">
      <p>ID: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="name">
      <p>Creator: <xsl:value-of select="namePart"/></p>
   </xsl:template>
   <xsl:template match="genre[@type='music_genre']">
      <p>Genre: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="genre[@type='music_type']">
      <p>Content type: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="language">
      <p>Language: <xsl:value-of select="languageTerm"/></p>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <xsl:template match="note[not(@*)]">
      <p>Notes: <xsl:value-of select="translate(., '&#x20;&#x9;&#xD;&#xa;', ' ')"/></p>
   </xsl:template>
   <xsl:template match="location/physicalLocation[@type='previous']">
      <p>Previous holding library: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="originInfo">
      <p>Publisher: <xsl:value-of select="publisher"/>, <xsl:value-of select="place/placeTerm"/></p>
   </xsl:template>
</xsl:stylesheet>
