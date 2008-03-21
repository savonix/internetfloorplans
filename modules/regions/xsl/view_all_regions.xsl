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
<xsl:import href="svn://main.xsl"/>
<xsl:template name="content">
	<form action="{self}" method="post">
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/world.png" /> 
			</td>
		</tr>
	</table>
	<table border='0' cellspacing='1' cellpadding='' bgcolor="#BBBBBB" width='100%'>
		<tr>
			<td bgcolor="#EEEEEE" width="10"><!--<input type="checkbox"></input>--></td>
			<td bgcolor='#EEEEEE' width="150">
				<font class="two">Region Name</font></td>
			<td bgcolor='#EEEEEE' width="100">
				<font class="two">Type</font></td>
			<td bgcolor="#EEEEEE"><font class="two">Locations</font></td></tr>
		<!-- Regions-->
		<xsl:for-each select="//get_all_regions">
			<xsl:sort select="region_name"/>
			<xsl:variable name="current_region_id"><xsl:value-of select="region_id"/></xsl:variable>
			<tr>
				<td bgcolor="white" width="10"><input type="checkbox" name="region_id[]"><xsl:attribute name="value"><xsl:value-of select="region_id"/></xsl:attribute></input></td>
				<td bgcolor='white' class="basic-table-cell">
					<font class="one"><a href="/acc/link/rgn/view/&amp;region_id={region_id}"  class="basic-table-cell">
					<xsl:value-of select="region_name"/></a></font>
				</td>
				<td bgcolor='#FFFFFF' width="100">
				<font class="one">Geographic</font></td>
				<td bgcolor='white' class="basic-table"><font class="one">
					<xsl:for-each select="//get_all_region_data">
						<xsl:if test="$current_region_id=region_id">
								<font class="one">&#160;&#160;<xsl:value-of select="name"/><xsl:text> </xsl:text>&#160;&#160;&#160;&#160;</font>
						</xsl:if>
					</xsl:for-each>
				</font></td></tr>					
			</xsl:for-each>
			<tr><td colspan="5" bgcolor="#FFFFFF">
				<table cellpadding="5">
					<tr>
						<td><input type="submit" value="Delete" name="submit" onclick="return confirm('Are you sure you want to delete these regions?')" /></td>
					</tr>
				</table>						
			</td>
		</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
