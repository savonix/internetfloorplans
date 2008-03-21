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
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes" encoding="UTF-8" />
<xsl:template match="/">
<html>
<head>
<title>Image Viewer</title>
<style>

.dragme{position:relative;}

</style>

<script language="JavaScript1.2" src="/resources/js/dragme.js"/>


 </head>
<body>


<img class="dragme"><xsl:attribute name="src">/file_server/&amp;pointer=<xsl:value-of select="//_get/pointer"/>&amp;mime_type=<xsl:value-of select="//_get/mime_type"/>&amp;type=photography</xsl:attribute></img>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
