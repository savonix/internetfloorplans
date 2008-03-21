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
<xsl:import href="../../../../_shared/xsl/image_form.xsl"/>
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
	
	<form enctype="multipart/form-data" action="/acc/link/loc/view/&amp;location_address_id={//_get/location_address_id}" method="post">
	<input type="hidden" name="dest"><xsl:attribute name="value">../usr/<xsl:value-of select="//user_account_id"/>/photography/</xsl:attribute></input>
	<input type="hidden" name="prefix" value="{//_get/location_address_id}" />
	<input type="hidden" name="thumb_prefix" value="th_" />
	<input type="hidden" name="location_address_id" value="{//_get/location_address_id}"/>
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
	<xsl:call-template name="image_form"/>

	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
