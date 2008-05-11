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
<xsl:include href="main.xsl"/>
<xsl:template name="content">
<form method="post">
<table class="simpletable">
    <tr>
        <th>
            <xsl:value-of select="//labels/label[key='equip_name']/value"/>
        </th>
        <th>
            <xsl:value-of select="//labels/label[key='description']/value"/>

        </th>
        <th>
            <xsl:value-of select="//labels/label[key='edit']/value"/>

        </th>
        <th>
            <xsl:value-of select="//labels/label[key='delete']/value"/>
        </th>
    </tr>
    <xsl:for-each select="//container_types_get_all">
    <tr class="row{position() mod 2}">
        <td>
            <a href="{//link_prefix}edit&amp;container_id={container_id}">
                <xsl:value-of select="name"/>
            </a>
        </td>
        <td>
            <xsl:value-of select="description"/>
        </td>
        <td>
            <a href="{//link_prefix}edit&amp;container_id={container_id}">
                Edit
            </a>
        </td>
        <td>
            <a href="{//link_prefix}delete&amp;container_id={container_id}" 
                onclick="return confirm('Are you sure you want to delete this container type?')">
                Delete
            </a>
        </td>
    </tr>
    </xsl:for-each>
    <tr>
        <td align="left" colspan="4">
            <input type="button" value="New" onclick="document.location.href='edit'"/>
        </td>
    </tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
