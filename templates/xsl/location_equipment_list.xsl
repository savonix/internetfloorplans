<!--
Program: Internet Floor Plans
Component: location_equipment_list.xml
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
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
	<form method="post"><xsl:attribute name="action">/<xsl:value-of select="//self"/></xsl:attribute>
	<input type="hidden" name="location_address_id"><xsl:attribute name="value"><xsl:value-of select="//_get/location_address_id"/></xsl:attribute></input>
    <xsl:call-template name="location_menu" />
	<xsl:call-template name="location_summary" />
    <table class="simple-table">
        <thead>
		<tr>
			<th>
				ID</th>
			<th>
				Equipment Type</th>
			<th>
				Container</th>
			<th>
				Business</th>
			<th>
				Options</th>
			<th>
				Edit</th>
			<th>
				Delete</th>
		</tr>
        </thead>
        <tbody>
		<xsl:for-each select="//location_get_equipment">
		<tr class="row{position() mod 2}">
			<!--<td width="10">
				<input type="checkbox" name="asset_id[]"><xsl:attribute name="value"><xsl:value-of select="asset_id"/></xsl:attribute></input></td>-->
			<td>
				<a href="{//link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}&amp;location_address_id={//_get/location_address_id}"><xsl:value-of select="equipment_id"/></a>
			</td>
			<td>
				<xsl:value-of select="name"/>
            </td>
			<td>
				<xsl:value-of select="container_name"/><!--<xsl:value-of select="equipment_type_container_id"/>--></td>
			<td>
				<xsl:value-of select="lob_name"/></td>
			<td>
				<xsl:value-of select="priority_name"/></td>
			<td>
				<a href="{//link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}">Edit</a></td>
			<td>
				<a href="{//link_prefix}ifp-equipment-delete&amp;equipment_id={equipment_id}" 
                onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a></td>
		</tr>
		</xsl:for-each>
        </tbody>
	</table>
	</form>
    <a href="{//link_prefix}ifp-equipment-edit&amp;location_id={//_get/location_id}">Add New Equipment</a>
</xsl:template>
</xsl:stylesheet>
