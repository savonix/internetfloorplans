<!--
Program: Internet Floor Plans
Component: equipment_container_codes.xsl
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
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:template name="content">
    <xsl:call-template name="equipment_type_menu" />
	<xsl:call-template name="asset_type_summary" />
	<table class="simpletable">
		<tr>
			<th>
				Equipment Type
            </th>
			<th>
				Container
            </th>
			<th>
				Business
            </th>
			<th>
				Options
            </th>
			<th> </th>
		</tr>
		<xsl:for-each select="//get_container_by_type_id">
		<xsl:variable name="my_lob_id"><xsl:value-of select="default_business_line_id"/></xsl:variable>
		<xsl:variable name="my_priority_id"> <xsl:value-of select="default_priority_id"/></xsl:variable>
		<tr class="row{position() mod 2}">
			<form action="/acc/link/types/containers/code/&amp;equipment_type_id={//_get/equipment_type_id}" method="post">	
				<input type="hidden" name="equipment_type_container_id" value="{equipment_type_container_id}"/>
				<td>
					<xsl:value-of select="//equipment_type_name"/></td>
				<td>
					<xsl:value-of select="name"/></td>
				<td>
						<select name="business_line_id">
						<xsl:for-each select="//get_lob">
						<option value="{line_of_business_id}"><xsl:if test="$my_lob_id=line_of_business_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
						</xsl:for-each></select></td>
				<td>
						<select name="priority_id">
						<xsl:for-each select="//get_priorities">
						<option value="{priority_id}"><xsl:if test="$my_priority_id=priority_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
						<xsl:value-of select="name"/></option>
						</xsl:for-each></select>
				</td>
				<td>
				<input type="submit" value="Go" name="submit" />
				</td>
			</form>
		</tr>
		</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>