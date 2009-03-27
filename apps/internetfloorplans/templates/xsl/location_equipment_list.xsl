<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: location_equipment_list.xml
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
  <xsl:include href="equipment_menu.xsl"/>
  <xsl:include href="location_summary.xsl"/>
  <xsl:include href="location_menu.xsl"/>
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
      <xsl:call-template name="location_menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$i18n"/>
      </xsl:call-template>

      <xsl:call-template name="location_summary">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$i18n"/>
      </xsl:call-template>
    <xsl:call-template name="jquery-setup">
      <xsl:with-param name="my-table">my-location-equipment-list</xsl:with-param>
      <xsl:with-param name="my-table-div">my-location-equipment-list-div</xsl:with-param>
      <xsl:with-param name="no-sort-column">,
        headers: {
            2: {sorter: false},
            3: {sorter: false}
        }
    </xsl:with-param>
    </xsl:call-template>
    <script type="text/javascript">
    var question = 'Are you sure you want to delete this equipment?';
    function equipment_delete(equipment_id,row) {
        if(confirm(question)) {
            $.post("<xsl:value-of select="$link_prefix"/>ifp-equipment-delete", {'equipment_id': equipment_id}, 
            function (data){
                myTable = document.getElementById("my-location-equipment-list");
                myTable.deleteRow(row);
            });
        }
    }
    </script>

    <div id="my-location-equipment-list-div">
      <script type="text/javascript">
      //    document.getElementById('my-location-equipment-list-div').style.visibility = 'hidden';
      </script>
      <table width="100%" class="tablesorter" id="my-location-equipment-list">
        <thead>
          <tr>
            <th>
              <xsl:value-of select="$i18n/id"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/equipment_type"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/edit"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/delete"/>
            </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="//location_get_equipment/location_get_equipment">
            <tr>
              <td>
                <a href="{$link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}&amp;location_id={//_get/location_id}">
                  <xsl:value-of select="equipment_id"/>
                </a>
              </td>
              <td>
                <xsl:value-of select="name"/>
              </td>
              <td>
                <a href="{$link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}">
                  <xsl:value-of select="$i18n/edit"/>
                </a>
              </td>
              <td>
                <a href="{$link_prefix}ifp-equipment-delete&amp;equipment_id={equipment_id}"
                    onclick="equipment_delete({equipment_id},this.parentNode.parentNode.rowIndex); return false;">
                  <xsl:value-of select="$i18n/delete"/>
                </a>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>

			<div style="float: right;" class="generic-button">
				<a href="{$link_prefix}ifp-equipment-edit&amp;location_id={//_get/location_id}">
					<xsl:value-of select="$i18n/add_new_equipment"/>
				</a>
			</div>
    </div>
    <xsl:call-template name="pager">
      <xsl:with-param name="my-table">my-location-equipment-list</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
