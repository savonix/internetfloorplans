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
<xsl:template name="asset_type_summary" match="//get_location_summary">
<xsl:for-each select="//get_asset_type_by_id">
	<tr>
		<xsl:if test="//_registry/user/roles='uplink_regional_manager'">
		<td width="25%"  valign="top">
		
		<b>Options:</b><br />
		[ <a target="_top" href="/acc/link/types/edit/&amp;equipment_type_id={equipment_type_id}">Edit This Equipment Type</a> ] <br/>
		[ <a target="_top" href="/acc/link/types/delete/&amp;equipment_type_id={equipment_type_id}" onclick="return confirm('Are you sure you want to delete this equipment type?')">Delete This Equipment Type</a> ]
		
		</td>
		</xsl:if>
		
		
		<td width="25%" valign="top">
		
		<b>Name:</b><br/>
		<xsl:value-of select="//get_asset_type_by_id/name" />
		</td>

		<td width="25%" valign="top" colspan="2">
		
		<b>Description:</b> <br/>
		<xsl:value-of select="//get_asset_type_by_id/description" />
		
		</td>



	</tr>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
