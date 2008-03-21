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
	<form enctype="multipart/form-data" action="/acc/link/loc/view/add/submit/" method="post">
	<input type="hidden" name="dest"><xsl:attribute name="value">../usr/<xsl:value-of select="//user_account_id"/>/photography/</xsl:attribute></input>
	<input type="hidden" name="location_address_id" value="{//_get/location_address_id}"/>
	
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<xsl:call-template name="location_menu" />
		</tr>
	</table>
	<xsl:if test="//get_all_locations/location_address_id=//_get/location_address_id">
	<table border="0" cellspacing="1" cellpadding="2" width="100%" >
	<xsl:call-template name="location_summary" />
	<tr>
		<td colspan="4" >
		<table border="0" cellpadding="10" cellspacing="1"  width="600">
			<tr>	
				<td bgcolor="white" colspan="2"><font class='two'>
					You can upload an image formatted as a GIF, JPEG, PNG, or MOV. If you are uploading a MOV or a GIF file, please make sure that the file is properly formatted to fit on your display. If you are uploading a JPEG or a PNG file, 
					the file will be formatted automatically for you. </font></td>
			</tr>
			<tr>	
				<td bgcolor="white"><font class='two'>Image name:</font></td>
				<td bgcolor="white"><input type='text' name='name' size="25" ><xsl:attribute name="value"><xsl:value-of select="//_post/name"/></xsl:attribute></input></td>
			</tr>
			<tr>	
				<td bgcolor="white"><font class='two'>Image file:</font></td>
				<td bgcolor="white"><input type='file' name='file' size="25" /></td>
			</tr>
			<tr>
				<td bgcolor="white"><font class='two'>Comments:</font></td>
				<td bgcolor="white"><textarea cols="35" rows="5" name="comments"><xsl:value-of select="//_post/comments"/></textarea></td>
			</tr>
			<tr>
				<td bgcolor="white"><font class='two'>Default image:</font></td>
				<td bgcolor="white"><input type="checkbox" name="default" value="1"><xsl:if test="//_post/default"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></td>
			</tr>
			<tr>
				<td bgcolor="white" colspan="2" align="center"><br />
					<table cellpadding="5">
						<tr>
							<td><input type="submit" value="Upload" name="submit" /></td>
							<td><INPUT TYPE="BUTTON" VALUE="Cancel"  ONCLICK="window.location.href='/acc/link/'"/></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>		
	</td></tr>
	</table>
	</xsl:if>
	</form>
</xsl:template>
</xsl:stylesheet>
