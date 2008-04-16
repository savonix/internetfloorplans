<!--
Program: Internet Floor Plans
Component: main.xsl
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
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="UTF-8" 
	omit-xml-declaration="yes" 
	doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
 doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html>
<head>
	<title>Internet Floor Plans</title>
    <link rel="stylesheet" type="text/css" href="{//link_prefix}ifp-themed-css" >&#160;</link>
    <xsl:for-each select="//in_head">
        <xsl:sort select="priority"/>
        <xsl:value-of select="string" disable-output-escaping="yes"/>
    </xsl:for-each>
</head>
<body>
<xsl:for-each select="//pre_body_content">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>

<div id="page">
    <div id="banner">
    <h1>Welcome</h1>
    <a href="{//link_prefix}">
        <img src="{//path_prefix}s/img/antenna3.jpg"/>
    </a>
    </div>
    <br/>
    <br/>
    <xsl:call-template name="main-menu"/>

    <div id="content">
        <xsl:call-template name="content"/>
    </div>
</div>

<div id="footer">
<a href="http://www.internetfloorplans.com/blog/">Open Source Internet Floor Plan Software</a>. Copyright Savonix Corporation. License under the AGPL.
</div>
</body>
</html>
</xsl:template>
<xsl:template name="main-menu">
    <div id="top-main-menu">
    <xsl:for-each select="//menu/item[not(@active=0)]">
    <xsl:call-template name="button">
    <xsl:with-param name="key"><xsl:value-of select="key"/></xsl:with-param>
    </xsl:call-template> 
    </xsl:for-each>
    </div>
</xsl:template>

<xsl:template name="button">
    <xsl:param name="key"/>&#160;
        <a class="main-menu" href="{/__ROOT__/runtime/link_prefix}{//menu/item[key=$key]/url}" id="{$key}"><xsl:if test="//show_tool_tips='yes'"><xsl:attribute name="title"><xsl:value-of select="//labels/label[key=$key]/description" /></xsl:attribute></xsl:if><xsl:value-of select="//labels/label[key=$key]/value"/></a>
     </xsl:template>
</xsl:stylesheet>
