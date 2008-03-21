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
<xsl:template name="location_menu" match="//get_location_summary">
<td align="left">
	<!-- Regional Manager -->
	<table>
		<tr>
			<td><b><font color="#FFFFFF"><xsl:value-of select="//get_location_summary/name" /></b></td>	
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/sp/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/sp/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/sp/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Space Plans</a></td>
			
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Virtual Tours</a></td>
			
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/eqp/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/eqp/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/eqp/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Equipment Quantities</a></td>			
			
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/eqp/list/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/eqp/list/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/eqp/list/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Equipment List</a></td>
			<!--
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/hr/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/hr/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/hr/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Personnel</a></td>	
			
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/loc/view/hours/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/loc/view/hours/'">mini-menu</xsl:if></xsl:attribute><a>
			<xsl:attribute name="href"><xsl:text>/acc/link/loc/view/hours/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Hours</a></td>-->
			
		</tr>
	</table>
	
	<xsl:if  test="//user_roles='uplink_local_manager'">
	<!-- Local Manager -->
	<table cellpadding="2" cellspacing="1" >
		<tr>
		
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/my_loc/view/sp/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/my_loc/view/sp/'">mini-menu</xsl:if></xsl:attribute><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/my_loc/view/sp/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Space Plans</a></td>
		
			<td ><xsl:attribute name="class"><xsl:if test="//_get/nid='acc/link/my_loc/guidelines/'">mini-menu-selected</xsl:if><xsl:if test="//_get/nid!='acc/link/my_loc/guidelines/'">mini-menu</xsl:if></xsl:attribute><a class="mini-menu-selected">
			<xsl:attribute name="href"><xsl:text>/acc/link/my_loc/guidelines/&amp;location_address_id=</xsl:text><xsl:value-of select="//location_address_id" /></xsl:attribute>Guidelines</a></td>
			
		</tr>
	</table>
	</xsl:if>
</td>
</xsl:template>
</xsl:stylesheet>
