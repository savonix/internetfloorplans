<!--
    Program: Internet Floor Plans
    Component: dynamic.css.xsl
    Copyright: Savonix Corporation
    Author: Albert L. Lash, IV
    License: Gnu Affero Public License version 3
    http://www.gnu.org/licenses
    
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    
    You should have received a copy of the GNU Affero General Public License
    along with this program; if not, see http://www.gnu.org/licenses
    or write to the Free Software Foundation,Inc., 51 Franklin Street,
    Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:include href="base.css.xsl"/>
<xsl:include href="colors.css.xsl"/>
<xsl:include href="layout.css.xsl"/>
<xsl:include href="typography.css.xsl"/>
<xsl:template match="/">

<xsl:call-template name="base"/>
<xsl:call-template name="typography"/>
<xsl:call-template name="layout"/>
<xsl:call-template name="colors"/>










.simple-table {
    border-spacing: 1px;
    background-color: #CCC;
    width: 100%;
    margin-bottom: 1em;
}

.simple-table td {
    background-color: #FFF; padding: .5em;
}

.simple-table thead th {
    background-color: #EEE; padding: .5em;
}

.generic-button {
    text-align: center;
    margin-left: .5em;
}

.generic-button a {
    padding: .3em .5em .3em .5em;
    border: 2px; border-style: solid;
    border-color: #BBB;
    text-align: center;
}

.generic-button img {
    margin-bottom: -4px; margin-right: 6px;
}

a.generic-button {
    padding: .3em .5em .3em .5em; border: 2px; border-style: solid; border-color: #BBB;
    text-align: center;
}


a {
    color: <xsl:value-of select="//option_get[option_key='link_color']/option_value"/>
}

h1 { 
    font-size: 1.5em;
}
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-blue</xsl:with-param>
    <xsl:with-param name="background-color">#F1F1F1</xsl:with-param>
    <xsl:with-param name="color">#0066B9</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-green</xsl:with-param>
    <xsl:with-param name="background-color">#66FF99</xsl:with-param>
    <xsl:with-param name="color">#009900</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-black</xsl:with-param>
    <xsl:with-param name="background-color">grey</xsl:with-param>
    <xsl:with-param name="color">black</xsl:with-param>
</xsl:call-template>

</xsl:template>



<xsl:template name="thematic-button">
<xsl:param name="button-name"/>
<xsl:param name="background-color"/>
<xsl:param name="color"/>
.button-<xsl:value-of select="$button-name"/>
{
    padding: .2em .4em;
    background-color: <xsl:value-of select="$background-color"/>;
    color: <xsl:value-of select="$color"/>;
    font-weight: bold;
    border-style: solid;
    border-width: 1px;
    border-color: <xsl:value-of select="$color"/>;
    margin: .5em;
    cursor: pointer;
}
</xsl:template>

</xsl:stylesheet>
