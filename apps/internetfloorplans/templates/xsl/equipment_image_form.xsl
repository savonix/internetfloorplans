<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_image_form.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="equipment_type_summary.xsl"/>
	<xsl:include href="equipment_type_menu.xsl"/>
	<xsl:include href="upload_form.xsl"/>
	<xsl:template name="content">
		<form enctype="multipart/form-data" method="post"
				action="{//link_prefix}ifp-equipment-type-image-submit&amp;equipment_type_id={//_get/equipment_type_id}">
			<input type="hidden" name="dest" value="{//upload_dest}"/>
			<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
			<xsl:call-template name="equipment-type-menu" />
			<xsl:call-template name="equipment-type-summary"/>
			<xsl:call-template name="upload_form"/>
		</form>
	</xsl:template>
</xsl:stylesheet>
