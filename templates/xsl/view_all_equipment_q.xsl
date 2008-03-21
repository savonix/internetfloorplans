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
	<table border='0' cellspacing='0' cellpadding='2' width='100%'>
		<tr>
			<!--<td width="10">
				<input type="checkbox"></input></td>
			<td width="10%">
				<b>Asset ID</b></td>-->
			<td width="300">
				<b>Equipment Type</b></td>
			<td width="30%">
				<b>Quantity</b></td>

		</tr>
		<xsl:for-each select="//get_asset_types">
						<xsl:variable name="my_equipment_type_id"><xsl:value-of select="equipment_type_id"/></xsl:variable>
						<tr class="row{position() mod 2}">
							<td valign="top">
								<xsl:value-of select="name"/></td>
								<td><xsl:value-of select="count(//get_all_assets2[equipment_type_id=$my_equipment_type_id])"/></td>
							<!--<td width="10">
								<input type="checkbox" name="asset_id[]"><xsl:attribute name="value"><xsl:value-of select="asset_id"/></xsl:attribute></input></td>-->
							<!--<td valign="top">
								<a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}"><xsl:value-of select="asset_id"/></a>
							</td>-->
							
							<!--
							<td valign="top">
								<img src="/resources/img/22x28_ActNow_red.gif"/></td>
							-->
							
							<!--<td valign="top">
								<a href="/acc/link/assets/edit/&amp;equipment_id={equipment_id}">Edit</a></td>
							<td valign="top">
								<a href="/acc/link/assets/delete/&amp;equipment_id={equipment_id}" onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a></td>-->
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
	</form>
</xsl:template>
</xsl:stylesheet>
