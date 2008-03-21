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
<xsl:template name="content">
	<form action="{self}" method="post">
	<input type="hidden" name="region_id"><xsl:attribute name="value"><xsl:value-of select="//_get/region_id"/></xsl:attribute></input>
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/world.png" /> 
			</td>
		</tr>
	</table>
	<table border='0' cellspacing='1' cellpadding='0' bgcolor="#FFFFFF" width="100%">
	<tr><td width="100%">
		<table border="0" cellpadding="4" cellspacing="1" bgcolor="#DDDDDD" width="600">
			<tr>	
				<td width="150" bgcolor="white"><font class='two'>Region Name:</font></td>
				<td bgcolor="white"><input type='text' name='name'><xsl:attribute name="value"> <xsl:value-of select="//get_region_name_g/region_name" /></xsl:attribute></input></td>
			</tr>
			<tr>	
				<td width="150" bgcolor="white" valign="top"><font class='two'>Locations:</font></td>
				<td bgcolor="white">
                    <table>
                        <xsl:for-each select="//get_all_locations" >
                            <tr><td valign="top"><input type="checkbox" name="location_address_id[]" value="{location_address_id}"> 
									<xsl:variable name="current_id"><xsl:value-of select="location_address_id"/></xsl:variable>
									<xsl:for-each select="//get_region_data">
										<xsl:if test="$current_id=//get_region_data/location_address_id">
											<xsl:attribute name="checked">true</xsl:attribute>
										</xsl:if>
									</xsl:for-each>
								</input>
							</td>
                            <td><font class="two"><xsl:value-of select="name"/></font></td></tr>
                        </xsl:for-each>
                    </table>
                </td>
			</tr>
			<tr>
				<td bgcolor="white" colspan="2" align="center"><br />
					<table cellpadding="5">
						<tr>
							<td><input type="submit" value="Update" name="submit" /></td>
							<td><INPUT TYPE="BUTTON" VALUE="Cancel"  ONCLICK="window.location.href='/acc/link/rgn/'"/></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>		
	</td></tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
