<!--
Program: Internet Floor Plans
Component: internetfloorplans.sql.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">
CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>container` (
  `container_id` int(11) NOT NULL auto_increment,
  `name` char(100) NOT NULL default '0',
  `comments` char(255) default NULL,
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `container_index` (`container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment` (
  `equipment_id` int(11) NOT NULL auto_increment,
  `equipment_number` char(100) default '-',
  `equipment_type_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `equipment_id` (`equipment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_container` (
  `equipment_id` int(11) NOT NULL auto_increment,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `equipment_type_container_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_content` (
  `equipment_id` int(11) NOT NULL default '0',
  `content_id` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `installed_id` int(11) NOT NULL default '0',
  `equipment_type_container_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_content_index` (`equipment_id`,`content_id`,`equipment_type_container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_type` (
  `equipment_type_id` int(11) NOT NULL auto_increment,
  `equipment_category_id` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '0',
  `description` varchar(255) default NULL,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  PRIMARY KEY  (`equipment_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_type_container` (
  `name` char(100) NOT NULL default '0',
  `equipment_type_id` int(11) NOT NULL default '0',
  `comments` char(255) default NULL,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `container_id` int(11) NOT NULL default '0',
  `x_origin` int(11) NOT NULL default '0',
  `y_origin` int(11) NOT NULL default '0',
  `equipment_type_container_id` int(11) default NULL,
  UNIQUE KEY `equipment_container_index` (`equipment_type_container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_type_images` (
  `equipment_type_image_id` int(11) NOT NULL auto_increment,
  `equipment_type_id` int(11) NOT NULL default '0',
  `default_image` int(11) default NULL,
  `name` char(100) NOT NULL default '-',
  `image_pointer` char(255) NOT NULL default '0',
  `thumb_pointer` char(255) default NULL,
  `mime_type` char(50) NOT NULL default '0',
  `comments` char(255) default '-',
  `height` int(11) NOT NULL default '0',
  `width` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `equipment_type_image_id` (`equipment_type_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>equipment_type_icon` (
  `equipment_type_icon_id` int(11) NOT NULL auto_increment,
  `equipment_type_id` int(11) NOT NULL default '0',
  `default_icon` int(11) NOT NULL default '0',
  `file_pointer` char(255) NOT NULL default '0',
  `comments` char(255) default '-',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `name` char(100) NOT NULL default '-',
  UNIQUE KEY `equipment_type_icon_id` (`equipment_type_icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>locations` (
  `location_id` int(11) NOT NULL auto_increment,
  `name` char(100) NOT NULL default '0',
  `address_line_1` char(100) NOT NULL default '',
  `address_line_2` char(100) default NULL,
  `address_line_3` char(100) default NULL,
  `city` char(100) NOT NULL default '',
  `state` char(100) NOT NULL default '',
  `zip` char(10) NOT NULL default '',
  `county` char(100) default '',
  `country_id` int(11) default '0',
  `phone` char(20) default NULL,
  `fax` char(20) default NULL,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_equipment` (
  `location_equipment_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `equipment_id` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `location_equipment_id` (`location_equipment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_equipment_position` (
  `location_equipment_position_id` int(11) NOT NULL auto_increment,
  `location_equipment_id` int(11) NOT NULL default '0',
  `x_position` int(11) NOT NULL default '0',
  `y_position` int(11) NOT NULL default '0',
  `x_scale` int(11) NOT NULL default '100',
  `y_scale` int(11) NOT NULL default '100',
  `rotation_angle` int(11) NOT NULL default '0',
  `alpha_transparency` int(11) NOT NULL default '100',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `location_equipment_position_id` (`location_equipment_position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_hours` (
  `location_hours_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `day_id` int(11) NOT NULL default '0',
  `open_time` time NOT NULL default '00:00:00',
  `close_time` time NOT NULL default '23:59:59',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  PRIMARY KEY  (`location_hours_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_images` (
  `location_image_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `default_image` int(11) default NULL,
  `name` char(100) NOT NULL default '-',
  `image_pointer` char(255) NOT NULL default '0',
  `thumb_pointer` char(255) default NULL,
  `mime_type` char(50) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `comments` char(255) default '-',
  `height` int(11) NOT NULL default '0',
  `width` int(11) NOT NULL default '0',
  PRIMARY KEY  (`location_image_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_region` (
  `region_id` int(11) NOT NULL default '0',
  `location_id` int(11) NOT NULL default '0',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `location_region_index` (`region_id`,`location_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>location_space_plan` (
  `location_space_plan_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `default_space_plan` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '-',
  `x_position` int(11) NOT NULL default '0',
  `y_position` int(11) NOT NULL default '0',
  `x_scale` int(11) NOT NULL default '100',
  `y_scale` int(11) NOT NULL default '100',
  `rotation_angle` int(11) NOT NULL default '0',
  `alpha_transparency` int(11) NOT NULL default '100',
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  `comments` longblob,
  `space_plan_pointer` varchar(255) NOT NULL default '0',
  `display_eqp_icons` varchar(15) NOT NULL default 'checked',
  `key_x_position` int(11) NOT NULL default '0',
  `key_y_position` int(11) NOT NULL default '0',
  `space_plan_locked` varchar(100) default 'false',
  UNIQUE KEY `location_space_plan_id` (`location_space_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;





CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>region` (
  `region_id` int(11) NOT NULL auto_increment,
  `region_name` text,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  UNIQUE KEY `region_id` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>static_files` (
  `static_file_id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NULL,
  `type` varchar(100) NULL,
  `basename` varchar(100) NULL,
  `file_system_path` varchar(100) NULL,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  PRIMARY KEY `static_file_index` (`static_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>static_file_metadata` (
  `static_file_id` int(11) NOT NULL auto_increment,
  `meta_key` varchar(100) NULL,
  `meta_value` varchar(100) NULL,
  PRIMARY KEY `static_file_index` (`static_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>options` (
  `option_id` int(11) NOT NULL auto_increment,
  `option_key` char(100) NULL,
  `option_value` char(100) NULL,
  `creation_timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `modification_datetime` datetime NULL,
  PRIMARY KEY `option_index` (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `ifp_equipment_container`
-- 
ALTER TABLE `ifp_equipment_container`
  ADD CONSTRAINT `ifp_equipment_container_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `ifp_equipment` (`equipment_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- 
-- Constraints for table `ifp_location_images`
-- 
ALTER TABLE `ifp_location_images`
  ADD CONSTRAINT `ifp_location_images_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `ifp_locations` (`location_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
</xsl:template>
</xsl:stylesheet>
