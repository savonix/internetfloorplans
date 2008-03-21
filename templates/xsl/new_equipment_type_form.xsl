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
	<xsl:if test="//_get/equipment_type_id">
		<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
	</xsl:if>
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			
		</tr>
	</table>
	
	<table border='0' cellspacing='1' cellpadding=''  width='100%'>
	<tr><td  >
		<table border="0" cellpadding="4" cellspacing="1"  width="600">
			<tr>	
				<td width="150"><font class='two'>Asset Type Name:</td>
				<td><input type='text' name='name'><xsl:attribute name="value"><xsl:value-of select="//get_asset_type_by_id/name"/></xsl:attribute></input></td>
			</tr>
			<!--
			<tr>	
				<td width="150" valign="top"><font class='two'>Category:</td>
				<td>
					<select name="asset_category_type_id">
						<xsl:for-each select="//get_asset_categories" >
							<option value="{equipment_category_id}"><xsl:value-of select="name"/></option>
						</xsl:for-each>
					</select>
				</td>
			</tr>
			-->
			<tr>	
				<td width="150" valign="top"><font class='two'>Description:</td>
				<td><textarea name='description' cols="25" rows="5"><xsl:value-of select="//get_asset_type_by_id/description"/></textarea></td>
			</tr>
			<!--
			<tr>	
				<td width="150" valign="top"><font class='two'>Image:</td>
				<td><input type="file" name="file"/></td>
			</tr>
			<tr>	
				<td width="150" valign="top"><font class='two'>Template:</td>
				<td><textarea name='template' cols="25" rows="5"></textarea></td>
			</tr>
			-->
			<tr>
				<td colspan="2" align="center"><br />
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
	
	</form>
</xsl:template>
</xsl:stylesheet>
