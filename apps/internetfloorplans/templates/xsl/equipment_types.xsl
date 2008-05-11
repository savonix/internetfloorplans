<!--
Program: Internet Floor Plans
Component: equipment_types.xml
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
<xsl:include href="pager.xsl"/>
<xsl:template name="content">
<xsl:call-template name="jquery-setup">
    <xsl:with-param name="my-table">myequipmenttypes</xsl:with-param>
    <xsl:with-param name="my-table-div">my-equipment-types-div</xsl:with-param>
    <xsl:with-param name="no-sort-column">,
        headers: {
            2: {sorter: false},
            3: {sorter: false}
	    }
    </xsl:with-param>
</xsl:call-template>
<!-- Confirm equipment deletion -->
<script type="text/javascript">
    var question = 'Are you sure you want to delete this equipment type?';
    function equipment_type_delete(equipment_type_id,row) {
        if(confirm(question)) {
            $.post("<xsl:value-of select="//link_prefix"/>ifp-equipment-type-delete", {'equipment_type_id': equipment_type_id}, 
            function (data){
                myTable = document.getElementById("myequipmenttypes");
                myTable.deleteRow(row);
            });
        }
    }
</script>
<div id="my-equipment-types-div">
<script type="text/javascript">
    document.getElementById('my-equipment-types-div').style.visibility = 'hidden';
</script>
<table width="100%" class="tablesorter" id="myequipmenttypes">
    <thead>
    <tr>
        <th><xsl:value-of select="//labels/label[key='equipment_type_name']/value"/></th>
        <th><xsl:value-of select="//labels/label[key='description']/value"/></th>
        <th><xsl:value-of select="//labels/label[key='edit']/value"/></th>
        <th><xsl:value-of select="//labels/label[key='delete']/value"/></th>
    </tr>
    </thead>
    <tbody>
    <xsl:for-each select="//equipment_types_get_all">
    <tr>
        <td>
            <a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">
                <xsl:value-of select="name"/>
            </a>
        </td>
        <td>
            <xsl:value-of select="description"/>
        </td>
        <td>
            <a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">
                <xsl:value-of select="//labels/label[key='edit']/value"/>
            </a>
        </td>
        <td>
            <a href="{//link_prefix}ifp-equipment-type-delete&amp;equipment_type_id={equipment_type_id}"
            onclick="equipment_type_delete({equipment_type_id},this.parentNode.parentNode.rowIndex); return false;">
            <xsl:value-of select="//labels/label[key='delete']/value"/>
            </a>
        </td>
    </tr>
    </xsl:for-each>
    </tbody>
</table>
</div>
<a href="{//link_prefix}ifp-equipment-type-edit"><xsl:value-of select="//labels/label[key='new_equipment_type']/value"/></a>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">myequipmenttypes</xsl:with-param>
</xsl:call-template>
</xsl:template>
</xsl:stylesheet>
