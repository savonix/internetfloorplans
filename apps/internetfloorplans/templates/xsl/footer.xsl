<!--
Program: Internet Floor Plans
Component: footer.xsl
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
<xsl:template name="footer">
<div id="footer">
<a href="http://www.internetfloorplans.com/blog/">
    <xsl:value-of select="//labels/label[key='open_source_internet_software']/value"/>
</a>.
<a href="http://www.internetfloorplans.com/trac/browser/?rev={//svn_revision}">Revision ~ <xsl:value-of select="//svn_revision"/></a>
<xsl:value-of select="//labels/label[key='copyright']/value"/>.

<a href="{//link_prefix}ifp-iframe-viewer&amp;url=license">
    <xsl:value-of select="//labels/label[key='license']/value"/>
</a>.
</div>
</xsl:template>
</xsl:stylesheet>