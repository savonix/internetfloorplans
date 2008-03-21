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
	<form method="post" action="/acc/link/loc/view/hours/&amp;location_address_id={//_get/location_address_id}">
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<xsl:call-template name="location_menu" />
		</tr>
	</table>
	<table border="0" cellspacing="1" cellpadding="2"  >
	<xsl:call-template name="location_summary" />
	<tr>
		<td colspan="4" >
		Hours of Operation:
				<br/>
			<table border='0' cellspacing='0' cellpadding='10'  >
			<tr>
				<td align="left"  valign="top">
					Open: 
					<select name="open_h">
					<xsl:for-each select="//hours">
						<option value="{hour}"><xsl:value-of select="hour"/></option>
					</xsl:for-each>
					</select>
					:
					<select name="open_m">
					<xsl:for-each select="//minutes">
						<option value="{minute}"><xsl:value-of select="minute"/></option>
					</xsl:for-each>
					</select>
					<select name="open_am_pm">
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left"  valign="top">
					Close: 
					<select name="close_h">
					<xsl:for-each select="//hours">
						<option value="{hour}"><xsl:value-of select="hour"/></option>
					</xsl:for-each>
					</select>
					:
					<select name="close_m">
					<xsl:for-each select="//minutes">
						<option value="{minute}"><xsl:value-of select="minute"/></option>
					</xsl:for-each>
					</select>
					<select name="close_am_pm">
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
				</td>
			</tr>
			</table>
			<input type="hidden" name="location_address_id" value="{//_get/location_address_id}"/>
			<input type="hidden" name="day_id" value="{//_get/day_id}"/>
			<input type="submit" value="Submit"/>
		</td>
	</tr>
	
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
