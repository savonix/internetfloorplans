<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
  <xsl:include href="html_main.xsl"/>
  <xsl:include href="location_summary.xsl"/>
  <xsl:include href="location_menu.xsl"/>
  <xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
      <xsl:call-template name="location_menu">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$i18n"/>
      </xsl:call-template>

      <xsl:call-template name="location_summary">
        <xsl:with-param name="link_prefix" select="$link_prefix"/>
        <xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$i18n"/>
      </xsl:call-template>
    <script type="text/javascript">
    var question = '<xsl:value-of select="$i18n/delete_plan"/>';
    function location_space_plan_delete(location_space_plan_id) {
        if(confirm(question+" "+location_space_plan_id+"?")) {
            $.post("<xsl:value-of select="$link_prefix"/>ifp-location-space-plan-delete&amp;location_space_plan_id="+location_space_plan_id,
                {'location_space_plan_id': location_space_plan_id},
            function (data){
            });
        }
    }
    </script>
            <!--
            <br/>
            [ PDF Not Available ] / [ PDF ]
            
            [ <a onclick="return confirm('Are you sure you want to delete this location space plan?')">><xsl:value-of select="$i18n/delete"/> This Plan</a> ]
            
            <xsl:if test="//_get/key='no'">
            
            [ <a href="{//request_uri}&amp;key=yes">Show Icons</a> ] 
            </xsl:if>
            
            <xsl:if test="//_get/key='yes' or not(//_get/key)">
            [ <a>Hide Icons</a> ]
            </xsl:if>
            
            [ <a>Debug SWF</a> ]
            -->

    <xsl:if test="//defaults/use_interactive_space_plans='no'">
    <xsl:if test="//get_location_space_plans/location_space_plan_id">
      <div id="space_plan_spot" style="width:640px;height:640px;background: #fff url(http://www.internetfloorplans.com/demo/s/img/20071116_floor-plan.gif) no-repeat scroll left top;">
        <!-- Show static jpg here when the visitor does not have the flash plugin. -->
        hello
      </div>
    </xsl:if>
    </xsl:if>

      <!--
      SVG
      <object data="200907_space_plans.svg" width="640" height="480" type="image/svg+xml"/>
      -->

      <xsl:if test="//defaults/use_interactive_space_plans='yes'">
      <div id="space_plan_spot">
      </div>
      <script type="text/javascript">
      $(document).ready(function(){
          $('#space_plan_spot').flash({
              src: "<xsl:value-of select="$link_prefix"/>ifp-location-space-plan-swf-server&amp;location_id=1&amp;key=yes",
              width: 825,
              height: 825
          });
      });
      </script>
      </xsl:if>
      
    <xsl:value-of select="$i18n/space_plan_options"/>:
      <xsl:if test="not(//get_location_space_plans/location_space_plan_id)">
        <a href="{$link_prefix}ifp-location-space-plan-edit&amp;location_id={//_get/location_id}">
          <xsl:value-of select="$i18n/add_new_plan"/>
        </a>
      </xsl:if>
      <xsl:if test="//get_location_space_plans/location_space_plan_id">
        <a href="{$link_prefix}location_space_plan-delete&amp;location_space_plan_id={//get_location_space_plans/location_space_plan_id}" onclick="location_space_plan_delete({//get_location_space_plans/location_space_plan_id}); return false;">
          <xsl:value-of select="$i18n/delete_plan"/>
        </a>
      </xsl:if>
  </xsl:template>
</xsl:stylesheet>
