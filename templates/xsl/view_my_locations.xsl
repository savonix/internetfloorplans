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
<xsl:template name="content">
	<table border='0' cellspacing='1' cellpadding='5' >
		
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<!--
			<form action="{self}" method="post">
			<td align="left">
				Region:
				<select name="region_id">
					<option value="all">All</option>	
					<xsl:for-each select="//get_all_regions">
						<option value="{region_id}"><xsl:if test="//_post/region_id=region_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="region_name"/></option>
					</xsl:for-each>
				</select>
				<input type="submit"/>
			</td>
			</form>-->
		</tr>
	</table>
	<table border='0' cellspacing='1' cellpadding='' width='100%'>
		<tr>
			<!--<td bgcolor='#EEEEEE' width="20"><input type="checkbox" /></td>-->
			<td bgcolor='#EEEEEE' width='110' class="basic-table-cell">Branch Name</td>
			<td bgcolor='#EEEEEE' width='140' class="basic-table-cell">Address</td>
			<td bgcolor='#EEEEEE' width='82' class="basic-table-cell">City</td>
			<td bgcolor='#EEEEEE' width='72' class="basic-table-cell">Phone</td>
			<td bgcolor='#EEEEEE' class="basic-table-cell">Contact</td>
		</tr>
		<xsl:for-each select="//get_all_locations">
		<tr>
			<!--<td bgcolor='white'><input type="checkbox" /></td>-->
			<td bgcolor='white' width='110' class="basic-table-cell"><a href="/acc/link/my_loc/view/sp/&amp;location_address_id={location_address_id}" class="basic-table-cell"><xsl:value-of select="name"/></a></td>
			<td bgcolor='white' width='120' class="basic-table-cell"><font class="basic-table-cell"><xsl:value-of select="address_line_1"/></td>
			<td bgcolor='white' width='140' class="basic-table-cell"><xsl:value-of select="city"/></td>
			<td bgcolor='white' width='92' class="basic-table-cell"><xsl:value-of select="phone"/></td>
			<td bgcolor='white' class="basic-table-cell">
			<a class="basic-table-cell"><xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute><xsl:value-of select="manager"/></a></td>
		</tr>					
		</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>
