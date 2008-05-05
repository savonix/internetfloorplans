<!--
Program: Internet Floor Plans
Component: regions_view_all.xsl
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
    <xsl:with-param name="my-table">myregions</xsl:with-param>
    <xsl:with-param name="my-table-div">my-regions-div</xsl:with-param>
    <xsl:with-param name="no-sort-column">,
        headers: {
            0: {sorter: false}
        }
    </xsl:with-param>
</xsl:call-template>
	<form method="post">
<div id="my-regions-div">
<script type="text/javascript">
    document.getElementById('my-regions-div').style.visibility = 'hidden';
</script>
<table width="100%" class="tablesorter" id="myregions">
    <thead>
    <tr>
        <th></th>
        <th>
            Region Name</th>
        <th>
            Type</th>
        <th>Locations</th>
    </tr>
    </thead>
    <tbody>
    <!-- Regions-->
    <xsl:for-each select="//regions_get_all">
        <xsl:sort select="region_name"/>
        <xsl:variable name="current_region_id"><xsl:value-of select="region_id"/></xsl:variable>
        <tr>
            <td>
                <input type="checkbox" name="region_id[]">
                    <xsl:attribute name="value">
                        <xsl:value-of select="region_id"/>
                    </xsl:attribute>
                </input>
            </td>
            <td>
                <a href="{//link_prefix}ifp-region-edit&amp;region_id={region_id}"
                class="basic-table-cell">
                <xsl:value-of select="region_name"/></a>
            </td>
            <td>
            Geographic
            </td>
            <td>
                <xsl:for-each select="//get_all_region_data">
                    <xsl:if test="$current_region_id=region_id">
                            <xsl:value-of select="name"/><xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td></tr>
        </xsl:for-each>
    </tbody>
</table>
</div>
</form>
<div style="float: right;" class="generic-button">
    <a href="{//link_prefix}ifp-region-edit">Add Region</a>
</div>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">myregions</xsl:with-param>
</xsl:call-template>
<input type="submit" value="{//labels/label[key='delete']/value}" name="submit"
    onclick="return confirm('Are you sure you want to delete these regions?')" />
</xsl:template>
</xsl:stylesheet>