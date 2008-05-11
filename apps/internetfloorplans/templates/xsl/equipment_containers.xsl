<!--
Program: Internet Floor Plans
Component: equipment_containers.xsl
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
<xsl:call-template name="equipment-type-summary" />

<table>
<tr>
    <td align="left">
        <table>
            <tr>
                <td>
                    <xsl:value-of select="//labels/label[key='add_containers']/value"/>
                </td>
            </tr>
            <form method="post">
            <input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
            <tr>
                <td>
                <xsl:value-of select="//labels/label[key='name']/value"/>:
                <input type="text" size="12" name="name"/><br/>
                <select name="container_id">
                    <xsl:for-each select="//get_container_types" >
                        <option value="{container_id}"><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                </select>
                    <input type="submit" value="Add"/>
                </td>
            </tr>
            </form>
        </table>
        <br/>
        <table>
            <form action="{//link_prefix}ifp-equipment-container-delete" method="post">
            <input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
            <tr>
                <td>
                    <xsl:value-of select="//labels/label[key='delete_container']/value"/>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="equipment_type_container_id">
                    <xsl:for-each select="//get_container_by_type_id" >
                        <option value="{equipment_type_container_id}"><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                    </select> <br/>
                    <input type="submit" value="Delete"/>
                </td>
            </tr>
            </form>
        </table>
    </td>
    
    <td align="left">
        <table>
            <tr>
                <td>
                    <xsl:for-each select="//get_equipment_type_images">
                        <xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
                        or (not(//_get/equipment_type_image_id) and default_image=1)">
                            <xsl:value-of select="name"/>
                        </xsl:if>
                    </xsl:for-each>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="//labels/label[key='comments']/value"/>:
                </td>
            </tr>
            <tr>
                <td>
                    <xsl:for-each select="//get_equipment_type_images">
                        <xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
                        or (not(//_get/equipment_type_image_id) and default_image=1)">
                            <xsl:value-of select="comments"/>
                        </xsl:if>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>
</xsl:template>
</xsl:stylesheet>
