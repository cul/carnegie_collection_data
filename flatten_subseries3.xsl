<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:template match="/">
    <xsl:apply-templates/>
</xsl:template>
    
<xsl:template match="root">
    <xsl:for-each-group select="row" group-by="Subseries1_L">
       <xsl:value-of select="current-grouping-key()"/>
    </xsl:for-each-group>
</xsl:template>

</xsl:stylesheet>