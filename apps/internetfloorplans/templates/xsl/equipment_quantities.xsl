<!--
Program: Internet Floor Plans
Component: equipment_quantities.xsl
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
<xsl:include href="html_main.xsl"/>
<xsl:include href="equipment_menu.xsl"/>

<xsl:template name="content">
<xsl:call-template name="equipment_menu" />
<table class="simple-table">
    <tr>
        <td>
            <xsl:value-of
                select="/_R_/i18n/equipment_type"
                />
        </td>
        <td>
            <xsl:value-of
                select="/_R_/i18n/quantity"
                />
        </td>
    </tr>
    <xsl:for-each select="/_R_/equipment_types_get_all/equipment_types_get_all">
        <xsl:variable name="my_equipment_type_id">
            <xsl:value-of select="equipment_type_id"/>
        </xsl:variable>
        <tr>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:value-of
                    select="
                        count(
                            //equipment_get_all[
                                equipment_type_id=$my_equipment_type_id
                                ]
                            )"
                    />
            </td>
        </tr>
    </xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
