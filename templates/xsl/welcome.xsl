<!--
Program: Internet Floor Plans
Component: welcome.xsl
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
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<html xml:space="preserve" >
	<table>
		<tr>
			<td>
				Welcome to UpLink!<br/><br/>
				<img src="{//link_prefix}/s/img/map.gif" />
				<br/><br />
				With UpLink you can access in-depth information about all of your locations. 
<br/><br/>
Need to know the branch manager's name and contact information for your Webster Street branch? Are there new brochure holders in the Eastern Region that you need to keep track of?
<br/><br/>
UpLink provides users with these answers and many other features that improve branch management efficiency. Browse through all of UpLink's features by selecting an option in the menu on the left side of the screen.
				<br/>
			</td>
		</tr>
	</table>
</html>
</xsl:template>
</xsl:stylesheet>
