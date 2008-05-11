<!--
Program: Internet Floor Plans
Component: region_view.xsl
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
<xsl:include href="main.xsl"/>
<xsl:template name="content">
<form method="post">
<input type="hidden" name="region_id" value="{//_get/region_id}"/>
    <table>
    <tr>
    <td>Region Name:</td>
    <td>
        <input type="text" name="name" value="{//get_region_name_g/region_name}"/>
    </td>
    </tr>
    <tr>
    <td>
        Locations:
    </td>
    <td>
<table>
<xsl:for-each select="//locations_get_all" >
<tr><td><input type="checkbox" name="location_address_id[]" value="{location_address_id}"> 
    <xsl:variable name="current_id"><xsl:value-of select="//location_address_id"/></xsl:variable>
    <xsl:for-each select="//get_region_data">
        <xsl:if test="$current_id=//get_region_data/location_address_id">
            <xsl:attribute name="checked">true</xsl:attribute>
        </xsl:if>
    </xsl:for-each>
</input>
</td>
<td><xsl:value-of select="name"/></td></tr>
</xsl:for-each>
</table>
</td>
        </tr>
    </table>
<input type="submit" value="Update" name="submit"/>
</form>
</xsl:template>
</xsl:stylesheet>
