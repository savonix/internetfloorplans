<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: location_view.xsl
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
    <script type="text/javascript">
    var question = 'Are you sure you want to delete this image?';
    function location_image_delete(location_image_id) {
        if(confirm(question)) { 
            $.post("<xsl:value-of select="$link_prefix"/>x-location-image-delete", {'location_image_id': location_image_id},
            function (data){
                $("#li_"+location_image_id).remove();
                $("#delete_image").remove();
                $("#add_new_image").css("display","block");
            });
        }
    }
    </script>
    <form method="post">
      <input type="hidden" name="location_id" value="{//_get/location_id}"/>

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

      <table>
        <tr>
          <td>
            <table class="simple-table">
              <tr>
                <td>
                  <xsl:value-of select="$i18n/virtual_tours"/>
                </td>
              </tr>
              <xsl:for-each select="//get_location_images">
                <tr>
                  <td>
                    <xsl:value-of select="name"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
            <table class="simple-table">
              <thead>
                <tr>
                  <th>
                    <xsl:value-of select="$i18n/tour_options"/>
                  </th>
                </tr>
              </thead>
              <tr id="add_new_image">
                <xsl:if test="//location_image_id"><xsl:attribute name="style">display:none</xsl:attribute></xsl:if>
                <td>
                  <a href="{$link_prefix}ifp-location-image-edit&amp;location_id={//_get/location_id}">
                    <xsl:value-of select="$i18n/add_new_image"/>
                  </a>
                </td>
              </tr>
              <xsl:if test="//location_image_id">
                <tr id="delete_image">
                  <td>
                    <a href="#{//get_location_images[1]/location_image_id}"
                      onclick="location_image_delete({//get_location_images[1]/location_image_id});">
                      <xsl:value-of select="$i18n/delete"/>&#160;
                      <xsl:value-of select="$i18n/this_image"/>
                    </a>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </td>
          <xsl:variable name="image_id">
            <xsl:if test="//_get/location_image_id">
              <xsl:value-of select="//_get/location_image_id"/>
            </xsl:if>
            <xsl:if test="not(//_get/location_image_id)">
              <xsl:value-of select="//get_location_images[1]/location_image_id"/>
            </xsl:if>
          </xsl:variable>
          <td align="left">
            <table>
              <tr>
                <td>
                  <xsl:value-of
                    select="//get_location_images[location_image_id=$image_id]/name"/>
                </td>
              </tr>
              <tr id="li_{$image_id}">
                <td>
                  <div style="padding:10px">
                  <xsl:if test="contains(//get_location_images[location_image_id=$image_id]/image_pointer,'.jpg')">
                  <img src="{//get_location_images[location_image_id=$image_id]/image_pointer}"/>
                  </xsl:if>
                  <xsl:if test="not(contains(//get_location_images[location_image_id=$image_id]/image_pointer,'.jpg'))">
                  <a href="{//get_location_images[location_image_id=$image_id]/image_pointer}.jpg" class="thickbox">
                    <img src="{//get_location_images[location_image_id=$image_id]/image_pointer}.mini.jpg"/>
                  </a>
                  </xsl:if>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </form>
  </xsl:template>
</xsl:stylesheet>
