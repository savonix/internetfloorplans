<!--
Program: Internet Floor Plans
Component: layout.css.xsl
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
<xsl:template name="layout">
#main {
    text-align: left;
    margin-left: auto;
    margin-right: auto;
}
#page {
    padding: .5em;
    margin-left: auto;
    margin-right: auto;
	background: #FFF;
}
#content {
    margin: .5em;
    min-height: 12em;
}
#header {
    padding: .5em;
}

#footer {
  position: absolute;
  bottom: 2px;
    text-align: center;
}

.simple-table {
    border-spacing: 1px;
    width: 100%;
    margin-bottom: 1em;
    border-spacing: 1;
    border-collapse: separate;
}

.simple-table td {
    padding: .5em;
}

.simple-table thead th {
    padding: .5em;
}

.generic-button {
    text-align: center;
    margin-left: .5em;
}

.generic-button a {
    padding: .3em .5em .3em .5em;
    border: 2px;
    border-style: solid;
    text-align: center;
}

.generic-button img {
    margin-bottom: -4px;
    margin-right: 6px;
}

a.generic-button {
    padding: .3em .5em .3em .5em;
    border: 2px;
    border-style: solid;
    text-align: center;
}
#nav li div {
  padding: 2px 8px;
  cursor: pointer;
}
</xsl:template>
</xsl:stylesheet>
