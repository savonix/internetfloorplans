<!--
Program: Internet Floor Plans
Component: equipment_content_install.xsl
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
<input type="hidden" name="equipment_id" value="{//_post/equipment_id}"/>
<table>
    <tr>
        <td>
        Please select the appropriate response based upon the results of these campaign instructions: 
        <br/><br/>
        <table>
            <tr>
                <td>
                    <input type="radio" name="response" value="success" checked="checked"/>
                </td>
                <td>The materials have been successfully installed. Please select this option only if you have already installed the materials as prescribed by these instructions.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="never"/>
                </td>
                <td>Never received the materials.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="replace"/>
                </td>
                <td>Received materials but need replacements.</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="response" value="impossible"/>
                </td>
                <td>The fixture is not there.</td>
            </tr>
        </table>
            
        </td>
        <td>
            <iframe name="config" id="config" height="525">
            
            &#160;
            </iframe>
        </td>

    </tr>

    
    <tr>
        <td colspan="2" align="center">
        <input type="submit" value="Submit" name="submit" />
        </td>
    </tr>
</table>
</form>
</xsl:template>
</xsl:stylesheet>
