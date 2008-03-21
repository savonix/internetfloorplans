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
<xsl:template name="equipment_menu">
<td align="left">
	<table cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
		<tr>
			<td bgcolor="#FFFFFF" class="mini-menu-selected"><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/assets/</xsl:text></xsl:attribute>List</a></td>
			
			<td bgcolor="#FFFFFF" class="mini-menu-selected"><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/assets/q/</xsl:text></xsl:attribute>Quantities</a></td>
			
			

		</tr>
	</table>
</td>
</xsl:template>
</xsl:stylesheet>