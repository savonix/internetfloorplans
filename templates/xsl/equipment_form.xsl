<!--
Program: Internet Floor Plans
Component: equipment_form.xsl
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
	<form method="post">
	<input type="hidden" value="1" name="quantity"/>
	<xsl:if test="//_get/equipment_id">
		<input type="hidden" name="location_id" value="{//_get/location_id}"/>
		<input type="hidden" name="asset_type_id" value="{//get_asset_by_id/equipment_type_id}"/>
		<input type="hidden" name="asset_id" value="{//get_asset_by_id/asset_id}"/>
		<input type="hidden" name="equipment_id" value="{//_get/equipment_id}"/>
		<input type="hidden" name="type" value="edit"/>
	</xsl:if>
	<xsl:if test="not(//_get/equipment_id)">
		<input type="hidden" name="type" value="new"/>
	</xsl:if>
	<table>
		<tr>
			<td >Asset ID:</td>
			<xsl:if test="//_get/equipment_id">
			<td ><xsl:value-of select="//get_asset_by_id/asset_id"/></td>
			</xsl:if>
			<xsl:if test="not(//_get/equipment_id)">
			<td ><input type="text" name="asset_id"><xsl:attribute name="value"><xsl:value-of select="//get_asset_by_id/asset_id"/></xsl:attribute></input></td>
			</xsl:if>
		
			<td rowspan="6">
				<xsl:if test="//_get/equipment_id">
				<img ><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;type=merchandising</xsl:attribute></img>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td >Asset Type:</td>
			<xsl:if test="//_get/equipment_id">
			<td >
				<xsl:for-each select="//equipment_types_get_all">
					<xsl:if test="equipment_type_id=//get_asset_by_id/equipment_type_id">
						<xsl:value-of select="name"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			</xsl:if>
			<xsl:if test="not(//_get/equipment_id)">
			<td ><select name="equipment_type_id">
				<xsl:for-each select="//equipment_types_get_all">
					<option value="{equipment_type_id}"><xsl:if test="equipment_type_id=//get_asset_by_id/equipment_type_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
				</xsl:for-each>
			</select></td>
			</xsl:if>
		</tr>
		<tr>
			<td >Location:</td>
			
			<xsl:if test="//_get/equipment_id">
			<td >
				<xsl:for-each select="//locations_get_all">
					<xsl:if test="location_id=//get_asset_by_id/location_address_id">
						<xsl:value-of select="name"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			</xsl:if>			
			<xsl:if test="not(//_get/equipment_id)">
			<td ><select name="location_id">
				<xsl:for-each select="//locations_get_all">
					<option value="{location_id}"><xsl:if test="location_address_id=//get_asset_by_id/location_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
				</xsl:for-each>
			</select></td>
			</xsl:if>
		</tr>
		<xsl:for-each select="//get_container_by_type_id">
		<tr>
			<td >Container:</td>
			<td ><xsl:value-of select="name"/></td>
		</tr>
		</xsl:for-each>
		<tr>
			<td >Priority Rating:</td>
			<td >
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
			<td >Line of Business:</td>
			<td >
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
			<td colspan="2" align="center"><br />
				<table>
					<tr>
						<td><input type="submit" value="Submit" name="submit" /></td>
						<td><input type="button" value="Cancel" onclick="window.location.href={//link_prefix}ifp-equipment'"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
