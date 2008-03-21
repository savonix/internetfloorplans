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
	<form action="/acc/link/assets/edit/submit/" method="post">
	<input type="hidden" value="1" name="quantity"/>
	<xsl:if test="//_get/equipment_id">
		<input type="hidden" name="asset_type_id" value="{//get_asset_by_id/equipment_type_id}"/>
		<input type="hidden" name="asset_id" value="{//get_asset_by_id/asset_id}"/>
		<input type="hidden" name="equipment_id" value="{//_get/equipment_id}"/>
		<input type="hidden" name="type" value="edit"/>
	</xsl:if>
	<xsl:if test="not(//_get/equipment_id)">
		<input type="hidden" name="type" value="new"/>
	</xsl:if>
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			
		</tr>
	</table>
	<table border="0" cellpadding="4" cellspacing="1" bgcolor="#DDDDDD" width="600">
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Asset ID:</font></td>
			<xsl:if test="//_get/equipment_id">
			<td bgcolor="#FFFFFF"><xsl:value-of select="//get_asset_by_id/asset_id"/></td>
			</xsl:if>
			<xsl:if test="not(//_get/equipment_id)">
			<td bgcolor="#FFFFFF"><input type="text" name="asset_id"><xsl:attribute name="value"><xsl:value-of select="//get_asset_by_id/asset_id"/></xsl:attribute></input></td>
			</xsl:if>
		
			<td rowspan="6" bgcolor="white" width="120">
				<xsl:if test="//_get/equipment_id">
				<img border="0" ><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;type=merchandising</xsl:attribute></img>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Asset Type:</font></td>
			<xsl:if test="//_get/equipment_id">
			<td bgcolor="#FFFFFF">
				<xsl:for-each select="//get_asset_types">
					<xsl:if test="equipment_type_id=//get_asset_by_id/equipment_type_id">
						<xsl:value-of select="name"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			</xsl:if>
			<xsl:if test="not(//_get/equipment_id)">
			<td bgcolor="#FFFFFF"><select name="equipment_type_id">
				<xsl:for-each select="//get_asset_types">
					<option value="{equipment_type_id}"><xsl:if test="equipment_type_id=//get_asset_by_id/equipment_type_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
				</xsl:for-each>
			</select></td>
			</xsl:if>
		</tr>
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Location:</font></td>
			
			<xsl:if test="//_get/equipment_id">
			<td bgcolor="#FFFFFF">
				<xsl:for-each select="//get_all_locations">
					<xsl:if test="location_address_id=//get_asset_by_id/location_address_id">
						<xsl:value-of select="name"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			</xsl:if>			
			<xsl:if test="not(//_get/equipment_id)">
			<td bgcolor="#FFFFFF"><select name="location_address_id">
				<xsl:for-each select="//get_all_locations">
					<option value="{location_address_id}"><xsl:if test="location_address_id=//get_asset_by_id/location_address_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
				</xsl:for-each>
			</select></td>
			</xsl:if>
		</tr>
		<!-- Wait for Upsell
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Quantity:</font></td>
			<td bgcolor="#FFFFFF"><input type="text" size="5"/></td>
		</tr>-->
		<xsl:for-each select="//get_container_by_type_id">
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Container:</font></td>
			<td bgcolor="#FFFFFF"><xsl:value-of select="name"/></td>
		</tr>
		</xsl:for-each>
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Priority Rating:</font></td>
			<td bgcolor="#FFFFFF">
			<select name="priority_id">
			<xsl:for-each select="//get_priorities">
				<option value="{priority_id}"><xsl:if test="priority_id=//get_asset_by_id/priority_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			
			
			</td>

		</tr>
		<tr>
			<td bgcolor="#FFFFFF"><font class="two">Line of Business:</font></td>
			<td bgcolor="#FFFFFF">
			<select name="lob_id">
			<xsl:for-each select="//get_lob">
				<option value="{line_of_business_id}"><xsl:if test="line_of_business_id=//get_asset_by_id/business_line_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			
			</td>

		</tr>
		
		<tr>
			<td bgcolor="white" colspan="2" align="center"><br />
				<table cellpadding="5">
					<tr>
						<td><input type="submit" value="Submit" name="submit" /></td>
						<td><INPUT TYPE="BUTTON" VALUE="Cancel"  ONCLICK="window.location.href='/acc/link/assets/'"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
