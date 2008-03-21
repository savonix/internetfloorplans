<!--
Program: Internet Floor Plans
Component: location_space_plan.xsl
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
<xsl:call-template name="location_menu" />

	<table >
	<xsl:call-template name="location_summary" />
	<tr><td>
			<table>
			<tr>
				<td align="left" valign="top">
					<table >
						<tr>
							<td colspan="2">
								<b>Space Plan Options</b> : 
								<xsl:if test="not(//location_space_plan_id)">
								<a><xsl:attribute name="href">add/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>Add New Plan</a>
								</xsl:if>
								
								
								<xsl:if test="//location_space_plan_id">
									<xsl:if test="//space_plan_locked='true'">	
										[ <a><xsl:attribute name="href">unlock/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;location_space_plan_id=<xsl:value-of select="//location_space_plan_id"/></xsl:attribute>Unlock This Plan</a> ]
										&#160;&#160;
									</xsl:if>
								[ 
		<xsl:if test="contains(//get_location_space_plans/space_plan_pointer,'.swf')">PDF Not Available</xsl:if>
		<xsl:if test="not(contains(//get_location_space_plans/space_plan_pointer,'.swf'))"><a href="/acc/link/loc/view/sp/pdf_server/&amp;location_address_id={//_get/location_address_id}&amp;location_space_plan_id={//location_space_plan_id}">
								PDF</a></xsl:if> ]
								&#160;&#160;
								[ <a onclick="return confirm('Are you sure you want to delete this location space plan?')"><xsl:attribute name="href">delete/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;location_space_plan_id=<xsl:value-of select="//location_space_plan_id"/></xsl:attribute>Delete This Plan</a> ]
								<xsl:if test="//_get/key='no'">
								[ <a href="{//request_uri}&amp;key=yes">Show Icons</a> ] </xsl:if>
								<xsl:if test="//_get/key='yes' or not(//_get/key)">
								[ <a href="/acc/link/loc/view/sp/&amp;location_address_id={//_get/location_address_id}&amp;key=no">Hide Icons</a> ] </xsl:if>
								</xsl:if>
								
								
								
								<xsl:if test="//mode='dev'">
								[ <a>
								<xsl:attribute name="href">/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="//get_location_space_plans/location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;key=<xsl:value-of select="//_get/key"/></xsl:attribute>
								Debug SWF</a> ] </xsl:if>
								
								
								
							</td>
						</tr>
						<tr>
							<td valign="top" colspan="2">
<script type="text/javascript" src="/resources/js/swfobject.js"></script>
<div id="space_plan">
	<!-- Show static jpg here when the visitor does not have the flash plugin. -->

</div>
							
<script type="text/javascript" defer="defer">
 <!-- {//_get/location_address_id} -->
 var mymoviestring = "/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="//get_location_space_plans/location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;key=<xsl:value-of select="//_get/key"/>";
 var so = new SWFObject(mymoviestring, "mymovie", "825", "825", "8","#FFFFFF");
 so.write("space_plan");
</script>
							
							</td>
						</tr>
					


					</table>
				</td>
				<td>
					<table>
						<tr>
							<td>
								
								Equipment Configuration
								
							</td>
						</tr>
						<tr>
							<td>
							
<iframe name="config" id="config" width="260" height="525"><xsl:attribute name="src"></xsl:attribute> </iframe>
							
							
							
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
	</td></tr></table>
</xsl:template>
</xsl:stylesheet>
