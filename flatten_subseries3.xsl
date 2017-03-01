<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="root">
        <root>
            <xsl:apply-templates select="/root/row"/>
        </root>
    </xsl:template>

    <xsl:template
        match="
            row
            [Subseries3/normalize-space()]
            [following-sibling::row[1][Subseries4/normalize-space()]]">
        <row>
            <xsl:apply-templates select="child::*"/>
            <subseries3>Y</subseries3>
        </row>
    </xsl:template>

    <xsl:template match="
            row
            [Subseries4/normalize-space()]">
        <xsl:variable name="subseries3_heading" select="preceding::Subseries3[normalize-space()][1]"/>
        <xsl:message select="$subseries3_heading"/>
        <row>
            <xsl:apply-templates select="child::* except (Subseries4, Subseries3)"/>
            <subseries3>
                <xsl:value-of select="$subseries3_heading"/>
            </subseries3>
            <subseries4>
                <xsl:value-of select="$subseries3_heading"/>
                <xsl:text> : </xsl:text>
                <xsl:value-of select="Subseries4"/>
            </subseries4>
        </row>
    </xsl:template>

    <xsl:template match="
            row
            [Subseries5/normalize-space()]">
        <xsl:variable name="subseries3_heading" select="preceding::Subseries3[normalize-space()][1]"/>
        <xsl:variable name="subseries4_heading" select="preceding::Subseries4[normalize-space()][1]"/>
        <xsl:message select="$subseries3_heading"/>
        <row>
            <xsl:apply-templates select="child::* except (Subseries5,Subseries4,Subseries3)"/>
            <subseries3>
                <xsl:value-of select="$subseries3_heading"/>
            </subseries3>
            <subseries4>
                <xsl:value-of select="$subseries3_heading"/>
                <xsl:text> : </xsl:text>
                <xsl:value-of select="$subseries4_heading"/>
            </subseries4>
            <subseries5>
                <xsl:value-of select="$subseries3_heading"/>
                <xsl:text> : </xsl:text>
                <xsl:value-of select="$subseries4_heading"/>
                <xsl:text> : </xsl:text>
                <xsl:value-of select="Subseries5"/>
            </subseries5>
        </row>
    </xsl:template>
<!--    <xsl:template match="row/*[not(normalize-space())]"/> -->
    <xsl:template match="row">
        <row>
            <xsl:apply-templates/>
        </row>
    </xsl:template>
    <xsl:template match="row/*[normalize-space()]">
        <xsl:copy-of select="."></xsl:copy-of>
    </xsl:template>
    <xsl:template match="row[HeadingY/normalize-space()]"/>
</xsl:stylesheet>
