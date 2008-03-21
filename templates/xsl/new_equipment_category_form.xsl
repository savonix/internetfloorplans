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
	<xsl:if test="//_get/equipment_category_id">
		<input type="hidden" name="equipment_category_id"><xsl:attribute name="value"><xsl:value-of select="//_get/equipment_category_id"/></xsl:attribute></input>
	</xsl:if>
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			
		</tr>
	</table>
	<font class="three">
	<table border='0' cellspacing='1' cellpadding='0' bgcolor="#BBBBBB" width='100%'>
	<tr><td width="100%" bgcolor="#FFFFFF">
		<table border="0" cellpadding="4" cellspacing="1" bgcolor="#DDDDDD" width="600">
			<tr>	
				<td width="150" bgcolor="white"><font class='two'>Asset Type Name:</font></td>
				<td bgcolor="white"><input type='text' name='name'><xsl:attribute name="value"><xsl:value-of select="//get_asset_category_by_id/name"/></xsl:attribute></input></td>
			</tr>
			<tr>	
				<td width="150" bgcolor="white"><font class='two'>Description:</font></td>
				<td bgcolor="white"><textarea name='description' cols="25" rows="5"><xsl:value-of select="//get_asset_category_by_id/description"/></textarea></td>
			</tr>
			<tr>
				<td bgcolor="white" colspan="2" align="center"><br />
					<table cellpadding="5">
						<tr>
							<td><input type="submit" value="Submit" name="submit" /></td>
							<td><INPUT TYPE="BUTTON" VALUE="Cancel"  ONCLICK="window.location.href='/acc/link/types/'"/></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>		
	</td></tr>
	</table>
	</font>
	</form>

</xsl:template>
</xsl:stylesheet>
