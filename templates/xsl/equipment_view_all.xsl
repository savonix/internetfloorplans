<!--
Program: Internet Floor Plans
Component: equipment_view_all.xsl
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
<xsl:import href="equipment_menu.xsl"/>

<xsl:template name="content">
	<form method="post">
	<table class="simple-table">
        <thead>
		<tr>
			<!--<th>
				<input type="checkbox"></input></th>
			<th>
				Asset ID</th>-->
			<th>
				Equipment Type</th>
			<th>
				Location</th>
			<th>
				Edit</th>
			<th>
				Delete</th>
		</tr>
        </thead>
        <tbody>
		<xsl:for-each select="//equipment_get_all">
		<tr class="row{position() mod 2}">
			<!--<td>
				<input type="checkbox" name="asset_id[]"><xsl:attribute name="value"><xsl:value-of select="asset_id"/></xsl:attribute></input></td>
			<td>
				<a href="{//link_prefix}assets/edit/&amp;equipment_id={equipment_id}"><xsl:value-of select="asset_id"/></a>
			</td>-->
			<td>
				<xsl:value-of select="name"/></td>
			<td>
				<a href="{//link_prefix}ifp-location-view&amp;location_id={location_id}"><xsl:value-of select="location_address_name"/></a></td>
			<td>
				<a href="{//link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}">Edit</a></td>
			<td>
				<a href="{//link_prefix}ifp-equipment-delete&amp;equipment_id={equipment_id}" onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a></td>
		</tr>
		</xsl:for-each>
        </tbody>
		<!--<tr>
			<td colspan="5" >
				<table>
					<tr>
						<td><input type="submit" value="Delete" name="submit" /></td>
					</tr>
				</table>
			</td>
		</tr>-->
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
