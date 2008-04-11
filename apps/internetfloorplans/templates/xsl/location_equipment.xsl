<!--
Program: Internet Floor Plans
Component: location_equipment.xsl
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
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
	<form method="post"><xsl:attribute name="action">/<xsl:value-of select="//self"/></xsl:attribute>
	<input type="hidden" name="location_address_id"><xsl:attribute name="value"><xsl:value-of select="//_get/location_address_id"/></xsl:attribute></input>
    <xsl:call-template name="location_menu" />
	<xsl:call-template name="location_summary" />
    <table class="simple-table">
        <thead>
        <tr>
            <th>Equipment Type</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <xsl:for-each select="//equipment_types_get_all">
        <xsl:variable name="my_equipment_type_id"><xsl:value-of select="equipment_type_id"/></xsl:variable>
        <tr class="row{position() mod 2}">
            <td>
                <xsl:value-of select="name"/></td>
                <td><xsl:value-of select="count(//get_all_assets[equipment_type_id=$my_equipment_type_id])"/></td>
        </tr>
        </xsl:for-each>
        </tbody>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
