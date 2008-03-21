<!--
Program: Internet Floor Plans
Component: 
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="svn://main.xsl"/>

<xsl:template name="content">
	<form action="{self}" method="post">
	<table border='0' cellspacing='1' cellpadding='5' bgcolor="#FFFFFF">
		<tr>
			<td align="left">
				<img src="/resources/img/tetris.png" /> 
				
			</td>
		</tr>
	</table>
	<font class="three">
	<table border='0' cellspacing='0' cellpadding='2' bgcolor="#BBBBBB" width='100%'>
	<tr>	
				<td width="150" bgcolor="#FFFFFF"><font class='two'><b>Department Name</b></font></td>
				<td width="150" bgcolor="#FFFFFF"><font class='two'><b>Description</b></font></td>
			<td bgcolor="#FFFFFF">
				<font class="two"><b>Edit</b></font></td>
			<td bgcolor="#FFFFFF">
				<font class="two"><b>Delete</b></font></td>
	</tr>
			<xsl:for-each select="//get_asset_categories">
			<tr class="row{position() mod 2}">
				<td>
					<font class="two"><xsl:value-of select="name"/></font>
				</td>
				<td>
					<font class="two"><xsl:value-of select="description"/></font>
				</td>
			<td>
				<font class="one"><a href="/acc/link/depts/edit/&amp;equipment_category_id={equipment_category_id}">Edit</a></font></td>
			<td>
				<font class="one"><a href="/acc/link/depts/delete/&amp;equipment_category_id={equipment_category_id}" onclick="return confirm('Are you sure you want to delete this department?')">Delete</a></font></td>
			</tr>
			</xsl:for-each>
			
			<tr><td align="left" bgcolor="#FFFFFF" colspan="4">
			<table cellpadding="15" bgcolor="#FFFFFF">
				<tr>
					<td>
					<input type="button" value="New"><xsl:attribute name="onclick">document.location.href='edit/'</xsl:attribute>
					</input>
					</td>
				</tr>
			</table>
	</td></tr>
	</table>
	</font>
	</form>

</xsl:template>
</xsl:stylesheet>
