<!--
Program: Internet Floor Plans
Component: options.xsl
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
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<form method="post" action="{//request_uri}&amp;view_flow=true">
<table>
<xsl:for-each select="//ifp_options/option">
    <xsl:variable name="my_option"><xsl:value-of select="option_key"/></xsl:variable>
    <tr>
        <td><xsl:value-of select="//labels/label[key=$my_option]/value"/>: </td>
        <td><input type="text" name="{option_key}" value="{//option_get[option_key=$my_option]/option_value}"/></td>
    </tr>
</xsl:for-each>
</table>
<input type="submit"/>
</form>
</xsl:template>
</xsl:stylesheet>