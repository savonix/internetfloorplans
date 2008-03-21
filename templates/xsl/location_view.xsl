<!--
Program: Internet Floor Plans
Component: location_view.xsl
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
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">	
	
<script type="text/javascript" src="/resources/js/popup.js"> &#160; 
</script>
<form method="post"><xsl:attribute name="action">/<xsl:value-of select="//self"/></xsl:attribute>
<input type="hidden" name="location_address_id"><xsl:attribute name="value"><xsl:value-of select="//_get/location_address_id"/></xsl:attribute></input>

<xsl:call-template name="location_menu" />

<xsl:call-template name="location_summary" />

<table>
<tr>
	<td width="10%" valign="top">
		<table>
			<tr>
				<td valign="top">
					<b>Virtual Tours</b>
				</td>
			</tr>
			<xsl:for-each select="//get_location_images" >
			<tr>
				<td valign="top">
                        <xsl:value-of select="name"/>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<table >
			<tr>
				<td valign="top">
					<b>Tour options</b>
				</td>
			</tr>
			<tr>
				<td valign="top" >
					<a><xsl:attribute name="href">add/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>Add New Image</a>
				</td>
			</tr>
			<tr>
				<td valign="top" >
					<a onclick="return confirm('Are you sure you want to delete this location image?')"><xsl:attribute name="href">delete/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id" />&amp;location_image_id=<xsl:if test="//_get/location_image_id"><xsl:value-of select="//_get/location_image_id"/></xsl:if><xsl:if test="not(//_get/location_image_id)"><xsl:for-each select="//get_location_images"><xsl:if test="(default_image=1) or (count(//get_location_images)=1)"><xsl:value-of select="location_image_id"/></xsl:if></xsl:for-each></xsl:if></xsl:attribute>Delete This Image</a>
				</td>
			</tr>
		</table>
	</td>
	
	<xsl:variable name="image_id"><xsl:if test="//_get/location_image_id"><xsl:value-of select="//_get/location_image_id"/></xsl:if><xsl:if test="not(//_get/location_image_id)"><xsl:value-of select="//get_location_images[1]/location_image_id"/></xsl:if></xsl:variable>
	<td align="left" valign="top" width="90%">
		<table >
			<tr>
				<td>
					<xsl:value-of select="//get_location_images[location_image_id=$image_id]/name"/>
				</td>
			</tr>
			<tr>
				<td valign="top">
				
				<xsl:choose>
					<xsl:when test="contains(image_pointer,'.mov')"> 
						<EMBED type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
							<xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_location_images[location_image_id=$image_id]/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_location_images[location_image_id=$image_id]/mime_type"/>&amp;type=photography</xsl:attribute>
						</EMBED>
					</xsl:when>
					<xsl:otherwise>
						<a>
<xsl:attribute name="onclick">PopupPic('/full_size_image_server/&amp;pointer=<xsl:value-of select="//get_location_images[location_image_id=$image_id]/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_location_images[location_image_id=//_get/location_image_id]/mime_type"/>&amp;type=photography',576,768)</xsl:attribute><img><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_location_images[location_image_id=$image_id]/thumb_pointer"/>&amp;mime_type=<xsl:value-of select="//get_location_images[location_image_id=$image_id]/mime_type"/>&amp;type=photography</xsl:attribute></img></a>
					</xsl:otherwise>
				</xsl:choose>	
				</td>

			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
