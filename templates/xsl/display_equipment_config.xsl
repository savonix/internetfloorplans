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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<xsl:if test="//equipment_type_image_id">
	<xsl:if test="//user_roles='uplink_regional_manager'">
	[ <a href="/acc/link/assets/edit/&amp;equipment_id={//equipment_id}&amp;location_address_id={//location_address_id}" target="_parent">Edit</a> ] [<a target="_parent" href="/acc/link/loc/view/sp/&amp;location_address_id={//location_address_id}&amp;equipment_id={//equipment_id}&amp;delete=true" onclick="return confirm('Are you sure you want to delete this asset?')">Delete</a> ]

	
	
	<!--
	
	<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
	<tr><td>
Equipment Type Image ID: <xsl:value-of select="//equipment_type_image_id"/></td>
</tr>
<tr><td>Equipment ID: <xsl:value-of select="//equipment_id"/></td></tr>
<tr><td>Asset ID: <xsl:value-of select="//asset_id"/></td></tr>
<tr><td>Location Equipment ID: <xsl:value-of select="//location_equipment_id"/></td></tr>
<tr><td><a href="https://dev.savonix.com/acc/link/assets/delete2/&amp;equipment_id={//equipment_id}">Delete this fixture?</a></td></tr></table>

<br/>-->

<table cellpadding="0" cellspacing="0" border="0">
	<form action="/acc/link/assets/edit/submit2/" method="post">
	<xsl:if test="//_post/equipment_id">
		<input type="hidden" name="equipment_id" value="{//equipment_id}"/>
		<input type="hidden" name="asset_type_id" value="{//equipment_type_id}"/>
		<input type="hidden" name="asset_id" value="{//asset_id}"/>
		<input type="hidden" name="type" value="edit"/>
	</xsl:if>
	
<tr><td><b><xsl:value-of select="//equipment_type_name"/></b></td></tr>
	<xsl:if test="//get_lob">
	   <tr>
			<td ><font class="two">Line of Business:</font>
			<br/>
			<select name="lob_id">
			<xsl:for-each select="//get_lob">
				<option value="{line_of_business_id}"><xsl:if test="line_of_business_id=//get_asset_by_id/business_line_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			
			</td>

		</tr>
	</xsl:if>
	<xsl:if test="//get_priorities">
		<tr>
			<td ><font class="two">Priority Rating:</font>
			<br/>
			<select name="priority_id">
			<xsl:for-each select="//get_priorities">
				<option value="{priority_id}"><xsl:if test="priority_id=//get_asset_by_id/priority_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
					<xsl:value-of select="name"/>
				</option>
			</xsl:for-each>
			</select>
			<input type="submit" name="submit" value="Submit"/>
			
			</td>

		</tr>
		</xsl:if>
		</form>
		</table>
		</xsl:if>


<!-- FLASH -->
<script type="text/javascript" src="/resources/js/swfobject.js"></script>
<div id="equipment_config">


</div>
							
<script type="text/javascript">
	var mywidth = 260;
	var myheight = 450;
 var mymoviestringb = "/acc/link/content/position_server/&amp;equipment_type_image_id=<xsl:value-of select='//equipment_type_image_id'/>&amp;equipment_type_id=<xsl:value-of select='//equipment_type_id'/>&amp;equipment_id=<xsl:value-of select='//equipment_id'/>&amp;w=260&amp;h=450";
   var so = new SWFObject(mymoviestringb, "mymovieb", 260, 450, "8", "#FFFFFF");
   so.write("equipment_config");
</script>
			


</xsl:if>
</xsl:template>
</xsl:stylesheet>
