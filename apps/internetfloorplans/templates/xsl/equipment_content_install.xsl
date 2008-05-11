<!--
Program: Internet Floor Plans
Component: equipment_content_install.xsl
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
<xsl:include href="main.xsl"/>

<xsl:template name="content">
<form method="post">
<input type="hidden" name="equipment_id" value="{//_post/equipment_id}"/>
<table>
    <tr>
        <td>
	<xsl:value-of select="//labels/label[key='please_select_responce']/value"/>:
        <br/><br/>
        <table>
            <tr>
                <td>
                    <input type="radio" name="response" value="success" checked="checked"/>
                </td>
                <td><xsl:value-of select="//labels/label[key='materials_successfully_installed']/value"/>.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="never"/>
                </td>
                <td><xsl:value-of select="//labels/label[key='never_received_materials']/value"/>.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="replace"/>
                </td>
                <td><xsl:value-of select="//labels/label[key='received_materials_need_replacements']/value"/>.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="impossible"/>
                </td>
                <td><xsl:value-of select="//labels/label[key='fixture_is_not_there']/value"/>.</td>
            </tr>
        </table>
        </td>
        <td>
            <iframe name="config" id="config" height="525">
            &#160;
            </iframe>
        </td>

    </tr>

    <tr>
        <td colspan="2" align="center">
        <input type="submit" value="Submit" name="submit" />
        </td>
    </tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
