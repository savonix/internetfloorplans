<!--
Program: Internet Floor Plans
Component: location_form.xsl
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
<xsl:template name="content">
	<form method="post">
	<input type="hidden" name="location_address_id" value="{//_get/location_address_id}"/>
		<xsl:call-template name="form"/>
	</form>
    
	<xsl:if test="contains(//nid,'acc/link/loc/new/')">
	<form action="/acc/link/loc/new/submit/" method="post">
		<xsl:call-template name="form"/>
	</form>
	</xsl:if>
</xsl:template>


<xsl:template name="form">
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
		</tr>
	</table>
	<table border='0' cellspacing='1' cellpadding='0'  width="100%">
	<tr><td width="100%">
		<table border="0" cellpadding="4" cellspacing="1"  width="600">
<xsl:if test="//_post/submit">
<tr>	
	<td width="150" bgcolor="white" colspan="2"><font class='two'><font color="red">
	The data you have submitted is not valid, the field titles with an asterisk are required. The form 
	has been reverted to its original data.
	</font></font></td>
</tr>
</xsl:if>
<tr>	
	<td width="150" bgcolor="white"><font class='two'>Name:*</font></td>
	<td bgcolor="white"><input type='text' name='location_name' value="{//get_location_summary/name|//_post/location_name}" /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>Address Line 1:*</font></td>
	<td bgcolor="white"><input type='text' name='address_line_1' size="40" value="{//get_location_summary/address_line_1|//_post/address_line_1}" /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>Address Line 2:</font></td>
	<td bgcolor="white"><input type='text' name='address_line_2' size="40"  value="{//get_location_summary/address_line_2|//_post/address_line_2}" /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>City:*</font></td>
	<td bgcolor="white"><input type='text' name='city' size="20"  value="{//get_location_summary/city|//_post/city}" /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>State:*</font></td>
	<td bgcolor="white"><input type='text' name='state' size="5" value="{//get_location_summary/state|//_post/state}"  /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>Zip:*</font></td>
	<td bgcolor="white"><input type='text' name='zip' size="10" value="{//get_location_summary/zip|//_post/zip}"  /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>Phone:</font></td>
	<td bgcolor="white"><input type='text' name='phone'  value="{//get_location_summary/phone|//_post/phone}" /></td>
</tr>
<tr>
	<td bgcolor="white"><font class='two'>Fax:</font></td>
	<td bgcolor="white"><input type='text' name='fax'  value="{//get_location_summary/fax|//_post/fax}" /></td>
</tr>
<tr>
	<td bgcolor="white" valign="top"><font class='two'>Regions:</font></td>
	<td bgcolor="white">
	<xsl:for-each select="//get_all_regions">
		<input type="checkbox" name="regions[]" value="{region_id}"><xsl:if test="region_id=//get_location_regions/region_id"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input>
		<font class="two"><xsl:value-of select="region_name" /></font>
		<br/>
	</xsl:for-each>
	</td>
</tr>	
<tr>
				<td bgcolor="white" colspan="2" align="center"><br />
			<table cellpadding="5"><tr><td><input type="submit" value="Submit" name="submit" /></td><td>
			<INPUT TYPE="BUTTON" VALUE="Cancel"  ONCLICK="window.location.href='/acc/link/loc/'"/></td></tr></table></td></tr></table>		
	</td></tr>
	</table>
</xsl:template>
</xsl:stylesheet>
