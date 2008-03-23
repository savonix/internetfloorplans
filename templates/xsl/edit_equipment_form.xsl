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
				<img src="/resources/img/tetris.png" /> 
			</td>
			
		</tr>
	</table>
	<table><tr><td valign="top">
	<table >
		<tr>
			<td >Asset Type:</td>
			<xsl:if test="//_get/equipment_id">
			<td >
				<xsl:for-each select="//get_asset_types">
					<xsl:if test="equipment_type_id=//get_asset_by_id/equipment_type_id">
						<xsl:value-of select="name"/>
					</xsl:if>
				</xsl:for-each>
			</td>
			</xsl:if>
		</tr>
		<tr>
			<td >Location:</td>
			
			<td >
				<a href="/acc/link/loc/view/sp/&amp;location_address_id={//get_location_summary/location_address_id}"><xsl:value-of select="//get_location_summary/name"/></a>
			</td>
		</tr>
		<form action="/acc/link/assets/edit/&amp;equipment_id={//_get/equipment_id}&amp;location_address_id={//_get/location_address_id}" method="post">
		<input type="hidden" name="equipment_id" value="{//_get/equipment_id}"/>
		<input type="hidden" name="type" value="edit"/>
		<xsl:for-each select="//get_container_by_type_id">
		<xsl:variable name="my_container_id"><xsl:value-of select="equipment_type_container_id"/></xsl:variable>
		
		<xsl:variable name="my_priority_id"><xsl:value-of select="//get_container_by_id[equipment_type_container_id=$my_container_id]/priority_id"/></xsl:variable>
		
		<xsl:variable name="my_business_line_id"><xsl:value-of select="//get_container_by_id[equipment_type_container_id=$my_container_id]/business_line_id"/></xsl:variable>
		<tr>
			<td ><input type="checkbox" name="equipment_type_container_id[]" value="{equipment_type_container_id}"><xsl:if test="count(//get_container_by_type_id)=1"><xsl:attribute name="checked"/></xsl:if></input>Container:</td>
			<td ><xsl:value-of select="name"/><xsl:value-of select="equipment_id"/> - <xsl:value-of select="//get_priorities[priority_id=$my_priority_id]/name"/>, <xsl:value-of select="//get_lob[line_of_business_id=$my_business_line_id]/name"/> 
			</td>
		</tr>
		<!--
		<form action="/acc/link/assets/edit/&amp;equipment_id={//_get/equipment_id}" method="post">
		<input type="hidden" name="equipment_id" value="{//_get/equipment_id}"/>
		<input type="hidden" name="equipment_type_container_id" value="{equipment_type_container_id}"/>
		<input type="hidden" name="type" value="edit"/>
		<tr><td colspan="2"><table ><tr><td>
		<table >
		<tr>
			<td ><input type="checkbox" name="equipment_type_container_id" value="{equipment_type_container_id}"/>Container:</td>
			<td ><xsl:value-of select="name"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<table >

		<tr>
			<td >Priority:</td>
			<td >
			<select name="priority_id">
			<xsl:for-each select="//get_priorities">
				<option value="{priority_id}"><xsl:if test="priority_id=//get_container_by_id[equipment_type_container_id=$my_equipment_type_container_id]/priority_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			
			
			</td>

		</tr>
		<tr>
			<td >Business:</td>
			<td >
			<select name="lob_id">
			<xsl:for-each select="//get_lob">
				<option value="{line_of_business_id}"><xsl:if test="line_of_business_id=//get_container_by_id[equipment_type_container_id=$my_equipment_type_container_id]/business_line_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			<input type="submit" value="Go" name="submit" />
			</td>

		</tr>
		
		</table>
		</td>
		</tr>
		</table>
		</td></tr>
		</table></td></tr>
		</form>-->
		</xsl:for-each>
		<tr>
			<td >Option:</td>
			<td >
			<select name="priority_id">
			<xsl:for-each select="//get_priorities">
				<option value="{priority_id}">
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			
			
			</td>

		</tr>
		<tr>
			<td >Business:</td>
			<td >
			<select name="lob_id">
			<xsl:for-each select="//get_lob">
				<option value="{line_of_business_id}">
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			<input type="submit" value="Go" name="submit" />
			</td>

		</tr>
		</form>
	</table>
	</td>
	<td valign="top">
	<table>
		<tr>
					<td rowspan="6">
				<xsl:if test="//_get/equipment_id">
				<img ><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_asset_by_id/image_pointer"/>&amp;type=merchandising</xsl:attribute></img>
				</xsl:if>
			</td>
		</tr>
		</table>
	</td></tr></table>
</xsl:template>
</xsl:stylesheet>
