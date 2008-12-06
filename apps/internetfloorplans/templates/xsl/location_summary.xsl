<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: location_summary.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="location_summary">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <xsl:for-each select="/_R_/location_get_summary/location_get_summary">
      <table class="simple-table">
        <tr>
          <td>
            <xsl:value-of select="/_R_/i18n/location_options"/>&#160;
            <a href="{$link_prefix}ifp-location-edit&amp;location_address_id={location_id}">
              <xsl:value-of select="/_R_/i18n/edit"/>
            </a>&#160;
            <a href="{$link_prefix}ifp-location-delete&amp;location_address_id={location_id}" onclick="return confirm('{/_R_/i18n/confirm_delete}')">
              <xsl:value-of select="/_R_/i18n/delete"/>
            </a>
          </td>
          <td>
            <xsl:value-of select="address_line_1"/>
            <br/>
            <xsl:value-of select="city"/>&#160;
            <xsl:value-of select="state" />,
            <xsl:value-of select="zip"/>
          </td>
          <td>
            Tel: <xsl:value-of select="phone"/>
            <br/>
            Fax: <xsl:value-of select="fax"/>
          </td>
          <td></td>
        </tr>
      </table>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
