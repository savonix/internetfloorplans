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
<xsl:include href="html_main.xsl"/>
<xsl:include href="location_summary.xsl"/>
<xsl:include href="location_menu.xsl"/>
<xsl:template name="content">
<form method="post">
<input type="hidden" name="location_id" value="{//_get/location_id}"/>

<xsl:call-template name="location_menu" />

<xsl:call-template name="location_summary" />

<table>
<tr>
	<td>
		<table class="simple-table">
			<tr>
				<td>
					<xsl:value-of select="/_R_/i18n/virtual_tours"/>
				</td>
			</tr>
			<xsl:for-each select="//get_location_images" >
			<tr>
				<td>
                        <xsl:value-of select="name"/>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<table class="simple-table">
			<thead>
            <tr>
				<th>
					<xsl:value-of select="/_R_/i18n/tour_options"/>
				</th>
			</tr>
            </thead>
            <xsl:if test="not(//location_image_id)">
			<tr>
				<td>
					<a href="{//link_prefix}ifp-location-image-edit&amp;location_id={//_get/location_id}">
                        <xsl:value-of select="/_R_/i18n/add_new_image"/>
                    </a>
				</td>
			</tr>
            </xsl:if>
            <xsl:if test="//location_image_id">
			<tr>
				<td>
					<a href="#" onclick="return confirm('{/_R_/i18n/confirm_delete}')">
                    <xsl:value-of select="/_R_/i18n/delete"/> <xsl:value-of select="/_R_/i18n/this_image"/></a>
				</td>
			</tr>
            </xsl:if>
		</table>
	</td>
	
	<xsl:variable name="image_id">
        <xsl:if test="//_get/location_image_id">
            <xsl:value-of select="//_get/location_image_id"/>
        </xsl:if>
        <xsl:if test="not(//_get/location_image_id)">
            <xsl:value-of select="//get_location_images[1]/location_image_id"/>
        </xsl:if>
    </xsl:variable>
	<td align="left">
		<table>
			<tr>
				<td>
					<xsl:value-of select="//get_location_images[location_image_id=$image_id]/name"/>
				</td>
			</tr>
			<tr>
				<td>
                <!-- FIXME: IMAGE OR MOVIE GOES HERE - REDO THIS -->
				</td>

			</tr>
		</table>
	</td>
</tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
