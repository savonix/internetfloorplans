<!--
Program: Internet Floor Plans
Component: equipment_type_image_form.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="main.xsl"/>
<xsl:include href="equipment_type_menu.xsl"/>
<xsl:include href="equipment_type_summary.xsl"/>
<xsl:include href="upload_form.xsl"/>
<xsl:template name="content">
	<form enctype="multipart/form-data" method="post">

	<input
        type="hidden"
        name="dest"
        value="{//option_get[option_key='file_upload_directory']/option_value}"
        />

	<input
        type="hidden"
        name="equipment_type_id"
        value="{//_get/equipment_type_id}"
        />

    <xsl:if test="//static_file_id">
	    <input type="hidden" name="static_file_id" value="{//static_file_id}"/>
    </xsl:if>
    <xsl:call-template name="equipment-type-menu"/>
	<xsl:call-template name="equipment-type-summary"/>
    <xsl:call-template name="upload_form"/>
	</form>
</xsl:template>
</xsl:stylesheet>
