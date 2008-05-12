<!--
Program: Internet Floor Plans
Component: equipment_type_symbols.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="main.xsl"/>
<xsl:include href="equipment_type_menu.xsl"/>
<xsl:include href="equipment_type_summary.xsl"/>
<xsl:template name="content">
<xsl:call-template name="equipment-type-menu" />
<xsl:call-template name="equipment-type-summary"/>
<table><tr><td>
<table class="simple-table">
<tr>
    <td>
        <xsl:value-of select="//labels/label[key='symbols']/value"/>
    </td>
</tr>
<xsl:for-each select="//get_equipment_type_symbols">
<tr>
    <td>
        <a><xsl:value-of select="name"/></a>
    </td>
</tr>
</xsl:for-each>
<tr>
    <td>
<xsl:value-of select="//labels/label[key='options']/value"/>
    </td>
</tr>
<xsl:if test="not(//get_equipment_type_symbols)">
<tr>
    <td>
        <a href="{//link_prefix}ifp-equipment-type-icon-edit&amp;equipment_type_id={//_get/equipment_type_id}">
        <xsl:value-of select="//labels/label[key='add_new_icon']/value"/>
        </a>
    </td>
</tr>
</xsl:if>
<tr>
    <td>
        <a onclick="return confirm('Are you sure you want to delete this equipment type symbol?')">
            <xsl:value-of select="//labels/label[key='delete_this_icon']/value"/>
        </a>
    </td>
</tr>
</table>
</td><td>
<table class="simple-table">
<tr>
    <td>
        <xsl:for-each select="//get_equipment_type_icons">
            <xsl:value-of select="name"/>
        </xsl:for-each>
    </td>
</tr>
<tr>
    <td>
<!-- FIXME - This is broken -->
<img src="{//path_prefix}{//get_equipment_type_symbols/symbol_pointer}"/>

    </td>
</tr>
<tr>
    <td>
        <xsl:value-of select="//labels/label[key='comments']/value"/>:
    </td>
</tr>
<tr>
    <td>
        <xsl:for-each select="//get_equipment_type_symbols">
            <xsl:if test="equipment_type_symbol_id=//_get/equipment_type_symbol_id
            or (not(//_get/equipment_type_symbol_id) and default_symbol=1)">
                <xsl:value-of select="comments"/>
            </xsl:if>
        </xsl:for-each>
        
    </td>
</tr>
</table>
</td></tr></table>
</xsl:template>
</xsl:stylesheet>