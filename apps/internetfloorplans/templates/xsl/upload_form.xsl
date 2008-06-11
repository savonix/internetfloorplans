<!--
Program: Internet Floor Plans
Component: upload_form.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="upload_form">

    <table>
      <tr>
        <td>
          <xsl:value-of select="/_R_/i18n/file_title"/>:</td>
        <td>
          <input type="text" name="name" value="{//_post/name}"/>
        </td>
      </tr>
      <xsl:if test="count(//static_file_types) &gt; 0">
        <tr>
          <td>
            <xsl:value-of select="/_R_/i18n/file_type"/>:</td>
          <td>
            <select name="static_file_type">
              <option>
                <xsl:value-of select="/_R_/i18n/select_one"/>
              </option>
              <xsl:for-each select="//static_file_types/type">
                <option value="{key}">
                  <xsl:value-of select="label"/>
                </option>
              </xsl:for-each>
            </select>
          </td>
        </tr>
      </xsl:if>
      <tr>
        <td>
          <xsl:value-of select="/_R_/i18n/file_to_upload"/>: *
        </td>
        <td>
          <input type="file" name="file"/>
        </td>
      </tr>
      <tr>
        <td>
          -OR-
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="/_R_/i18n/file_url"/>: * </td>
        <td>
          <input type="text" name="file_url"/>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="/_R_/i18n/comments"/>:</td>
        <td>
          <textarea cols="35" rows="5" name="comments">
            <xsl:value-of select="//_post/comments"/>
          </textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <br/>
          <table cellpadding="5">
            <tr>
              <td>
                <input type="submit" value="Upload" name="submit"/>
              </td>
              <td>
                <input type="button" value="Cancel" onclick="history.go(-1)"/>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
