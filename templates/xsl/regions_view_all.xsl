<!--
Program: Internet Floor Plans
Component: regions_view_all.xsl
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
<xsl:template name="content">
	<form method="post">
	<table>
		<tr>
			<td><!--<input type="checkbox"></input>--></td>
			<td>
				Region Name</td>
			<td>
				Type</td>
			<td>Locations</td></tr>
		<!-- Regions-->
		<xsl:for-each select="//regions_get_all">
			<xsl:sort select="region_name"/>
			<xsl:variable name="current_region_id"><xsl:value-of select="region_id"/></xsl:variable>
			<tr>
				<td><input type="checkbox" name="region_id[]"><xsl:attribute name="value"><xsl:value-of select="region_id"/></xsl:attribute></input></td>
				<td class="basic-table-cell">
					<a href="/acc/link/rgn/view/&amp;region_id={region_id}"  class="basic-table-cell">
					<xsl:value-of select="region_name"/></a>
				</td>
				<td>
				Geographic</td>
				<td class="basic-table">
					<xsl:for-each select="//get_all_region_data">
						<xsl:if test="$current_region_id=region_id">
								<xsl:value-of select="name"/><xsl:text> </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</td></tr>					
			</xsl:for-each>
			<tr><td colspan="5" >
				<table cellpadding="5">
					<tr>
						<td><input type="submit" value="Delete" name="submit" 
                        onclick="return confirm('Are you sure you want to delete these regions?')" /></td>
					</tr>
				</table>						
			</td>
		</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>