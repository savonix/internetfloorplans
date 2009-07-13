<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_type_form.xsl
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
  <xsl:include href="equipment_type_menu.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
      <xsl:call-template name="equipment-type-menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$i18n"/>
      </xsl:call-template>
    <form method="post">
      <xsl:if test="//_get/equipment_type_id">
        <input type="hidden" name="equipment_type_id" value="{//_get/equipment_type_id}"/>
      </xsl:if>
      <table>
        <tr>
          <td>
            <xsl:value-of select="$i18n/equipment_type_name"/>
          </td>
          <td>
            <input type="text" name="name" value="{//equipment_type_get_by_id/name}"/>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="$i18n/description"/>
          </td>
          <td>
            <textarea name="description" cols="25" rows="5">
              <xsl:value-of select="//equipment_type_get_by_id/description"/>
            </textarea>
          </td>
        </tr>
      </table>
      <div style="text-align: center;">
        <input type="submit" value="Submit" name="submit"/>
        <input type="button" value="Cancel"
          onclick="window.location.href='{$link_prefix}ifp-equipment-types'"/>
      </div>
    </form>
  </xsl:template>
</xsl:stylesheet>
