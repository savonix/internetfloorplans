<!--
Program: Internet Floor Plans
Component: location_menu.xsl
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
<xsl:template name="location_menu">
<table class="simple-table">
    <tr>
        <td>
            <xsl:value-of select="//location_get_summary/name"/>
        </td>
        <td>
            <a href="{//link_prefix}ifp-location-space-plans&amp;location_id={//_get/location_id}">
            <xsl:value-of select="//labels/label[key='space_plans']/value"/>
            </a>
        </td>
        <td>
            <a href="{//link_prefix}ifp-location-view&amp;location_id={//_get/location_id}">
                <xsl:value-of select="//labels/label[key='virtual_tours']/value"/>
            </a>
        </td>
        <td>
            <a href="{//link_prefix}ifp-location-equipment-quantities&amp;location_id={//_get/location_id}">
                <xsl:value-of select="//labels/label[key='equip_quantities']/value"/>
            </a>
        </td>
        <td>
            <a href="{//link_prefix}ifp-location-equipment-list&amp;location_id={//_get/location_id}">
                <xsl:value-of select="//labels/label[key='equip_list']/value"/>
            </a>
        </td>
    </tr>
</table>
</xsl:template>
</xsl:stylesheet>
