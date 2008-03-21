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
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
		</tr>
	</table>
	<table border="0" cellspacing="1" cellpadding="2" width="100%" bgcolor="#AAAAAA">
	<tr><td colspan="4" bgcolor="#FFFFFF">	
			
			<table border='0' cellspacing='0' cellpadding='10' bgcolor="#CCCCCC">
			<tr>
				<td align="left" bgcolor="#FFFFFF" valign="top" colspan="2">
					<font class="four">Email Locations</font>
				</td>
			</tr>
			<tr>
				<td align="left" bgcolor="#FFFFFF" valign="top">
					Subject: 
				</td>
				
				<td align="left" bgcolor="#FFFFFF" valign="top">
					<input type="text" name="subject"/>
				</td>
			</tr>
			<tr>
				<td align="left" bgcolor="#FFFFFF" valign="top">
					Body:
				</td>
				
				<td align="left" bgcolor="#FFFFFF" valign="top">
					<textarea name="body" rows="8" cols="40">Enter your message here.</textarea>
				</td>
			</tr>
			<tr>
				<td bgcolor="white" colspan="2" align="center"><input type="submit" name="submit" value="Submit"/>
				<input type="button" value="Cancel" onclick="window.location.href='/acc/link/loc/'"/>
				</td>
			</tr>
			</table>
	</td></tr></table>
</xsl:template>
</xsl:stylesheet>