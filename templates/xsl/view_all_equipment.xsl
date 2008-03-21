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
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="equipment_menu.xsl"/>

<xsl:template name="content">
	<form action="{self}" method="post">
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			<xsl:call-template name="equipment_menu" />
			
		</tr>
	</table>
	<table border='0' cellspacing='0' cellpadding='2' bgcolor="white" width='100%'>
		<tr>
			<!--<td  width="10">
				<input type="checkbox"></input></td>
			<td width="10%">
				<font class="two"><b>Asset ID</b></font></td>-->
			<td width="300">
				<font class="two"><b>Equipment Type</b></font></td>
			<td width="30%">
				<font class="two"><b>Location</b></font></td>
			<td width="20%">
				<font class="two"><b>Edit</b></font></td>
			<td width="20%">
				<font class="two"><b>Delete</b></font></td>
		</tr>
		<xsl:for-each select="//get_all_assets2">
		<tr class="row{position() mod 2}">
			<!--<td bgcolor="white" width="10">
				<input type="checkbox" name="asset_id[]"><xsl:attribute name="value"><xsl:value-of select="asset_id"/></xsl:attribute></input></td>
			<td>
				<font class="one"><a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}"><xsl:value-of select="asset_id"/></a></font>
			</td>-->
			<td width="300">
				<font class="one"><xsl:value-of select="name"/></font></td>
			<td>
				<font class="one"><a href="/acc/link/loc/view/eqp/&amp;location_address_id={location_address_id}"><xsl:value-of select="location_address_name"/></a></font></td>
			<td>
				<font class="one"><a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}">Edit</a></font></td>
			<td>
				<font class="one"><a href="/acc/link/assets/delete/&amp;equipment_id={equipment_id}" onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a></font></td>
		</tr>					
		</xsl:for-each>
		<!--<tr>
			<td colspan="5" >
				<table cellpadding="5">
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
