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
<xsl:template name="location_summary" match="//get_location_summary">
<xsl:for-each select="//get_location_summary">
	<tr>
		<xsl:if test="//user_roles='uplink_regional_manager'">
		<td width="25%"  valign="top">
		
		<b>Location Options</b>
		[ <a target="_top" href="/acc/link/loc/edit/&amp;location_address_id={location_address_id}">Edit</a> ]
		[ <a target="_top" href="/acc/link/loc/del/&amp;location_address_id={location_address_id}" onclick="return confirm('Are you sure you want to delete this location?')">Delete</a> ]
		
		</td>
		</xsl:if>
		
		<td width="25%" valign="top">
		
		<xsl:value-of select="//get_location_summary/address_line_1" /><br />
		<xsl:value-of select="//get_location_summary/city" />&#160; <xsl:value-of select="//get_location_summary/state" />, 
		<xsl:value-of select="//get_location_summary/zip" />
		</td>

		<td width="25%" valign="top">
		
		Tel: <xsl:value-of select="//get_location_summary/phone" /><br />
		Fax: <xsl:value-of select="//get_location_summary/fax" />
		
		</td>

		<td valign="top">
		</td>
	</tr>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
