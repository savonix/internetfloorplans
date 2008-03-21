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
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:import href="../../../../_shared/xsl/upload_form.xsl"/>
<xsl:template name="content">
	<form enctype="multipart/form-data" action="/acc/link/types/view/sp/add/submit/" method="post">
	<input type="hidden" name="dest"><xsl:attribute name="value">../usr/<xsl:value-of select="//user_account_id"/>/merchandising/</xsl:attribute></input>
	<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
	<table border='0' cellspacing='1' cellpadding='5' >
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
			</td>
			<xsl:call-template name="equipment_type_menu" />
		</tr>
	</table>
	<table border="0" cellspacing="1" cellpadding="2"  >
	<xsl:call-template name="asset_type_summary" />
	<tr>
		<td colspan="4" >
		<table border="0" cellpadding="10" cellspacing="1"  width="600">
		<tr><td>
	
		<xsl:call-template name="upload_form" />		
		</td></tr>
	</table>
	</td></tr></table>
	</form>
</xsl:template>
</xsl:stylesheet>
