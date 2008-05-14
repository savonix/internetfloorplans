<!--
Program: Internet Floor Plans
Component: location_equipment.xsl
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
<xsl:include href="location_summary.xsl"/>
<xsl:include href="location_menu.xsl"/>
<xsl:include href="pager.xsl"/>
<xsl:template name="content">
<xsl:call-template name="jquery-setup">
    <xsl:with-param name="my-table">my-location-equipment-list</xsl:with-param>
    <xsl:with-param name="my-table-div">my-location-equipment-list-div</xsl:with-param>
</xsl:call-template>
<div id="my-location-equipment-list-div">

<xsl:call-template name="location_menu" />

<xsl:call-template name="location_summary" />
<table width="100%" class="tablesorter" id="my-location-equipment-list">
        <thead>
        <tr>
            <th><xsl:value-of select="//labels/label[key='equipment_type']/value"/></th>
            <th><xsl:value-of select="//labels/label[key='quantity']/value"/></th>
        </tr>
        </thead>
        <tbody>
        <xsl:for-each select="//equipment_types_get_all">
        <xsl:variable name="my_equipment_type_id"><xsl:value-of select="equipment_type_id"/></xsl:variable>
        <tr>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:value-of select="count(//location_get_equipment[equipment_type_id=$my_equipment_type_id])"/>
            </td>
        </tr>
        </xsl:for-each>
	</tbody>
</table>
</div>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">my-equipment-view-all</xsl:with-param>
</xsl:call-template>
</xsl:template>
</xsl:stylesheet>
