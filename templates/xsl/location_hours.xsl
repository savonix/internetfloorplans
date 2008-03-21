<!--
Program: Internet Floor Plans
Component: location_hours.xsl
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
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/location.png" /> 
			</td>
			<xsl:call-template name="location_menu" />
		</tr>
	</table>
	<table >
	<xsl:call-template name="location_summary" />
	<tr>
		<td colspan="4" >
			<table border='0' cellspacing='0' cellpadding='10' >
			<tr>
				<td align="left" valign="top">
				
					<table >
					<tr>
						<td width="10%" valign="top">
							<b>Day</b></td>
						<td width="10%" valign="top">
							<b>Hours</b></td>
						<td width="20%" valign="top">
							<b>Edit</b></td>
						<td width="20%" valign="top">
							<b>Delete</b></td>
					</tr>
					<!-- Need to somehow get the seven days of the week in here. -->
					<xsl:for-each select="//days">
					<tr class="row{position() mod 2}">
						<td valign="top">
							<a href="/acc/link/loc/view/hours/edit/&amp;location_address_id={//_get/location_address_id}&amp;day_id={day_id}"><xsl:value-of select="day"/></a>
						</td>
						<td valign="top">
							
							<xsl:variable name="this_day_id"><xsl:value-of select="day_id"/></xsl:variable>
							<xsl:for-each select="//get_location_hours">
								<xsl:if test="day_id=$this_day_id">
									<xsl:choose>
										<xsl:when test="substring(open_time,1,2) &lt; 12">
											<xsl:value-of select="substring(open_time,1,2)"/>
										</xsl:when>
										<xsl:when test="substring(open_time,1,2) &gt; 12">
											0<xsl:value-of select="substring(open_time,1,2) - 12"/>
										</xsl:when>
									</xsl:choose>
									<xsl:value-of select="substring(open_time,3,3)"/> 
										<xsl:choose>
											<xsl:when test="substring(open_time,1,2)&lt;12"> AM</xsl:when>
											<xsl:when test="substring(open_time,1,2)&gt;12"> PM</xsl:when>
										</xsl:choose>
									- 
									<xsl:choose>
										<xsl:when test="substring(close_time,1,2) &lt; 12">
											<xsl:value-of select="substring(close_time,1,2)"/>
										</xsl:when>
										<xsl:when test="substring(close_time,1,2) &gt; 12">
											0<xsl:value-of select="substring(close_time,1,2) - 12"/>
										</xsl:when>
									</xsl:choose>
									<xsl:value-of select="substring(close_time,3,3)"/>
										<xsl:choose>
											<xsl:when test="substring(close_time,1,2) &lt; 12"> AM</xsl:when>
											<xsl:when test="substring(close_time,1,2) &gt; 12"> PM</xsl:when>
										</xsl:choose>
								</xsl:if>
							</xsl:for-each>
							
						</td>

						<td valign="top">
							<a href="/acc/link/loc/view/hours/edit/&amp;location_address_id={//_get/location_address_id}&amp;day_id={day_id}">
							Edit</a></td>
						<td valign="top">
							<a href="/acc/link/loc/view/hours/delete/&amp;location_address_id={//_get/location_address_id}&amp;day_id={day_id}"
							onclick="return confirm('Are you sure you want to delete these hours?')">
							Delete</a></td>
					</tr>					
					</xsl:for-each>
					</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>

	</table>
</xsl:template>
</xsl:stylesheet>
