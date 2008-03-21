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
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:template name="content">
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			<xsl:call-template name="equipment_type_menu" />
		</tr>
	</table>
	
	<table border='0' cellspacing='1' cellpadding='2'  width='100%'>
	<xsl:call-template name="asset_type_summary" />
	<tr>
		<td colspan="4" >

		
	<table border='0' cellspacing='0' cellpadding='2' width='100%'>
		<tr>

			<td width="100">
				<b>Equipment Type</b></td>
			<td width="100">
				<b>Container</b></td>
			<td width="50">
				<b>Business</b></td>
			<td width="50">
				<b>Options</b></td>
			<td> </td>
		</tr>
		
		<xsl:for-each select="//get_container_by_type_id">
		<xsl:variable name="my_lob_id"><xsl:value-of select="default_business_line_id"/></xsl:variable>
		<xsl:variable name="my_priority_id"> <xsl:value-of select="default_priority_id"/></xsl:variable>
		<tr class="row{position() mod 2}">
			<form action="/acc/link/types/containers/code/&amp;equipment_type_id={//_get/equipment_type_id}" method="post">	
				<input type="hidden" name="equipment_type_container_id" value="{equipment_type_container_id}"/>
				<td width="100">
					<xsl:value-of select="//equipment_type_name"/></td>
				<td width="100">
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
	
	
		</td>
	</tr>
	</table>
	
</xsl:template>
</xsl:stylesheet>
