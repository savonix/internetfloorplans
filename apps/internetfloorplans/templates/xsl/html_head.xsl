<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: html_head.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template name="head">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>

    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">head</xsl:with-param>
    </xsl:call-template>
    <xsl:variable name="gate_key" select="//menu/item/item[url=/_R_/_get/nid]/key"/>
    <head>
      <title>
        Internet Floor Plans: 
        <xsl:value-of select="/_R_/i18n/*[name()=$gate_key]"/>
        <xsl:value-of select="//location_get_summary/location_get_summary/name"/>
      </title>
      <link rel="stylesheet" type="text/css" href="{$path_prefix}/s/css/clickmenu.css" />
      <link rel="stylesheet" type="text/css" href="{$link_prefix}dynamic-css"></link>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/jquery.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.cookiejar.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.dimensions.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.cookie.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.json.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.tablesorter.cookie.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jquery/plugins/jquery.clickmenu.js"></script>
      <script type="text/javascript" src="{$path_prefix}/s/js/jsval.js"></script>
      <xsl:for-each select="//head_nodes">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
    </head>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">head</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
