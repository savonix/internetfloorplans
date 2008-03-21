<!--
Program: Internet Floor Plans
Component: 
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
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<xsl:call-template name="location_menu" />
		</tr>
	</table>
	<table >
	<xsl:call-template name="location_summary" />
	<tr>
		<td colspan="4" >
	<table border='0' cellspacing='0' cellpadding='2' width='100%'>
		<tr>
			<!--<td width="10">
				<input type="checkbox"></input></td>-->
			<td width="10%">
				<b>ID</b></td>
			<td width="100">
				<b>Equipment Type</b></td>
			<td width="100">
				<b>Container</b></td>
			<td width="50">
				<b>Business</b></td>
			<td width="50">
				<b>Options</b></td>
			<td width="50">
				<b>Edit</b></td>
			<td width="50">
				<b>Delete</b></td>
		</tr>
		<xsl:for-each select="//get_all_assets">
		<tr class="row{position() mod 2}">
			<!--<td width="10">
				<input type="checkbox" name="asset_id[]"><xsl:attribute name="value"><xsl:value-of select="asset_id"/></xsl:attribute></input></td>-->
			<td>
				<a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}&amp;location_address_id={//_get/location_address_id}"><xsl:value-of select="equipment_id"/></a>
			</td>
			<td width="100">
				<xsl:value-of select="name"/></td>
			<td width="100">
				<xsl:value-of select="container_name"/><!--<xsl:value-of select="equipment_type_container_id"/>--></td>
			<td>
				<xsl:value-of select="lob_name"/></td>
			<td>
				<xsl:value-of select="priority_name"/></td>
			<td>
				<a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}">Edit</a></td>
			<td>
				<a href="/acc/link/assets/delete/&amp;equipment_id={equipment_id}" onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a></td>
		</tr>					
		</xsl:for-each>
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
		</td>
	</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
