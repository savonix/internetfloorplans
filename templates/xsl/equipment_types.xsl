<!--
Program: Internet Floor Plans
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:template name="content">
	<table class="simple-table">
	<thead>
    <tr>
        <th>Equipment Type Name</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <xsl:for-each select="//equipment_types_get_all">
    <tr class="row{position() mod 2}">
        <td>
            <a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">
                <xsl:value-of select="name"/>
            </a>
        </td>
        <td>
            <xsl:value-of select="description"/>
        </td>
        <td>
            <a href="{//link_prefix}ifp-equipment-type-edit&amp;equipment_type_id={equipment_type_id}">Edit</a></td>
        <td>
            <a href="{//link_prefix}ifp-equipment-type-delete&amp;equipment_type_id={equipment_type_id}" 
            onclick="return confirm('Are you sure you want to delete this equipment type?')">Delete</a></td>
    </tr>
    </xsl:for-each>
    </tbody>
	</table>
    <a href="{//link_prefix}ifp-equipment-type-edit">New Equipment Type</a>
</xsl:template>
</xsl:stylesheet>
