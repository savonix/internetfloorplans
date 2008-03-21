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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:template name="content">
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			<xsl:call-template name="equipment_type_menu" />
		</tr>
	</table>
	<font class="three">
	<table border='0' cellspacing='1' cellpadding='2' bgcolor="#BBBBBB" width='100%'>
	<xsl:call-template name="asset_type_summary" />
	<tr>
		<td colspan="4" bgcolor="#FFFFFF">
			<table border='0' cellspacing='0' cellpadding='10' bgcolor="#CCCCCC">
			<tr>
								<td align="left" bgcolor="#FFFFFF" valign="top">
					<table border="0" cellspacing="1" cellpadding="2" bgcolor="#DDDDDD" width="100%">
						<tr>
							<td valign="top">
								<font class="one"><b>Add Containers</b></font>
							</td>
						</tr>
						<form action="{self}add/" method="post">
						<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
						<tr>
							<td valign="top" bgcolor="#FFFFFFF">
							Name:<input type="text" size="12" name="name"/><br/>
							<select name="container_id">
								<xsl:for-each select="//get_container_types" >
									<option value="{container_id}"><xsl:value-of select="name"/></option>
								</xsl:for-each>
							</select>
								<!--<br/>
								Quantity:<select value="quantity">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>-->
								<br/>
								<input type="submit" value="Add"/>
								
							</td>
						</tr>
						</form>
						
					</table>
					<br/>
					<table border="0" cellspacing="1" cellpadding="2" bgcolor="#DDDDDD" width="100%">
					
						<form action="{self}delete/" method="post">
						<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
						<tr>
							<td valign="top">
								<font class="one"><b>Delete Container</b></font>
							</td>
						</tr>
						<tr>
							<td valign="top" bgcolor="#FFFFFFF">
								<select name="equipment_type_container_id">
								<xsl:for-each select="//get_container_by_type_id" >
									<option value="{equipment_type_container_id}"><xsl:value-of select="name"/></option>
								</xsl:for-each>
								</select> <br/>
								<input type="submit" value="Delete"/>
							</td>
						</tr>
						</form>
					</table>
				</td>
				
				<td bgcolor="#FFFFFF" align="left" valign="top">
					<table border="0" cellspacing="1" cellpadding="5" bgcolor="#DDDDDD">
						<tr>
							<td bgcolor="white">
								<font class="two">
								<xsl:for-each select="//get_asset_type_images">
									<xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
									or (not(//_get/equipment_type_image_id) and default_image=1)">
										<xsl:value-of select="name"/>
									</xsl:if>
								</xsl:for-each>
								</font>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<xsl:choose>
									<xsl:when test="//_get/equipment_type_image_id">
										<xsl:for-each select="//get_asset_type_images">
											<xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id">
												<xsl:choose>
													<xsl:when test="contains(image_pointer,'.mov')"> 
														<EMBED type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
															<xsl:attribute name="src">/acc/link/types/image_server/&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/></xsl:attribute>
														</EMBED>
													</xsl:when>
													<xsl:otherwise>
														<img><xsl:attribute name="src">/acc/link/types/image_server/&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/></xsl:attribute></img>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="//get_asset_type_images">
											<xsl:if test="(default_image=1) or (count(//get_asset_type_images)=1)">
												<xsl:choose>
													<xsl:when test="contains(image_pointer,'.mov')"> 
														<EMBED  type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
															<xsl:attribute name="src">/acc/link/types/image_server/&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/></xsl:attribute>
														</EMBED>
													</xsl:when>
													<xsl:otherwise>
														
														
														
														<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
												 codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
												 WIDTH="730" HEIGHT="500">
												<embed quality="high" bgcolor="#ffffff" width="730" height="500" name="main2" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="https://www.macromedia.com/go/getflashplayer">
												<xsl:attribute name="src">/acc/link/types/containers/position_server/&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/>&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/></xsl:attribute>
												</embed>
												<PARAM NAME="movie"><xsl:attribute name="VALUE">/acc/link/types/containers/position_server/&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/>&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/></xsl:attribute></PARAM>
												 <PARAM NAME="quality" VALUE="high" /> 
												 <PARAM NAME="bgcolor" VALUE="#FFFFFF" />
												</object>
													</xsl:otherwise>
												</xsl:choose>										
											</xsl:if>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<font class="two">Comments:
								</font>
							</td>
						</tr>
						<tr>
							<td bgcolor="white">
								<font class="two">
								<xsl:for-each select="//get_asset_type_images">
									<xsl:if test="equipment_type_image_id=//_get/equipment_type_image_id
									or (not(//_get/equipment_type_image_id) and default_image=1)">
										<xsl:value-of select="comments"/>
									</xsl:if>
								</xsl:for-each>
								</font>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
	</font>
</xsl:template>
</xsl:stylesheet>