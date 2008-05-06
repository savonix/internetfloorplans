<!--
Program: Internet Floor Plans
Component: main_menu.xsl
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
<xsl:template name="main-menu">

<script type="text/javascript">
$(document).ready(function()
{
    $('#top-main-menu-ul').clickMenu();
});
</script>
    <ul id="top-main-menu-ul">
    <xsl:for-each select="//menu/item[not(@active=0)]">
    <li>
        <xsl:call-template name="button">
            <xsl:with-param name="key">
                <xsl:value-of select="key"/>
            </xsl:with-param>
        </xsl:call-template>
    </li>
    </xsl:for-each>
    </ul>
</xsl:template>

<xsl:template name="button">
    <xsl:param name="key"/>
        <xsl:value-of select="//labels/label[key=$key]/value"/>
        <ul>
        <li>
        <a class="main-menu" href="{/__ROOT__/runtime/link_prefix}{//menu/item[key=$key]/url}" id="{$key}">
            <xsl:if test="//show_tool_tips='yes'">
                <xsl:attribute name="title"><xsl:value-of select="//labels/label[key=$key]/description" /></xsl:attribute>
            </xsl:if>
        <xsl:value-of select="//labels/label[key=$key]/value"/>
        </a>
        </li>
        </ul>
 </xsl:template>
</xsl:stylesheet>
