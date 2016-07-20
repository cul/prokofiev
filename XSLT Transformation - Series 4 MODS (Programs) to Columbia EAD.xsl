<!-- Created by Jennifer Goslee on 07-17-2016 -->
<!-- Version with edits made on 07-20-2016 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:strip-space elements="*"/>
   <xsl:output method="xml" indent="yes" />
   
   <xsl:variable name="LastSubsection" select="'start'" />
   
   <xsl:template match="/">
      <c level="series">
         <xsl:text>&#xa;</xsl:text>
         <xsl:apply-templates/>
      </c>
   </xsl:template>
   <xsl:template match="mods">
      <!-- Variables for this item -->
      <xsl:variable name="genres">
         <xsl:for-each select="genre[@type='text_type']">
            <xsl:text>; </xsl:text>
            <xsl:value-of select="."/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="worksperformed">
         <xsl:for-each select="relatedItem/titleInfo[not(@*)]/title">
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
      
      <!-- EAD code for this item -->
      <xsl:comment>EAD <xsl:value-of select="identifier[@type='SPA_ID']"/></xsl:comment>
      <xsl:text>&#xa;</xsl:text>
      <c level="file">
         <xsl:text>&#xa;&#x20;</xsl:text>
         <did>
            <xsl:text>&#xa;&#x20;</xsl:text>
            <xsl:apply-templates select="location/shelfLocator[contains(.,'Box')]"/>
            <xsl:apply-templates select="location/shelfLocator[contains(.,'Folder')]"/>
            <unittitle>
               <xsl:choose>
                  <xsl:when test="titleInfo[@type='alternative']">
                     <xsl:apply-templates select="titleInfo[@type='alternative']"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="titleInfo[not(@*)]/title"/>
                  </xsl:otherwise>
               </xsl:choose>
            </unittitle>
            <xsl:text>&#xa;&#x20;</xsl:text>
            <note>
               <!--<xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="titleInfo[not(@*)]"/>-->
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="identifier[@type='SPA_ID']"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <p>Document type: <xsl:value-of select="substring($genres,3)"/></p>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="language"/>
               <xsl:apply-templates select="subject/genre"/>
               <xsl:apply-templates select="originInfo"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="originInfo/dateIssued"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <xsl:apply-templates select="identifier[@type='ProgramID']"/> 
               
               <xsl:apply-templates select="subject/name[role/roleTerm='prf' and @type='personal']"/>
               <xsl:apply-templates select="subject/name[role/roleTerm='cnd' and @type='personal']"/>
               <xsl:apply-templates select="subject/name[role/roleTerm='prf' and @type='corporate']"/>
               <xsl:apply-templates select="note[not(@*)]"/>
               <xsl:text>&#xa;&#x20;</xsl:text>
               <p>Prokofiev Works(s) Performed: <xsl:value-of select="substring($worksperformed,3)"/></p>
               
               
            </note>
         </did>
      </c>
   </xsl:template>
   <!-- Handling the names  -->
   <xsl:template match="subject/name[role/roleTerm='prf' and @type='personal']">
      <p>Performer: <xsl:value-of select="namePart"/></p>
   </xsl:template>
   <xsl:template match="subject/name[role/roleTerm='prf' and @type='corporate']">
      <p>Organization: <xsl:value-of select="namePart"/></p>
   </xsl:template>
   <xsl:template match="subject/name[role/roleTerm='cnd' and @type='personal']">
      <p>Conductor: <xsl:value-of select="namePart"/></p>
   </xsl:template>
   
   <!-- Handling the names  -->
   
   
   <xsl:template match="titleInfo[@type='alternative']">
      <xsl:value-of select="title"/>
   </xsl:template>
   <xsl:template match="titleInfo[not(@*)]">
      <p>Standard title: <xsl:value-of select="translate(title, '&#x20;&#x9;&#xD;&#xa;', ' ')"/></p>
   </xsl:template>
   <xsl:template match="location/shelfLocator[contains(.,'Box')]">
      <container type="Box" label="Box">
         <xsl:value-of select=" replace(.,'Box ','')"/>
      </container>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <xsl:template match="location/shelfLocator[contains(.,'Folder')]">
      <container type="Folder" label="Folder">
         <xsl:value-of select=" replace(.,'Folder ','')"/>
      </container>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <xsl:template match="identifier[@type='ProgramID']">
      <p>Program Number:<xsl:value-of select=" replace(.,'Call Number ','')"/></p>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   <!-- This is the template for the date created, it wraps in brackets for approximate dates-->
   <xsl:template match="originInfo/dateIssued">
      <p>Date(s): <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="identifier[@type='opus']">
      <p>Opus: <xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="identifier[@type='SPA_ID']">
      <p>ID: SPA_<xsl:value-of select="."/></p>
   </xsl:template>
   <xsl:template match="name">
      <p>Creatorx: <xsl:value-of select="namePart"/></p>
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
      <p>Location: <xsl:value-of select="place/placeTerm"/></p>
   </xsl:template>
   <xsl:template match="relatedItem">
      <p>Work</p>
   </xsl:template>
   <xsl:template match="subject/genre">
      <p>Event type: <xsl:value-of select="."/></p>
      <xsl:text>&#xa;&#x20;</xsl:text>
   </xsl:template>
   
   
</xsl:stylesheet>
