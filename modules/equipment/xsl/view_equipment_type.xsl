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
	<form action="{self}" method="post">
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
								<font class="one"><b>Images</b></font>
							</td>
						</tr>
						<xsl:for-each select="//get_asset_type_images" >
						<tr>
							<td bgcolor="#FFFFFF" valign="top">
							
								<font class="one">
								<a>
										<xsl:attribute name="href">&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/>&amp;equipment_type_image_id=<xsl:value-of select="equipment_type_image_id"/></xsl:attribute>
											<xsl:value-of select="name"/></a>
								</font>
							</td>
						</tr>
						</xsl:for-each>
					</table>
					<br/>
					<table border="0" cellspacing="1" cellpadding="2" bgcolor="#DDDDDD" width="100%">
						<tr>
							<td valign="top">
								<font class="one"><b>Options</b></font>
							</td>
						</tr>
						<xsl:if test="not(//get_asset_type_images)">
						<tr>
							<td valign="top" bgcolor="#FFFFFFF">
								<font class="one"><a><xsl:attribute name="href">add/&amp;equipment_type_id=<xsl:value-of select="//_get/equipment_type_id"/></xsl:attribute>Add New Image</a></font>
							</td>
						</tr>
						</xsl:if>
						<tr>
							<td valign="top" bgcolor="#FFFFFFF">
								<font class="one"><a onclick="return confirm('Are you sure you want to delete this equipment type image?')"><xsl:attribute name="href">delete/&amp;equipment_type_image_id=<xsl:if test="//_get/equipment_type_image_id"><xsl:value-of select="//_get/equipment_type_image_id"/></xsl:if><xsl:if test="not(//_get/equipment_type_image_id)"><xsl:for-each select="//get_asset_type_images"><xsl:if test="(default_image=1) or (count(//get_asset_type_images)=1)"><xsl:value-of select="equipment_type_image_id"/></xsl:if></xsl:for-each></xsl:if></xsl:attribute>Delete This Image</a></font>
							</td>
						</tr>
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
							<td valign="top" bgcolor="white">
							
								<img border="0" ><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_asset_type_images/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_asset_type_images/mime_type"/>&amp;type=merchandising</xsl:attribute></img>
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
	</form>
</xsl:template>
</xsl:stylesheet>
