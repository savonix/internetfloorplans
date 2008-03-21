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
	<table border='0' cellspacing='1' cellpadding='5' width="100%">
		<tr>
			<td align="left" WIDTH="30">
				<img src="/resources/img/location.png" /> 
			</td>
			<form action="/acc/link/loc/" method="post" name="form0">
			<td align="left">
				Region:
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
			<td width="20">Status</td>
			<td width='110'>
			Branch Name</td>
			
			<td width='140'>
			Address</td>
			
			<td width='82'>
			City</td>
			
			<td width='72'>
			Phone</td>
			<!--
			<td><a>
			<xsl:attribute name="href">/acc/link/loc/&amp;sort=uplink_location_address.manager<xsl:if test="contains(//_get/dir,'ASC') and contains(//_get/sort,'uplink_location_address.manager')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=DESC</xsl:if><xsl:if test="contains(//_get/dir,'DESC') and contains(//_get/sort,'uplink_location_address.manager')">&amp;start=<xsl:value-of select="//_get/start"/>&amp;dir=ASC</xsl:if></xsl:attribute>Contact</a></td>-->
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
			<tr><td align="left" colspan="7">
			</td></tr>
			
		</xsl:if>
	</table></form>
</xsl:template>


<xsl:template name="location_row">

		<tr>
			<td  align="middle">
				<xsl:if test="(status_id=0)"><img src="/resources/img/style-1.1/images/icon_error_sml.gif" alt="Non-compliant"/></xsl:if>
				<xsl:if test="(status_id=1) or (not(status_id))"><img src="/resources/img/style-1.1/images/icon_success_sml.gif" alt="Compliant"/></xsl:if>
			</td>
			<td  width='110'><!--<xsl:value-of select="status_id"/> - <xsl:value-of select="equipment_id"/> -->
            <a href="{//link_prefix}ifp-location-view&amp;location_id={location_id}"><xsl:value-of select="name"/></a>
			
			</td>
			
			<td  width='120'><xsl:value-of select="address_line_1"/></td>
			<td  width='140'><xsl:value-of select="city"/></td>
			<td  width='92'><xsl:value-of select="phone"/></td>
			<!--<td >
			<a><xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute><xsl:value-of select="first_name"/>&#160;<xsl:value-of select="last_name"/></a></td>-->
			<td width="5"><input type="checkbox" id="locations" name="location_address_id[]" onclick=""/></td>
		</tr>	
</xsl:template>
</xsl:stylesheet>
