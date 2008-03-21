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
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<xsl:call-template name="location_menu" />
		</tr>
	</table>
	<xsl:if test="//get_all_locations/location_address_id=//_get/location_address_id">
	<table border="0" cellspacing="1" cellpadding="2"  >
	<xsl:call-template name="location_summary" />
	<tr><td colspan="4" >
			<table border='0' cellspacing='0' cellpadding='10' >
			<tr>
				<td align="left"  valign="top">
					<font color="red">Do not make hand made signage!
					<br/><br/>
					Click <a href="#">here</a> if you would like to order custom signage. 
				</td>
				<td align="left"  valign="top">
					<img src="/resources/img/handmade.jpg"/>
				</td>
			</tr>
			</table>
	</td></tr></table></xsl:if>
</xsl:template>
</xsl:stylesheet>
