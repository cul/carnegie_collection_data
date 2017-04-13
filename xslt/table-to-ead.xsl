<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:template match="/">
        <dsc>
            <xsl:apply-templates select="/root/row"><xsl:sort select="child::Seq" data-type="number"/></xsl:apply-templates>
        </dsc>
    </xsl:template>
    <xsl:template match="row">
        <c id="c-{Seq}">
            <xsl:apply-templates select="Container1"/>
            <xsl:apply-templates select="Container2"/>
            <xsl:apply-templates select="unittitle_clean"/>
        </c>
    </xsl:template>
    <xsl:template match="Container1">
        <container type="{ancestor::row/Container1Type}">
            <xsl:value-of select="normalize-space(.)"/>
        </container>
    </xsl:template>
    <xsl:template match="Container2">
        <container type="{ancestor::row/Container2Type}">
            <xsl:value-of select="normalize-space(.)"/>
        </container>
    </xsl:template>
    <xsl:template match="unittitle_clean">
      <unittitle><xsl:value-of select="normalize-space(.)"/></unittitle>
    </xsl:template>
</xsl:stylesheet>