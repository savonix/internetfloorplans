<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_view_all.xsl
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
  <xsl:include href="pager.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <xsl:call-template name="jquery-setup">
      <xsl:with-param name="my-table">my-equipment-view-all</xsl:with-param>
      <xsl:with-param name="my-table-div">my-equipment-view-all-div</xsl:with-param>
      <xsl:with-param name="no-sort-column">,
			headers: {
					2: {sorter: false},
					3: {sorter: false}
			}
			</xsl:with-param>
    </xsl:call-template>

		<!-- Confirm equipment deletion -->
    <script type="text/javascript">
    var question = '<xsl:value-of select="$i18n/are_you_sure_delete"/>?';
    function equipment_delete(equipment_id,row) {
        if(confirm(question)) {
            $.post("<xsl:value-of select="$link_prefix"/>ifp-equipment-delete", {'equipment_id': equipment_id},
            function (data){
                myTable = document.getElementById("my-equipment-view-all");
                myTable.deleteRow(row);
            });
        }
    }
		</script>

    <div id="my-equipment-view-all-div">
      <script type="text/javascript">
			//    document.getElementById('my-equipment-view-all-div').style.visibility = 'hidden';
			</script>
      <table width="100%" class="tablesorter" id="my-equipment-view-all">
        <thead>
          <tr>
            <th>
              <xsl:value-of select="$i18n/equipment_type"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/location"/>
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
          <xsl:for-each select="//equipment_get_all/equipment_get_all">
            <tr>
              <td>
                <xsl:value-of select="name"/>
              </td>
              <td>
                <a href="{$link_prefix}ifp-location-view&amp;location_id={location_id}">
                  <xsl:value-of select="//location_address_name"/>
                </a>
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
    </div>
    <xsl:call-template name="pager">
      <xsl:with-param name="my-table">my-equipment-view-all</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
