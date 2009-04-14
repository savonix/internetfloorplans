<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_types.xml
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
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <xsl:call-template name="jquery-setup">
      <xsl:with-param name="my-table">myequipmenttypes</xsl:with-param>
      <xsl:with-param name="no-sort-column">,
        headers: {
            2: {sorter: false},
            3: {sorter: false}
	    }
    </xsl:with-param>
    </xsl:call-template>
    <!-- Confirm equipment deletion -->
    <script type="text/javascript">
    var question = '<xsl:value-of select="$i18n/confirm_equipment_type_delete"/>';
    function equipment_type_delete(equipment_type_id) {
        if(confirm(question)) {
            $.post("<xsl:value-of select="$link_prefix"/>ifp-equipment-type-delete",
            {'equipment_type_id': equipment_type_id},
            function (data){
            });
        }
    }
    </script>
    <div id="tableframe">
      <table width="100%" class="tablesorter" id="myequipmenttypes">
        <thead>
          <tr>
            <th>
              <xsl:value-of select="$i18n/equipment_type_name" />
            </th>
            <th>
              <xsl:value-of select="$i18n/description" />
            </th>
            <th>
              <xsl:value-of select="$i18n/edit" />
            </th>
            <th>
              <xsl:value-of select="$i18n/delete" />
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/_R_/equipment_types_get_all/equipment_types_get_all">
            <tr>
              <td>
                <a href="{$link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">
                  <xsl:value-of select="name"/>
                </a>
              </td>
              <td>
                <xsl:value-of select="description"/>
              </td>
              <td>
                <a href="{$link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">
                  <xsl:value-of select="$i18n/edit"/>
                </a>
              </td>
              <td>
                <a href="{$link_prefix}ifp-equipment-type-delete&amp;equipment_type_id={equipment_type_id}"
                  onclick="equipment_type_delete({equipment_type_id}); return false;">
                  <xsl:value-of select="$i18n/delete"/>
                </a>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
    <a href="{$link_prefix}ifp-equipment-type-edit">
      <xsl:value-of select="$i18n/new_equipment_type"/>
    </a>
    <xsl:call-template name="pager">
      <xsl:with-param name="my-table">myequipmenttypes</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
