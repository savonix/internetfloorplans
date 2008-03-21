<!--
Program: Internet Floor Plans
Component: locations_view.xsl
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

<script language="JavaScript" src="/resources/js/checkbox.js"> &#160; </script>
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF" width="100%">
		<tr>
			<td align="left" WIDTH="30">
				<img src="/resources/img/location.png" /> 
			</td>
			<form action="/acc/link/loc/" method="post" name="form0">
			<td align="left">
				<font class="two">Region:</font>
				<select name="my_region_id" onChange="document.form0.submit();">
					<option value="all">All</option>	
					<xsl:for-each select="//get_all_regions">
						<option value="{region_id}"><xsl:if test="//my_region_id=region_id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="region_name"/></option>
					</xsl:for-each>
				</select>
				<input type="checkbox" name="x_view" value="all" onclick="document.form0.submit();"><xsl:if test="//x_view"><xsl:attribute name="checked"></xsl:attribute></xsl:if></input> Hide compliant offices
			</td>
			</form>
			<form action="/acc/link/loc/search/" method="post" name="search">
			<td>
			Search: <input type="text" name="q"/> <input type="submit" value="Go"/>
			</td>
			</form>
			
			<td align="right">
				Results <xsl:value-of select="//start + 1"/> - <xsl:if test="//x_view"><xsl:value-of select="//start + count(//get_all_locations[status_id='0'])"/></xsl:if><xsl:if test="not(//x_view)"><xsl:value-of select="//start + count(//get_all_locations)"/></xsl:if> of a total of <xsl:if test="//x_view"><xsl:value-of select="count(//get_gt_locations[status_id='0'])"/></xsl:if><xsl:if test="not(//x_view)"><xsl:value-of select="count(//get_gt_locations)"/></xsl:if>.
			</td>
		</tr>
	</table>
	<form action="/acc/link/loc/email/" method="post" name="myform">
	<table border='0' cellspacing='1' cellpadding='0' bgcolor="#BBBBBB" width='100%'>
		<tr>	
			<td bgcolor='#EEEEEE' width="20"><font class="two">Status</font></td>
			<td bgcolor='#EEEEEE' width='110' class="basic-table-cell"><font class="two"><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.name<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.name')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.name')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>Branch Name</a></font></td>
			
			<td bgcolor='#EEEEEE' width='140' class="basic-table-cell"><font class="two"><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.address_line_1<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.address_line_1')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.address_line_1')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>Address</a></font></td>
			
			<td bgcolor='#EEEEEE' width='82' class="basic-table-cell"><font class="two"><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.city<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.city')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.city')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>City</a></font></td>
			
			<td bgcolor='#EEEEEE' width='72' class="basic-table-cell"><font class="two"><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.phone<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.phone')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.phone')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>Phone</a></font></td>
			<!--
			<td bgcolor='#EEEEEE' class="basic-table-cell"><font class="two"><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.manager<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.manager')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.manager')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>Contact</a></font></td>-->
			<td bgcolor="#EEEEEE" width="5">
			
			<input type="checkbox" value="all" title="Select All"><xsl:attribute name="onClick"><xsl:text>if(this.checked){ this.title='Deselect All'; checkAll(document.myform.locations);} else {uncheckAll(document.myform.locations); this.title='Select All';}</xsl:text>
			</xsl:attribute></input></td>
		</tr>
		<xsl:for-each select="//get_all_locations">
			<xsl:if test="not(//x_view)">
				<xsl:call-template name="location_row"/>
			</xsl:if>				
			<xsl:if test="(//x_view) and (status_id=0)">
				<xsl:call-template name="location_row"/>
			</xsl:if>				
		</xsl:for-each>
		
		<xsl:if test="(count(//get_all_locations) = //incr) or (//_get/start!=0)">
			<tr><td align="left" bgcolor="#FFFFFF" colspan="7">
			</td></tr>
			
		</xsl:if>
	</table></form>
</xsl:template>


<xsl:template name="location_row">

		<tr>
			<td bgcolor='white' align="middle">
				<xsl:if test="(status_id=0)"><img src="/resources/img/style-1.1/images/icon_error_sml.gif" alt="Non-compliant"/></xsl:if>
				<xsl:if test="(status_id=1) or (not(status_id))"><img src="/resources/img/style-1.1/images/icon_success_sml.gif" alt="Compliant"/></xsl:if>
			</td>
			<td bgcolor='white' width='110' class="basic-table-cell"><font class="one"><!--<xsl:value-of select="status_id"/> - <xsl:value-of select="equipment_id"/> -->
			
			<xsl:if test="status_id=0"><a class="basic-table-cell"><xsl:attribute name="href">/acc/link/loc/view/sp/&amp;location_address_id=<xsl:value-of select="location_address_id"/><xsl:if test="//_get/body='true'">&amp;body=true</xsl:if></xsl:attribute><font color="red"><font class="one"><xsl:value-of select="name"/></font></font></a></xsl:if>
			
			<xsl:if test="not(status_id)"><a class="basic-table-cell"><xsl:attribute name="href">/acc/link/loc/view/sp/&amp;location_address_id=<xsl:value-of select="location_address_id"/><xsl:if test="//_get/body='true'">&amp;body=true</xsl:if></xsl:attribute><xsl:value-of select="name"/></a></xsl:if>		
			
			<xsl:if test="(status_id!=0)"><a href="/acc/link/loc/view/sp/&amp;location_address_id={location_address_id}" class="basic-table-cell"><xsl:value-of select="name"/></a></xsl:if>
			
			</font></td>
			
			<td bgcolor='white' width='120' class="basic-table-cell"><font  class="basic-table-cell"><xsl:value-of select="address_line_1"/></font></td>
			<td bgcolor='white' width='140' class="basic-table-cell"><font class="one"><xsl:value-of select="city"/></font></td>
			<td bgcolor='white' width='92' class="basic-table-cell"><font class="one"><xsl:value-of select="phone"/></font></td>
			<!--<td bgcolor='white' class="basic-table-cell"><font class="one">
			<a class="basic-table-cell"><xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute><xsl:value-of select="first_name"/>&#160;<xsl:value-of select="last_name"/></a></font></td>-->
			<td bgcolor="#FFFFFF" width="5"><input type="checkbox" id="locations" name="location_address_id[]" onclick=""/></td>
		</tr>	
</xsl:template>
</xsl:stylesheet>
