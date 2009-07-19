<!--
Program: Internet Floor Plans
Component: colors.css.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="colors">

body {
	background: #fff;
}

#page {
	background: #FFF;
}

#header h1 {
  color: <xsl:value-of select="//option_get[option_key='link_color']/option_value"/>;
}

a {
    color: green;
}
a {
    color: <xsl:value-of select="//option_get[option_key='link_color']/option_value"/>;
}

.simple-table {
    background-color: #CCC;
}

.simple-table td {
    background-color: #FFF;
}

.simple-table thead th {
    background-color: #EEE;
}

.generic-button a {
    border-color: #BBB;
}

a.generic-button {
    border-color: #BBB;
}



/* Click Menu */
div.cmDiv
{
	border-color: <xsl:value-of select="//option_get[option_key='link_color']/option_value"/>;
	background-color: <xsl:value-of select="/_R_/css/colors/light-background"/>;
}
.clickMenu
{
	background-color: <xsl:value-of select="/_R_/css/colors/light-background"/>;
}
.clickMenu ul
{
	border-color: <xsl:value-of select="//option_get[option_key='link_color']/option_value"/>;
	background-color: <xsl:value-of select="/_R_/css/colors/light-background"/>;
}
.clickMenu ul li
{
	background-color: <xsl:value-of select="/_R_/css/colors/light-background"/>;
}
.clickMenu li.main
{
	background-color: <xsl:value-of select="/_R_/css/colors/light-background"/>;
}
.clickMenu li.hover
{
	background-color: <xsl:value-of select="/_R_/css/colors/light-background-alt"/>;
}

/* end click menu */
</xsl:template>
</xsl:stylesheet>
