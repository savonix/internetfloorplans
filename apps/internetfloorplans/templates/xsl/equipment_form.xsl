<!--
Program: Internet Floor Plans - http://www.internetfloorplans.com/
Component: equipment_form.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="html_main.xsl"/>
  <xsl:template name="content">
    <form method="post">
      <input type="hidden" value="1" name="quantity"/>
    <!--
        Is this form editing an exiting piece of equipment?
    -->
      <xsl:if test="//_get/equipment_id">
        <input type="hidden" name="location_id" value="{//_get/location_id}" />
        <input type="hidden" name="equipment_type_id" value="{//equipment_get_by_id/equipment_type_id}" />
        <input type="hidden" name="equipment_number" value="{//equipment_get_by_id/equipment_number}" />
        <input type="hidden" name="equipment_id" value="{//_get/equipment_id}" />
        <input type="hidden" name="type" value="edit" />
      </xsl:if>
			
      <xsl:if test="not(//_get/equipment_id)">
        <input type="hidden" name="type" value="new"/>
      </xsl:if>
			
      <table>
        <tr>
          <td>
            <xsl:value-of select="//equipment_number" />
          </td>
          <td>
            <xsl:if test="//_get/equipment_id">
              <xsl:value-of select="//equipment_get_by_id/equipment_number" />
            </xsl:if>
            <xsl:if test="not(//_get/equipment_id)">
              <input type="text" name="equipment_number" value="{//equipment_get_by_id/equipment_number}" />
            </xsl:if>
          </td>
					
          <td rowspan="6">
            <xsl:if test="//_get/equipment_id">
              <img src="{//equipment_get_by_id/image_pointer}" />
            </xsl:if>
          </td>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="//equipment_type" />
          </td>

            <!-- Existing equipment type cannot be changed -->
          <xsl:if test="//_get/equipment_id">
            <td>
              <xsl:value-of select=" //equipment_types_get_all[ equipment_type_id= //equipment_get_by_id/equipment_type_id ]/name" />
            </td>
          </xsl:if>

            <!-- Choose equipment type. -->
          <xsl:if test="not(//_get/equipment_id)">
            <td>
              <select name="equipment_type_id">
                <xsl:for-each select="//equipment_types_get_all">
                  <option value="{equipment_type_id}">
                    <xsl:if test=" equipment_type_id= //equipment_get_by_id/equipment_type_id ">
                      <xsl:attribute name="selected">
                                    selected
                                </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="name"/>
                  </option>
                </xsl:for-each>
              </select>
            </td>
          </xsl:if>
        </tr>
        <tr>
          <td>
            <xsl:value-of select="/_R_/i18n/location" />
          </td>
          <td>
            <xsl:if test="//_get/equipment_id">
              <xsl:value-of select=" //locations_get_all[ location_id=//equipment_get_by_id/location_id ]/name" />
            </xsl:if>
            <xsl:if test="not(//_get/equipment_id)">
              <select name="location_id">
                <xsl:for-each select="//locations_get_all">
                  <option value="{location_id}">
                    <xsl:if test=" location_id= //equipment_get_by_id/location_id ">
                      <xsl:attribute name="selected">
                                    selected
                                </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="name"/>
                  </option>
                </xsl:for-each>
              </select>
            </xsl:if>
          </td>
        </tr>
      </table>
      <div>
        <input type="submit" value="Submit" name="submit"/>
        <input type="button" value="Cancel" onclick="history.go(-1);"/>
      </div>
    </form>
  </xsl:template>
</xsl:stylesheet>
