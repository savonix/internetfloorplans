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
<xsl:import href="svn://main.xsl"/>
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
<form method="post"><xsl:attribute name="action">/<xsl:value-of select="//self"/></xsl:attribute>
<input type="hidden" name="location_address_id"><xsl:attribute name="value"><xsl:value-of select="//_get/location_address_id"/></xsl:attribute></input>
<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
	<tr>
		<td align="left">
			<img src="/resources/img/location.png" /> 
		</td>
		<xsl:call-template name="location_menu" />
	</tr>
</table>
	
	
	
<table border="0" cellspacing="1" cellpadding="2" width="100%" bgcolor="#AAAAAA">
<xsl:call-template name="location_summary" />
<tr>
<td colspan="4" bgcolor="#FFFFFF">
	<table border='0' cellspacing='0' cellpadding='10' bgcolor="#CCCCCC">
	<tr>
		<td align="left" bgcolor="#FFFFFF" valign="top">
			<table border="0" cellspacing="1" cellpadding="2" bgcolor="#DDDDDD" width="100%">
				<tr>
					<td valign="top">
						<font class="one"><b>Virtual Tours</b></font>
					</td>
				</tr>
				<xsl:for-each select="//get_location_images" >
				<tr>
					<td bgcolor="#FFFFFF" valign="top">
					
						<font class="one">
						<a>
								<xsl:attribute name="href">&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;location_image_id=<xsl:value-of select="location_image_id"/></xsl:attribute>
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
				<tr>
					<td valign="top" bgcolor="#FFFFFFF">
						<font class="one"><a><xsl:attribute name="href">add/&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/></xsl:attribute>Add New Image</a></font>
					</td>
				</tr>
				<xsl:if test="//_registry/user/roles='uplink_regional_manager'">
				<tr>
					<td valign="top" bgcolor="#FFFFFFF">
						<font class="one"><a><xsl:attribute name="href">delete/&amp;location_image_id=<xsl:if test="//_get/location_image_id"><xsl:value-of select="//_get/location_image_id"/></xsl:if><xsl:if test="not(//_get/location_image_id)"><xsl:for-each select="//get_location_images"><xsl:if test="default_image=1"><xsl:value-of select="location_image_id"/></xsl:if></xsl:for-each></xsl:if></xsl:attribute>Delete This Image</a></font>
					</td>
				</tr>
				</xsl:if>
			</table>
		</td>
		
		<td bgcolor="#FFFFFF" align="left" valign="top">
			<table border="0" cellspacing="1" cellpadding="5" bgcolor="#DDDDDD">
				<tr>
					<td bgcolor="white">
						<font class="two">
						<xsl:for-each select="//get_location_images">
							<xsl:if test="location_image_id=//_get/location_image_id
							or (not(//_get/location_image_id) and default_image=1)">
								<xsl:value-of select="name"/>
							</xsl:if>
						</xsl:for-each>
						</font>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="white">
						<xsl:choose>
							<xsl:when test="//_get/location_image_id">
								<xsl:for-each select="//get_location_images">
									<xsl:if test="location_image_id=//_get/location_image_id">
										<xsl:choose>
											<xsl:when test="contains(image_pointer,'.mov')"> 
												<EMBED type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
													<xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="image_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography</xsl:attribute>
												</EMBED>
											</xsl:when>
											<xsl:otherwise>
												<a>
<xsl:attribute name="onclick">PopupPic('/acc/link/loc/view/img/&amp;pointer=<xsl:value-of select="image_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography',576,768)</xsl:attribute><img><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="thumb_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography</xsl:attribute></img></a>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:when test="not(//default_image=1) and (count(//get_location_images)>1)">
										<xsl:choose>
											<xsl:when test="contains(image_pointer,'.mov')"> 
												<EMBED  type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
													<xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="image_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography</xsl:attribute>
												</EMBED>
											</xsl:when>
											
											<xsl:otherwise>
												<a>
<xsl:attribute name="onclick">PopupPic('/acc/link/loc/view/img/&amp;pointer=<xsl:value-of select="//get_location_images/image_pointer"/>&amp;mime_type=<xsl:value-of select="//get_location_images/mime_type"/>&amp;type=photography',576,768)</xsl:attribute><img><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//get_location_images/thumb_pointer"/>&amp;mime_type=<xsl:value-of select="//get_location_images/mime_type"/>&amp;type=photography</xsl:attribute></img></a>
											</xsl:otherwise>
										</xsl:choose>									
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="//get_location_images">
									<xsl:if test="(default_image=1) or (count(//get_location_images)=1)">
										<xsl:choose>
											<xsl:when test="contains(image_pointer,'.mov')"> 
												<EMBED  type="video/quicktime" cache='true' autoplay='true' controller='false' height='480' width='640'>
													<xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="image_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography</xsl:attribute>
												</EMBED>
											</xsl:when>
											<xsl:otherwise>
												<a>
<xsl:attribute name="onclick">PopupPic('/acc/link/loc/view/img/&amp;pointer=<xsl:value-of select="image_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography',576,768)</xsl:attribute><img><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="thumb_pointer"/>&amp;mime_type=<xsl:value-of select="mime_type"/>&amp;type=photography</xsl:attribute></img></a>
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
						<xsl:for-each select="//get_location_images">
							<xsl:if test="location_image_id=//_get/location_image_id
							or (not(//_get/location_image_id) and default_image=1)">
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
</form>
</xsl:template>
</xsl:stylesheet>
