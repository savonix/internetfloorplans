<!--
Program: Internet Floor Plans
Component: equipment_type_menu.xsl
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
  <xsl:template name="equipment-type-menu">
    <table class="simple-table">
      <tr>
        <td>
          <a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={//_get/equipment_type_id}">
            <xsl:value-of select="/_R_/i18n/edit"/>
          </a>
        </td>
        <td>
          <a href="{//link_prefix}ifp-equipment-type-images&amp;equipment_type_id={//_get/equipment_type_id}">
            <xsl:value-of select="/_R_/i18n/images"/>
          </a>
        </td>
        <td>
          <a href="{//link_prefix}ifp-equipment-type-icons&amp;equipment_type_id={//_get/equipment_type_id}">
            <xsl:value-of select="/_R_/i18n/icons"/>
          </a>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
