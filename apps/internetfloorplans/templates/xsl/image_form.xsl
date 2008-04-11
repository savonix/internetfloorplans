<!--
Program: Internet Floor Plans
Component: image_form.xsl
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
<xsl:template name="upload_form">

<table>
    <tr>
        <td colspan="2">
             <xsl:value-of select="//labels/label[key='enter_file_title']/value"/>. 
        </td>
    </tr>
    <tr>
        <td> <xsl:value-of select="//labels/label[key='file_title']/value"/>:</td>
        <td><input type='text' name='name' size="25" ><xsl:attribute name="value"><xsl:value-of select="//_post/name"/></xsl:attribute></input></td>
    </tr>
    <tr>
        <td> <xsl:value-of select="//labels/label[key='file_type']/value"/>:</td>
        <td>
            <select name="file_type">
                <option><xsl:value-of select="//labels/label[key='select_one']/value"/></option>
            <xsl:for-each select="//file_types">
                <option><xsl:value-of select="//labels/label[key='select_one']/value"/></option>
                <xsl:for-each select="//file_types">
                <option value="{id}"><xsl:value-of select="name"/></option>
                </xsl:for-each>
            </xsl:for-each>
                <option><xsl:value-of select="//labels/label[key='other']/value"/></option>
            </select>
        </td>
    </tr>
    <tr>
        <td> <xsl:value-of select="//labels/label[key='file_to_pload']/value"/>: * </td>
        <td><input type='file' name='file' size="25" class="box" /></td>
    </tr>
    <tr>
        <td><xsl:value-of select="//labels/label[key='comments']/value"/>:</td>
        <td><textarea cols="35" rows="5" name="comments"><xsl:value-of select="//_post/comments"/></textarea></td>
    </tr>
    <tr>
        <td colspan="2" align="center"><br />
            <table cellpadding="5">
                <tr>
                    <td><input type="submit" value="Upload" name="submit" /></td>
                    <td><input type="button" value="Cancel"  onclick="javascript:history.go(-1)"/></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</xsl:template>
</xsl:stylesheet>
