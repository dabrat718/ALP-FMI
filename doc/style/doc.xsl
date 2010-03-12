<?xml version='1.0' encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<!-- We want the TOC links in the titles, and in blue. -->
<xsl:param name="latex.hyperparam">colorlinks,linkcolor=blue,pdfstartview=FitH</xsl:param>

<!-- Hide collaboration table -->
<!--<xsl:param name="doc.collab.show">0</xsl:param>-->
<xsl:param name="draft.mode">no</xsl:param>

<!-- Set up for Bulgarian -->
<xsl:param name="latex.unicode.use">1</xsl:param>
<xsl:param name="latex.encoding">utf8</xsl:param>
<xsl:param name="latex.babel.language">bulgarian</xsl:param>
<!--<xsl:param name="latex.output.revhistory">0</xsl:param>-->
<xsl:param name="co.linkends.show" select="'0'"/>
<xsl:param name="doc.pdfauthor.show">1</xsl:param>

<xsl:template name="encode.before.style">
  <xsl:param name="lang"/>
  <xsl:variable name="use-unicode">
    <xsl:call-template name="lang-in-unicode">
      <xsl:with-param name="lang" select="$lang"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- XeTeX preamble to handle fonts -->
  <xsl:text>\IfFileExists{ifxetex.sty}{%
    \usepackage{ifxetex}%
  }{%
    \newif\ifxetex
    \xetexfalse
  }
  </xsl:text>
  <xsl:text>\ifxetex&#10;</xsl:text>
  <xsl:text>\usepackage{fontspec}&#10;</xsl:text>
  <xsl:text>\usepackage{xltxtra}&#10;</xsl:text>
  <xsl:value-of select="$xetex.font"/>
  <xsl:text>\else&#10;</xsl:text>

  <!-- Standard latex font setup -->
  <xsl:choose>
  <xsl:when test="$use-unicode='1'"/>
  <xsl:when test="$latex.encoding='latin1'">
    <xsl:text>\usepackage[T1]{fontenc}&#10;</xsl:text>
    <xsl:text>\usepackage[latin1]{inputenc}&#10;</xsl:text>
  </xsl:when>
  <xsl:when test="$latex.encoding='utf8'">
    <xsl:text>\usepackage[T2A,T2D,T1]{fontenc}&#10;</xsl:text>
    <xsl:text>\usepackage{ucs}&#10;</xsl:text>
    <xsl:text>\usepackage[utf8]{inputenc}&#10;</xsl:text>
    <xsl:text>\def\hyperparamadd{unicode=true}&#10;</xsl:text>
  </xsl:when>
  </xsl:choose>

  <xsl:text>\fi&#10;</xsl:text>
</xsl:template>

<xsl:template match="authorgroup">
  <xsl:variable name="string">
    <xsl:for-each select="author">
      <xsl:value-of select="firstname"/><xsl:text> </xsl:text> <xsl:value-of select="surname"/>
      <xsl:text>
        \textit{</xsl:text><xsl:value-of select="authorblurb/para"/><xsl:text>}</xsl:text>
      <xsl:if test="email">
        <xsl:text> \text{\small{(\href{mailto:</xsl:text><xsl:value-of select="email"/><xsl:text>}{</xsl:text><xsl:value-of select="email"/><xsl:text>})}}</xsl:text>
      </xsl:if>
      <xsl:if test="position()!=last()">
        <xsl:text>,\\</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:value-of select="normalize-space($string)"/>
</xsl:template>
</xsl:stylesheet>
