<!--
Program: Internet Floor Plans
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:include href="pager.xsl"/>
<xsl:template name="content">
<xsl:call-template name="jquery-setup">
    <xsl:with-param name="my-table">mylocations</xsl:with-param>
    <xsl:with-param name="my-table-div">my-locations-div</xsl:with-param>
    <xsl:with-param name="no-sort-column">,
        headers: {
            4: {sorter: false},
            5: {sorter: false},
            6: {sorter: false}
        }
    </xsl:with-param>
</xsl:call-template>
<div id="my-locations-div">
<script type="text/javascript">
    document.getElementById('my-locations-div').style.visibility = 'hidden';
</script>
<table width="100%" class="tablesorter" id="mylocations">
    <thead>
    <tr>
        <th>
            Status
        </th>
        <th>
            Branch Name
        </th>
        <th>
            Address
        </th>
        <th>
            City
        </th>
        <th>
            Phone
        </th>
        <th>
            Edit
        </th>
    </tr>
    </thead>
    <tbody>
    <xsl:for-each select="//locations_get_all">
        <xsl:if test="not(//x_view)">
            <xsl:call-template name="location_row"/>
        </xsl:if>
        <xsl:if test="(//x_view) and (status_id=0)">
            <xsl:call-template name="location_row"/>
        </xsl:if>
    </xsl:for-each>
    </tbody>
</table>
</div>
<div style="float: right;" class="generic-button">
    <a href="{//link_prefix}ifp-location-edit">Add Location</a>
</div>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">mylocations</xsl:with-param>
</xsl:call-template>
</xsl:template>


<xsl:template name="location_row">
    <tr>
        <td align="middle">
            <xsl:if test="(status_id=0)"><img src="/resources/img/style-1.1/images/icon_error_sml.gif" alt="Non-compliant"/></xsl:if>
            <xsl:if test="(status_id=1) or (not(status_id))"><img src="/resources/img/style-1.1/images/icon_success_sml.gif" alt="Compliant"/></xsl:if>
        </td>
        <td><!--<xsl:value-of select="status_id"/> - <xsl:value-of select="equipment_id"/> -->
            <a href="{//link_prefix}ifp-location-view&amp;location_id={location_id}">
                <xsl:value-of select="name"/>
            </a>
        </td>
        <td><xsl:value-of select="address_line_1"/></td>
        <td><xsl:value-of select="city"/></td>
        <td><xsl:value-of select="phone"/></td>
        <td><a href="{//link_prefix}ifp-location-edit&amp;location_id={location_id}">Edit</a></td>
    </tr>
</xsl:template>
</xsl:stylesheet>
