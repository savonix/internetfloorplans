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
	<form method="post" action="{//link_prefix}ifp-location-edit-submit">
	<xsl:if test="//_get/location_id">
	    <input type="hidden" name="location_id" value="{//_get/location_id}"/>
    </xsl:if>
    <xsl:call-template name="form"/>
	</form>
</xsl:template>


<xsl:template name="form">
		<table>
<xsl:if test="//_post/submit">
<tr>	
	<td colspan="2">
	  <xsl:value-of select="//labels/label[key='not_valid_data']/value"/>.
	</td>
</tr>
</xsl:if>
<tr>	
	<td><xsl:value-of select="//labels/label[key='name']/value"/>:*</td>
	<td><input type="text" name="location_name" value="{//location_get_summary/name|//_post/location_name}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='address_line']/value"/> 1:*</td>
	<td><input type="text" name="address_line_1" size="40" value="{//location_get_summary/address_line_1|//_post/address_line_1}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='address_line']/value"/> 2:</td>
	<td><input type="text" name="address_line_2" size="40" value="{//location_get_summary/address_line_2|//_post/address_line_2}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='city']/value"/>:*</td>
	<td><input type="text" name="city" size="20" value="{//location_get_summary/city|//_post/city}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='state']/value"/>:*</td>
	<td><input type="text" name="state" size="5" value="{//location_get_summary/state|//_post/state}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='zip']/value"/>:*</td>
	<td><input type="text" name="zip" size="10" value="{//location_get_summary/zip|//_post/zip}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='phone']/value"/>:</td>
	<td><input type="text" name="phone" value="{//location_get_summary/phone|//_post/phone}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='fax']/value"/>:</td>
	<td><input type="text" name="fax" value="{//location_get_summary/fax|//_post/fax}" /></td>
</tr>
<tr>
	<td><xsl:value-of select="//labels/label[key='regions']/value"/>:</td>
	<td>
	<xsl:for-each select="//regions_get_all">
		<input type="checkbox" name="regions[]" value="{region_id}"><xsl:if test="region_id=//get_location_regions/region_id"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input>
		<xsl:value-of select="region_name" />
		<br/>
	</xsl:for-each>
	</td>
</tr>
<tr>
    <td colspan="2" align="center"><br />

<input type="submit" value="Submit" name="submit" />
<input type="button" value="Cancel" onclick="window.location.href='{//link_prefix}ifp-locations'"/>
</td></tr></table>

</xsl:template>
</xsl:stylesheet>
