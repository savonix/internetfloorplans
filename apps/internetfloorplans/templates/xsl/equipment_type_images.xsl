<!--
Program: Internet Floor Plans
Component: equipment_type_images.xsl
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
<xsl:include href="main.xsl"/>
<xsl:include href="equipment_type_menu.xsl"/>
<xsl:include href="equipment_type_summary.xsl"/>
<xsl:template name="content">
<xsl:call-template name="equipment-type-menu" />
<xsl:call-template name="equipment-type-summary"/>
<!-- Confirm equipment type image deletion -->
<script type="text/javascript">
var question = '<xsl:value-of select="//labels/label[key='confirm_delete']/value"/>';
function equipment_type_image_delete(static_file_id) {
    if(confirm(question)) {
        $.post("<xsl:value-of select="//link_prefix"/>ifp-equipment-type-image-delete",
        {'static_file_id': static_file_id},
        function (data){
        });
    }
}
</script>
<table class="simple-table">
<tr>
    <td align="left">
        <table class="simple-table">
            <thead>
            <tr>
                <th>
                    <xsl:value-of select="//labels/label[key='images']/value"/>
                </th>
            </tr>
            </thead>
            <xsl:for-each select="//static_file_get_by_metadata_key">
            <tr>
                <td>
                    <b><xsl:value-of select="title"/></b>
                </td>
            </tr>
            </xsl:for-each>
        </table>
        <br/>
        <table class="simple-table">
            <thead>
            <tr>
                <th>
                    <xsl:value-of select="//labels/label[key='options']/value"/>
                </th>
            </tr>
            </thead>
            <tbody>
            <xsl:if test="not(//static_file_get_by_metadata_key)">
            <tr>
                <td>
                    <a href="{//link_prefix}ifp-equipment-type-image-edit&amp;equipment_type_id={//_get/equipment_type_id}">
                        <xsl:value-of select="//labels/label[key='add_new_image']/value"/>
                    </a>
                </td>
            </tr>
            </xsl:if>
            <xsl:if test="//static_file_get_by_metadata_key">
            <tr>
                <td>
                    <a href="{//link_prefix}ifp-equipment-type-image-delete&amp;equipment_type_image_id={//equipment_type_get_images/static_file_id}"
                    onclick="equipment_type_image_delete({//equipment_type_get_images/static_file_id}); return false;">
                    <xsl:value-of select="//labels/label[key='delete']/value"/></a>
                </td>
            </tr>
            </xsl:if>
            </tbody>
        </table>
    </td>

    <td align="left" width="80%">
        <xsl:for-each select="//equipment_type_get_images">
            <xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
            or (not(//_get/equipment_type_image_id) and default_image=1)">
                <xsl:value-of select="name"/>
            </xsl:if>
        </xsl:for-each>
        <img src="{//path_prefix}/s/{//static_file_get_by_metadata_key/basename}"/>
    </td>
</tr>
</table>
</xsl:template>
</xsl:stylesheet>
