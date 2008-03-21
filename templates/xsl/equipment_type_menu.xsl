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
<xsl:template name="equipment_type_menu" match="//get_location_summary">
<td align="left">
	<table >
		<tr>
			<td class="mini-menu-selected"><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/types/view/&amp;equipment_type_id=</xsl:text><xsl:value-of select="//equipment_type_id" /></xsl:attribute>Images</a></td>
			
			<td class="mini-menu-selected"><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/types/view/sp/&amp;equipment_type_id=</xsl:text><xsl:value-of select="//equipment_type_id" /></xsl:attribute>Icons</a></td>
			
			
			<!--
			THIS IS NOT THE RIGHT WAY TO DO THIS! IT SHOULD BE CONTROLLED VIA INTERFACE AND DB
			<xsl:if test="//get_asset_type_by_id/equipment_category_id=7">-->
				<td class="mini-menu-selected"><a class="mini-menu-selected">
				<xsl:attribute name="href"><xsl:text>/acc/link/types/containers/&amp;equipment_type_id=</xsl:text><xsl:value-of select="//equipment_type_id" /></xsl:attribute>Containers</a></td>
				
				<td class="mini-menu-selected"><a class="mini-menu-selected">
				<xsl:attribute name="href"><xsl:text>/acc/link/types/containers/code/&amp;equipment_type_id=</xsl:text><xsl:value-of select="//equipment_type_id" /></xsl:attribute>Container Coding</a></td>
			<!-- </xsl:if> -->
		</tr>
	</table>
</td>
</xsl:template>
</xsl:stylesheet>
