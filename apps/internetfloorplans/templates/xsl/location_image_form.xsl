<!--
Program: Internet Floor Plans
Component: location_image_form.xsl
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
<xsl:import href="image_form.xsl"/>
<xsl:template name="content">
	
	<form enctype="multipart/form-data" method="post">
    <input type="hidden" name="dest" value="/tmp/"/>
	<input type="hidden" name="location_id" value="{//_get/location_id}"/>
    <xsl:call-template name="location_menu" />
	<xsl:call-template name="location_summary" />
    <xsl:call-template name="upload_form" />
	</form>
</xsl:template>
</xsl:stylesheet>
