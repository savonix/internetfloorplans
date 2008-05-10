<!--
Program: Internet Floor Plans
Component: equipment_view.xsl
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
<xsl:import href="main.xsl"/>
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:template name="content">
<form method="post">
<xsl:call-template name="equipment_type_menu" />
<xsl:call-template name="asset_type_summary" />
<table class="simple-table">
<tr>
    <td align="left">
        <table>
            <tr>
                <td>
                    <xsl:value-of select="//labels/label[key='images']/value"/>
                </td>
            </tr>
            <xsl:for-each select="//equipment_type_images_get_all" >
            <tr>
                <td>
                    <a><xsl:value-of select="name"/></a>
                </td>
            </tr>
            </xsl:for-each>
        </table>
        <br/>
        <table>
            <tr>
                <td>
                    <xsl:value-of select="//labels/label[key='options']/value"/>
                </td>
            </tr>
            <xsl:if test="not(//get_asset_type_images)">
            <tr>
                <td>
                    <a href="#"><xsl:value-of select="//labels/label[key='add_new_image']/value"/></a>
                </td>
            </tr>
            </xsl:if>
            <tr>
                <td>
                    <a href="{//link_prefix}ifp-equipment-delete"
                    onclick="return confirm('Are you sure you want to delete this equipment type image?')">
                    <xsl:value-of select="//labels/label[key='delete_this_image']/value"/></a>
                </td>
            </tr>
        </table>
    </td>

    <td align="left">
        <xsl:for-each select="//get_asset_type_images">
            <xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
            or (not(//_get/equipment_type_image_id) and default_image=1)">
                <xsl:value-of select="name"/>
            </xsl:if>
        </xsl:for-each>
    </td>
</tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
