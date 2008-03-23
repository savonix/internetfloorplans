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
<table>
<tr>
    <td align="left" valign="top">
        <table >
            <tr>
                <td valign="top">
                    Images
                </td>
            </tr>
            <xsl:for-each select="//get_asset_type_images" >
            <tr>
                <td valign="top">
                    <a>
                            <xsl:attribute name="href">&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/>&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/></xsl:attribute>
                                <xsl:value-of select="name"/></a>
                </td>
            </tr>
            </xsl:for-each>
        </table>
        <br/>
        <table >
            <tr>
                <td valign="top">
                    Options
                </td>
            </tr>
            <xsl:if test="not(//get_asset_type_images)">
            <tr>
                <td valign="top" >
                    <a><xsl:attribute name="href">add/&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/></xsl:attribute>Add New Image</a>
                </td>
            </tr>
            </xsl:if>
            <tr>
                <td valign="top" >
                    <a onclick="return confirm('Are you sure you want to delete this equipment type image?')"><xsl:attribute name="href">delete/&amp;equipment_type_image_id=<xsl:if test="//_get/equipment_type_image_id"><xsl:value-of select="//_get/equipment_type_image_id"/></xsl:if><xsl:if test="not(//_get/equipment_type_image_id)"><xsl:for-each select="//get_asset_type_images"><xsl:if test="(default_image=1) or (count(//get_asset_type_images)=1)"><xsl:value-of select="equipment_type_image_id"/></xsl:if></xsl:for-each></xsl:if></xsl:attribute>Delete This Image</a>
                </td>
            </tr>
        </table>
    </td>
    
    <td align="left" valign="top">
        <table >
            <tr>
                <td>
                    <xsl:for-each select="//get_asset_type_images">
                        <xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
                        or (not(//_get/equipment_type_image_id) and default_image=1)">
                            <xsl:value-of select="name"/>
                        </xsl:if>
                    </xsl:for-each>
                    
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <img ><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_asset_type_images/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_asset_type_images/mime_type"/>&amp;type=merchandising</xsl:attribute></img>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
