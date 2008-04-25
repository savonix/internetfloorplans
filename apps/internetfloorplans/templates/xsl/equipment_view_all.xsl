<!--
Program: Internet Floor Plans
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:import href="equipment_menu.xsl"/>
<xsl:include href="pager.xsl"/>
<xsl:template name="content">
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
<div id="my-equipment-view-all-div">
<script type="text/javascript">
//    document.getElementById('my-equipment-view-all-div').style.visibility = 'hidden';
</script>
<form method="post">
<table width="100%" class="tablesorter" id="my-equipment-view-all">
        <thead>
		<tr>
			<th>
				<xsl:value-of select="//labels/label[key='equipment_type']/value"/>
            </th>
			<th>
				<xsl:value-of select="//labels/label[key='location']/value"/>
            </th>
			<th>
				<xsl:value-of select="//labels/label[key='edit']/value"/>
            </th>
			<th>
				<xsl:value-of select="//labels/label[key='delete']/value"/>
            </th>
		</tr>
        </thead>
        <tbody>
		<xsl:for-each select="//equipment_get_all">
		<tr class="row{position() mod 2}">
			<td>
				<xsl:value-of select="name"/></td>
			<td>
				<a href="{//link_prefix}ifp-location-view&amp;location_id={location_id}">
                    <xsl:value-of select="//location_address_name"/>
                </a>
            </td>
			<td>
				<a href="{//link_prefix}ifp-equipment-edit&amp;equipment_id={equipment_id}">
                    <xsl:value-of select="//labels/label[key='edit']/value"/>
                </a>
            </td>
			<td>
				<a href="{//link_prefix}ifp-equipment-delete&amp;equipment_id={equipment_id}" 
                    onclick="return false;">
                    <xsl:value-of select="//labels/label[key='delete']/value"/>
                </a>
            </td>
		</tr>
		</xsl:for-each>
        </tbody>
	</table>
	</form></div>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">my-equipment-view-all</xsl:with-param>
</xsl:call-template>
</xsl:template>
</xsl:stylesheet>
