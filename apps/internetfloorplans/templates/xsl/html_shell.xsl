<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: html_shell.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" indent="yes" 
  encoding="UTF-8" omit-xml-declaration="no" 
  doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" 
  doctype-system="http://www.w3.org/TR/html4/loose.dtd" />
  <xsl:template match="/">

  	<!-- Variables to use as parameters throughout the templates -->
    <xsl:variable name="link_prefix" select="//link_prefix"/>

    <xsl:variable name="path_prefix" select="//path_prefix"/>

    <xsl:variable name="i18n" select="/_R_/i18n"/>
    <!-- End initial variables -->

    <html>

      <xsl:call-template name="head">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
      </xsl:call-template>

      <body>
        <xsl:for-each select="//pre_body_content">
          <xsl:sort select="priority" order="ascending"/>
          <xsl:apply-templates select="nodes/*"/>
        </xsl:for-each>


        <xsl:call-template name="main">
          <xsl:with-param name="link_prefix" select="$link_prefix"/>
          <xsl:with-param name="path_prefix" select="$path_prefix"/>
					<xsl:with-param name="i18n" select="$i18n"/>
        </xsl:call-template>




        <xsl:for-each select="/_R_/footer">
          <xsl:sort select="priority"/>
          <xsl:value-of select="string" disable-output-escaping="yes"/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
<xsl:template match="node()">
<xsl:element name="{name()}">
<xsl:apply-templates select="@*|node()"/>
</xsl:element>
</xsl:template>

<xsl:template match="@*|text()|comment()|processing-instruction()">
<xsl:copy/>
</xsl:template>

</xsl:stylesheet>
