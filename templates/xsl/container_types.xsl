<!--
Program: Internet Floor Plans
Component: container_types.xsl
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
	<form method="post">
	<table>
    	<tr>
            <td>Equipment Type Name</td>
            <td>Description</td>
            <td>
                Edit</td>
            <td>
                Delete</td>
        </tr>
        <xsl:for-each select="//get_container_types">
        <tr class="row{position() mod 2}">
            <td>
                <a href="{//link_prefix}edit/&amp;container_id={container_id}"><xsl:value-of select="name"/></a>
            </td>
            <td>
                <xsl:value-of select="description"/>
            </td>
            <td>
                <a href="{//link_prefix}edit/&amp;container_id={container_id}">Edit</a></td>
            <td>
                <a href="{//link_prefix}delete/&amp;container_id={container_id}" onclick="return confirm('Are you sure you want to delete this container type?')">Delete</a></td>
        </tr>
        </xsl:for-each>
        <tr><td align="left" colspan="4">
        <table cellpadding="15" >
            <tr>
                <td>
                <input type="button" value="New"><xsl:attribute name="onclick">document.location.href='edit/'</xsl:attribute>
                </input>
                </td>
            </tr>
        </table>
	</td></tr>
	</table>
	</form>
</xsl:template>
</xsl:stylesheet>
