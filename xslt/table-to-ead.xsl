<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:template match="/">
        <dsc>
            <xsl:apply-templates select="/root/row">
                <xsl:sort select="child::Seq" data-type="number"/>
            </xsl:apply-templates>
        </dsc>
    </xsl:template>
    <xsl:template match="row">
        <c id="c-{Seq}" level="file">
            <did>
                <xsl:apply-templates select="Container1"/>
                <xsl:apply-templates select="Container2"/>
                <xsl:apply-templates select="unittitle_clean"/>
            </did>
        </c>
    </xsl:template>
    <xsl:template match="Container1">
        <container type="{ancestor::row/ContainerType1}">
            <xsl:value-of select="normalize-space(.)"/>
        </container>
    </xsl:template>
    <xsl:template match="Container2">
        <container type="{ancestor::row/ContainerType2}">
            <xsl:value-of select="normalize-space(.)"/>
        </container>
    </xsl:template>
    <xsl:template match="unittitle_clean">
        <unittitle>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:apply-templates select="ancestor::row/Date"/>
        </unittitle>
    </xsl:template>
    <xsl:template match="Date">
        <xsl:text>,&#160;</xsl:text>
        <xsl:element name="unitdate">
            <xsl:apply-templates select="following-sibling::dateType"/>
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="dateType">
        <xsl:attribute name="type">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:attribute>
        <xsl:if test=". = 'inclusive'">
            <xsl:attribute name="normal">
                <xsl:value-of select="normalize-space(ancestor::row/startDate)"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="normalize-space(ancestor::row/endDate)"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
