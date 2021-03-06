<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_type_icons.xsl
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
  <xsl:include href="equipment_type_summary.xsl"/>
    <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <xsl:call-template name="equipment-type-menu">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
			<xsl:with-param name="i18n" select="$i18n"/>
    </xsl:call-template>
    <xsl:call-template name="equipment-type-summary">
      <xsl:with-param name="link_prefix" select="$link_prefix"/>
      <xsl:with-param name="path_prefix" select="$path_prefix"/>
			<xsl:with-param name="i18n" select="$i18n"/>
    </xsl:call-template>
    <script type="text/javascript">
    var question = '<xsl:value-of select="$i18n/confirm_delete"/>';
    function equipment_type_icon_delete(static_file_id) {
        if(confirm(question)) {
            $.post("<xsl:value-of select="//link_prefix"/>x-equipment-type-icon-delete",
            {'static_file_id': static_file_id},
            function (data){
            });
        }
    }
    </script>
    <table class="simple-table">
      <thead>
        <tr>
          <th>
            <xsl:value-of select="$i18n/icons"/>
          </th>
        </tr>
      </thead>
      <xsl:for-each select="//equipment_type_get_icons">
        <tr>
          <td>
            <a>
              <xsl:value-of select="name"/>
            </a>
          </td>
        </tr>
      </xsl:for-each>
    </table>
    <br/>
    <table class="simple-table">
      <thead>
        <tr>
          <th>
            <xsl:value-of select="$i18n/options"/>
          </th>
        </tr>
      </thead>
      <xsl:if test="not(//equipment_type_get_icons)">
        <tr>
          <td>
            <a href="{//link_prefix}ifp-equipment-type-icon-edit&amp;equipment_type_id={//_get/equipment_type_id}">
              <xsl:value-of select="$i18n/add_new_icon" />
            </a>
          </td>
        </tr>
      </xsl:if>


      <xsl:if test="//equipment_type_get_icons">
        <tr>
          <td>
            <a href="{//link_prefix}x-static-file-delete&amp;static_file_id={//equipment_type_get_icons/static_file_id}"
              onclick="static_file_delete({//equipment_type_get_icons/static_file_id}); return false;">
              <xsl:value-of select="$i18n/delete"/>
            </a>
          </td>
        </tr>
      </xsl:if>
    </table>

    <table class="simple-table">
      <tr>
        <td>
          <xsl:for-each select="//equipment_type_get_icons">
            <xsl:value-of select="name"/>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <td>
          <img src="{//path_prefix}{//equipment_type_get_icons/icon_pointer}"/>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="$i18n/comments"/>:
        </td>
      </tr>
      <tr>
        <td>
          <xsl:for-each select="//equipment_type_get_icons">
            <xsl:if test="equipment_type_icon_id=//_get/equipment_type_icon_id or (not(//_get/equipment_type_icon_id) and default_icon=1)">
              <xsl:value-of select="comments"/>
            </xsl:if>
          </xsl:for-each>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
