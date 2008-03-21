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
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>

<xsl:template name="content">
	<form action="/acc/link/my_loc/install/submit/" method="post">
	<input type="hidden" name="equipment_id" value="{//_post/equipment_id}"/>
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			
		</tr>
	</table>
	<table width="600">
		<tr>
			<td valign="top">
			Please select the appropriate response based upon the results of these campaign instructions: 
			<br/><br/>
			<table >
				<tr>
					<td valign="top">
						<input type="radio" name="response" value="success" checked="checked"/>
					</td>
					<td>The materials have been successfully installed. <b>Please select this option only if you have already installed the materials as prescribed by these instructions.</b></td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="response" value="never"/>
					</td>
					<td>Never received the materials.</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="response" value="replace"/>
					</td>
					<td>Received materials but need replacements.</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="response" value="impossible"/>
					</td>
					<td>The fixture is not there.</td>
				</tr>
			</table>
				
			</td>
			<td>
				<iframe name="config" id="config" width="275" height="525"><xsl:attribute name="src">/acc/link/types/display_config/&amp;location_equipment_id=<xsl:value-of select="//_post/location_equipment_id"/>&amp;equipment_id=<xsl:value-of select="//_post/equipment_id"/>&amp;asset_id=<xsl:value-of select="//_post/asset_id"/>&amp;equipment_type_id=<xsl:value-of select="//_post/equipment_type_id"/>&amp;equipment_type_image_id=<xsl:value-of select="//_post/equipment_type_image_id"/></xsl:attribute> 
				
				&#160;
				</iframe>
			</td>

		</tr>

		
		<tr>
			<td colspan="2" align="center"><br />
				<table>
					<tr>
						<td><input type="submit" value="Submit" name="submit" /></td>
						<td><INPUT TYPE="BUTTON" VALUE="Cancel" ONCLICK="window.location.href='/acc/link/my_loc/'"/></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
