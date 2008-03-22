<!--
Program: Internet Floor Plans
Component: location_space_plan.xsl
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
<xsl:import href="location_summary.xsl"/>
<xsl:import href="location_menu.xsl"/>
<xsl:template name="content">
<xsl:call-template name="location_menu" />
<xsl:call-template name="location_summary" />
<table >
    <tr>
        <td colspan="2">
            <b>Space Plan Options</b> : 
            <a href="#">Add New Plan</a> - 
            <a href="#">Unlock This Plan</a>
            <br/>
            [ PDF Not Available ] / [ PDF ]
            
            [ <a onclick="return confirm('Are you sure you want to delete this location space plan?')">>Delete This Plan</a> ]
            
            <xsl:if test="//_get/key='no'">
            
            [ <a href="{//request_uri}&amp;key=yes">Show Icons</a> ] 
            </xsl:if>
            
            <xsl:if test="//_get/key='yes' or not(//_get/key)">
            [ <a>Hide Icons</a> ]
            </xsl:if>
            
            [ <a>Debug SWF</a> ]
            
        </td>
    </tr>
    <tr>
        <td valign="top" colspan="2">
<script type="text/javascript" src="/resources/js/swfobject.js"></script>
<div id="space_plan">
<!-- Show static jpg here when the visitor does not have the flash plugin. -->

</div>
        
<script type="text/javascript" defer="defer">
<!-- {//_get/location_address_id} -->
var mymoviestring = "ifp-location-space-plan-server&amp;location_space_plan_id=<xsl:value-of select="//get_location_space_plans/location_space_plan_id"/>&amp;location_address_id=<xsl:value-of select="//_get/location_address_id"/>&amp;key=<xsl:value-of select="//_get/key"/>";
var so = new SWFObject(mymoviestring, "mymovie", "825", "825", "8","#FFFFFF");
so.write("space_plan");
</script>
        
        </td>
    </tr>



</table>

</xsl:template>
</xsl:stylesheet>
