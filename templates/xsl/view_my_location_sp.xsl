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
	<xsl:if test="//get_all_locations/location_address_id=//_get/location_address_id">
	<table >
	<xsl:call-template name="location_summary" />
	<tr><td colspan="4" >
			<table border='0' cellspacing='0' cellpadding='10' >
			<tr>
				<td align="left" valign="top">
					<table >
						<tr>
							<td valign="top">
								<b>Space Plans</b>
							</td>
						</tr>
						<xsl:for-each select="//get_location_space_plans" >
						<tr>
							<td >
								
									<a>
										<xsl:attribute name="href">&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;location_space_plan_id=<xsl:value-of select="location_space_plan_id"/></xsl:attribute>
											<xsl:value-of select="name"/></a>
								
							</td>
						</tr>
						</xsl:for-each>
					</table>
					<br/>
					<xsl:if test="//user_roles='uplink_regional_manager'">
					<table >
						<tr>
							<td valign="top">
								<b>Options</b>
							</td>
						</tr>
						<tr>
							<td valign="top" >
								<a><xsl:attribute name="href">add/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>Add New Plan</a>
							</td>
						</tr>
						<tr>
							<td valign="top" >
								<a><xsl:attribute name="href">delete/&amp;location_space_plan_id=<xsl:if test="//_get/location_space_plan_id"><xsl:value-of select="//_get/location_space_plan_id"/></xsl:if><xsl:if test="not(//_get/location_space_plan_id)"><xsl:for-each select="//get_location_space_plans"><xsl:if test="default_space_plan=1"><xsl:value-of select="location_space_plan_id"/></xsl:if></xsl:for-each></xsl:if></xsl:attribute>Delete This Plan</a>
							</td>
						</tr>
						<tr>
							<td valign="top" >
								<img src="/resources/img/sem4inc/merch_key.jpg" alt="Merchandising Key"/>
							
							</td>
						</tr>
					</table>
					</xsl:if>
				</td>
				<td align="left" valign="top">
					<table >
						<tr>
							<td>
								
								<xsl:for-each select="//get_location_space_plans">
									<xsl:if test="location_space_plan_id=//_get/location_space_plan_id
									or (not(//_get/location_space_plan_id) and default_space_plan=1)">
										<xsl:value-of select="name"/>
									</xsl:if>
								</xsl:for-each>
								
							</td>
						</tr>
						<tr>
							<td valign="top" colspan="2">
								<xsl:if test="//_get/location_space_plan_id">
										<xsl:for-each select="//get_location_space_plans">
											<xsl:if test="location_space_plan_id=//_get/location_space_plan_id">
												<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
												 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
												 WIDTH="450" HEIGHT="550"><xsl:if test="//beneficial"><xsl:attribute name="WIDTH">700</xsl:attribute></xsl:if>
												<embed quality="high" bgcolor="#ffffff" width="450" height="550" name="main2" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"><xsl:if test="//beneficial"><xsl:attribute name="width">700</xsl:attribute></xsl:if>
												<xsl:attribute name="src">/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>
												</embed>
												<PARAM NAME="movie"><xsl:attribute name="VALUE">/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute></PARAM>
												 <PARAM NAME="quality" VALUE="high" /> 
												 <PARAM NAME="bgcolor" VALUE="#FFFFFF" />
												</object>
											</xsl:if>
										</xsl:for-each>
								</xsl:if>
								<xsl:if test="not(//_get/location_space_plan_id)">
										<!--<xsl:for-each select="//get_location_space_plans">
											<xsl:if test="default_space_plan=1">-->
												<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
												 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
												 WIDTH="450" HEIGHT="550"><xsl:if test="//beneficial"><xsl:attribute name="WIDTH">700</xsl:attribute></xsl:if>
												<embed quality="high" bgcolor="#ffffff" width="600" height="550" name="main2" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"><xsl:if test="//beneficial"><xsl:attribute name="width">700</xsl:attribute></xsl:if>
												<xsl:attribute name="src">/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="//get_location_space_plans/location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>
												</embed>
												<PARAM NAME="movie"><xsl:attribute name="VALUE">/acc/link/types/containers/nu_sp_server/&amp;location_space_plan_id=<xsl:value-of select="//get_location_space_plans/location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute></PARAM>
												 <PARAM NAME="quality" VALUE="high" /> 
												 <PARAM NAME="bgcolor" VALUE="#FFFFFF" />
												</object>
										<!--</xsl:if>
										</xsl:for-each>-->
									</xsl:if>
							</td>
						</tr>
						<tr>
							<td>
								Comments:
								
							</td>
						</tr>
						<tr>
							<td>
								
								<xsl:for-each select="//get_location_space_plans">
									<xsl:if test="location_space_plan_id=//_get/location_space_plan_id
									or (not(//_get/location_space_plan_id) and default_space_plan=1)">
										<xsl:copy-of select="comments"/>
									</xsl:if>
								</xsl:for-each>
								
							</td>
						</tr>
					</table>
				</td>
				<td align="left" valign="top" width="250">
					<table width="250">
						<tr>
							<td>
								
								Equipment Configuration
								
							</td>
						</tr>
						<tr>
							<td>
							<iframe name="config" id="config" src="" width="240" height="480" frame></iframe>
							
							
							
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
	</td></tr></table></xsl:if>
</xsl:template>
</xsl:stylesheet>
