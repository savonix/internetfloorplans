<!--
Program: Internet Floor Plans
Component: equipment_type_summary.xsl
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
<xsl:template name="equipment-type-summary">
<xsl:for-each select="//get_equipment_type_by_id">
	<tr>
		<td>
		<xsl:value-of select="//labels/label[key='options']/value"/>:<br />
		<a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}"><xsl:value-of select="//labels/label[key='edit_this_equipment_type']/value"/></a>
        <br/>
		<a href="{//link_prefix}ifp-equipment-type-delete&amp;equipment_type_id={equipment_type_id}" onclick="return confirm('Are you sure you want to delete this equipment type?')"><xsl:value-of select="//labels/label[key='delete_this_equipment_type']/value"/></a>
		</td>
		<td>
		<xsl:value-of select="//labels/label[key='name']/value"/>:<br/>
		<xsl:value-of select="//get_asset_type_by_id/name" />
		</td>
		<td colspan="2">
		<xsl:value-of select="//labels/label[key='description']/value"/>: <br/>
		<xsl:value-of select="//get_equipment_type_by_id/description" />
		</td>
	</tr>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
