<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: locations_view.xsl
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
      <xsl:with-param name="my-table">mylocations</xsl:with-param>
      <xsl:with-param name="no-sort-column">,
			headers: {
					3: {sorter: false},
					4: {sorter: false},
					5: {sorter: false}
			}
			</xsl:with-param>
    </xsl:call-template>
    <!-- Confirm location deletion -->
    <script type="text/javascript">
    var question = 'Are you sure you want to delete this location?';
    function location_delete(location_id) {
        if(confirm(question)) { 
            $.post("<xsl:value-of select="$link_prefix"/>ifp-location-delete", {'location_id': location_id},
            function (data){
                $("#l_{location_id}").remove();
            });
        }
    }
    </script>
    <div id="tableframe">
      <table width="100%" class="tablesorter" id="mylocations">
        <thead>
          <tr>
            <th>
              <xsl:value-of select="$i18n/branch_name"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/address"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/city"/>
            </th>
            <th>
              <xsl:value-of select="$i18n/phone"/>
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
          <xsl:for-each select="/_R_/locations_get_all/locations_get_all">
            <xsl:if test="not(//x_view)">
              <xsl:call-template name="location_row">
								<xsl:with-param name="link_prefix" select="$link_prefix"/>
								<xsl:with-param name="path_prefix" select="$path_prefix"/>
								<xsl:with-param name="i18n" select="$i18n"/>
							</xsl:call-template>
            </xsl:if>
            <xsl:if test="(//x_view) and (status_id=0)">
              <xsl:call-template name="location_row">
								<xsl:with-param name="link_prefix" select="$link_prefix"/>
								<xsl:with-param name="path_prefix" select="$path_prefix"/>
								<xsl:with-param name="i18n" select="$i18n"/>
							</xsl:call-template>
            </xsl:if>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
    <div style="float: right;" class="generic-button">
      <a href="{$link_prefix}ifp-location-create">
        <xsl:value-of select="$i18n/add_location"/>
      </a>
    </div>
    <xsl:call-template name="pager">
      <xsl:with-param name="my-table">mylocations</xsl:with-param>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="location_row">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <tr id="l_{location_id}">
      <td>
        <a href="{$link_prefix}ifp-location-view&amp;location_id={location_id}">
          <xsl:value-of select="name"/>
        </a>
      </td>
      <td>
        <xsl:value-of select="address_line_1"/>
      </td>
      <td>
        <xsl:value-of select="city"/>
      </td>
      <td>
        <xsl:value-of select="phone"/>
      </td>
      <td>
        <a href="{$link_prefix}ifp-location-edit&amp;location_id={location_id}">
          <xsl:value-of select="$i18n/edit"/>
        </a>
      </td>
      <td>
        <a href="{$link_prefix}ifp-location-delete&amp;location_id={location_id}"
          onclick="location_delete({location_id}); return false;">
          <xsl:value-of select="$i18n/delete"/>
        </a>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
