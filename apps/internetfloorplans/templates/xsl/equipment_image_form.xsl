<!--
Program: Internet Floor Plans
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="equipment_type_summary.xsl"/>
<xsl:import href="equipment_type_menu.xsl"/>
<xsl:template name="content">
	<form enctype="multipart/form-data" action="/acc/link/types/view/add/submit/&amp;equipment_type_id={//_get/equipment_type_id}" method="post">
	<input type="hidden" name="dest"><xsl:attribute name="value">../usr/<xsl:value-of select="//user_account_id"/>/merchandising/</xsl:attribute></input>
	<input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
    <xsl:call-template name="equipment_type_menu" />
	<xsl:call-template name="asset_type_summary" />
    <table>
        <tr>	
            <td colspan="2">
                <xsl:value-of select="labels/label[key='upload_image_jpeg_format']/value"/>. </td>
        </tr>
        <tr>	
            <td><xsl:value-of select="labels/label[key='image_name']/value"/>:</td>
            <td><input type='text' name='name' size="25" ><xsl:attribute name="value"><xsl:value-of select="//_post/name"/></xsl:attribute></input></td>
        </tr>
        <tr>	
            <td><xsl:value-of select="labels/label[key='image_file']/value"/>:</td>
            <td><input type='file' name='file' size="25" /></td>
        </tr>
        <tr>
            <td><xsl:value-of select="labels/label[key='comments']/value"/>:</td>
            <td><textarea cols="35" rows="5" name="comments"><xsl:value-of select="//_post/comments"/></textarea></td>
        </tr>
        <!--<tr>
            <td>Default image:</td>
            <td><input type="checkbox" name="default" value="1"><xsl:if test="//_post/default"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></td>
        </tr>-->
        <input type="hidden" name="default" value="1"/>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Upload" name="submit" />
            </td>
        </tr>
    </table>
	</form>
</xsl:template>
</xsl:stylesheet>
