<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: html_header.xsl
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
  <xsl:template name="header">
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_start">header</xsl:with-param>
    </xsl:call-template>
    <xsl:if test="/_R_/runtime/path_prefix='/demo/'">
      <div style="position: absolute; top: 12px; left: 240px; background-color: white; width: 468px; height: 60px;">
        <script type="text/javascript">
        <![CDATA[
        <!--
        google_ad_client = "pub-9657495873329253";
        //728x90, created 1/5/08
        google_ad_slot = "9737089361";
        google_ad_width = 468;
        google_ad_height = 60;
        //-->
        ]]>
        </script>
        <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
      </div>
    </xsl:if>

    <div id="header">
      <h1>Internet Floor Plans</h1>
      <a href="{//link_prefix}index">
        <img src="{//path_prefix}/s/img/antenna3.jpg" />
      </a>
    </div>
    <xsl:call-template name="source_spacer">
      <xsl:with-param name="section_end">header</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
