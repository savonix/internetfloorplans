
CREATE TABLE IF NOT EXISTS `ifp_container` (
  `container_id` int(11) NOT NULL auto_increment,
  `name` char(100) NOT NULL default '0',
  `comments` char(255) default NULL,
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `container_index` (`container_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_equipment` (
  `equipment_id` int(11) NOT NULL auto_increment,
  `asset_id` char(100) default '-',
  `equipment_type_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `equipment_id` (`equipment_id`,`creation_datetime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `ifp_equipment_category` (
  `equipment_category_id` int(11) NOT NULL default '0',
  `name` char(100) NOT NULL default '0',
  `description` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `equipment_category_id` (`equipment_category_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_equipment_container` (
  `equipment_id` int(11) NOT NULL auto_increment,
  `business_line_id` int(11) NOT NULL default '0',
  `priority_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `equipment_type_container_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_equipment_content` (
  `equipment_id` int(11) NOT NULL default '0',
  `content_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `installed_id` int(11) NOT NULL default '0',
  `equipment_type_container_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_content_index` (`equipment_id`,`content_id`,`equipment_type_container_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_equipment_type` (
  `equipment_type_id` int(11) NOT NULL auto_increment,
  `equipment_category_id` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '0',
  `description` varchar(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  PRIMARY KEY  (`equipment_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;


CREATE TABLE IF NOT EXISTS `ifp_equipment_type_container` (
  `name` char(100) NOT NULL default '0',
  `equipment_type_id` int(11) NOT NULL default '0',
  `comments` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `container_id` int(11) NOT NULL default '0',
  `x_origin` int(11) NOT NULL default '0',
  `y_origin` int(11) NOT NULL default '0',
  `equipment_type_container_id` int(11) default NULL,
  `default_priority_id` int(11) NOT NULL default '0',
  `default_business_line_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_container_index` (`equipment_type_container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_equipment_type_images` (
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
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `equipment_type_image_id` (`equipment_type_image_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_equipment_type_symbol` (
  `equipment_type_symbol_id` int(11) NOT NULL auto_increment,
  `equipment_type_id` int(11) NOT NULL default '0',
  `default_symbol` int(11) NOT NULL default '0',
  `symbol_pointer` char(255) NOT NULL default '0',
  `comments` char(255) default '-',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `name` char(100) NOT NULL default '-',
  `mime_type` char(50) NOT NULL default 'application/x-shockwave-flash',
  UNIQUE KEY `equipment_type_symbol_id` (`equipment_type_symbol_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_locations` (
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
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_id` (`location_id`,`creation_datetime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `ifp_location_categories` (
  `location_category_id` int(11) NOT NULL default '0',
  `location_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_category_id` (`location_category_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_location_category_types` (
  `location_category_type_id` int(11) NOT NULL default '0',
  `location_category_type_group_id` int(11) NOT NULL default '0',
  `name` char(100) default NULL,
  `description` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_category_type_id` (`location_category_type_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `ifp_location_equipment` (
  `location_equipment_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `equipment_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_id` (`location_equipment_id`,`creation_datetime`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;



CREATE TABLE IF NOT EXISTS `ifp_location_equipment_position` (
  `location_equipment_position_id` int(11) NOT NULL auto_increment,
  `location_equipment_id` int(11) NOT NULL default '0',
  `x_position` int(11) NOT NULL default '0',
  `y_position` int(11) NOT NULL default '0',
  `x_scale` int(11) NOT NULL default '100',
  `y_scale` int(11) NOT NULL default '100',
  `rotation_angle` int(11) NOT NULL default '0',
  `alpha_transparency` int(11) NOT NULL default '100',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_position_id` (`location_equipment_position_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_location_equipment_status` (
  `location_equipment_status_id` int(11) NOT NULL default '0',
  `location_equipment_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_status_id` (`location_equipment_status_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `ifp_location_hours` (
  `location_hours_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `day_id` int(11) NOT NULL default '0',
  `open_time` time NOT NULL default '00:00:00',
  `close_time` time NOT NULL default '23:59:59',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  PRIMARY KEY  (`location_hours_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_location_images` (
  `location_image_id` int(11) NOT NULL auto_increment,
  `location_id` int(11) NOT NULL default '0',
  `default_image` int(11) default NULL,
  `name` char(100) NOT NULL default '-',
  `image_pointer` char(255) NOT NULL default '0',
  `thumb_pointer` char(255) default NULL,
  `mime_type` char(50) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `comments` char(255) default '-',
  `height` int(11) NOT NULL default '0',
  `width` int(11) NOT NULL default '0',
  PRIMARY KEY  (`location_image_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_location_region` (
  `region_id` int(11) NOT NULL default '0',
  `location_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_region_index` (`region_id`,`location_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_location_space_plan` (
  `location_space_plan_id` int(11) NOT NULL default '0',
  `location_id` int(11) NOT NULL default '0',
  `default_space_plan` int(11) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '-',
  `x_position` int(11) NOT NULL default '0',
  `y_position` int(11) NOT NULL default '0',
  `x_scale` int(11) NOT NULL default '100',
  `y_scale` int(11) NOT NULL default '100',
  `rotation_angle` int(11) NOT NULL default '0',
  `alpha_transparency` int(11) NOT NULL default '100',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `comments` longblob,
  `space_plan_pointer` varchar(255) NOT NULL default '0',
  `display_eqp_icons` varchar(15) NOT NULL default 'checked',
  `key_x_position` int(11) NOT NULL default '0',
  `key_y_position` int(11) NOT NULL default '0',
  `space_plan_locked` varchar(100) default 'false',
  UNIQUE KEY `location_space_plan_id` (`location_space_plan_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_location_status` (
  `location_status_id` int(11) NOT NULL default '0',
  `location_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_status_id` (`location_status_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `ifp_region` (
  `region_id` int(11) NOT NULL auto_increment,
  `region_name` text,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `region_id` (`region_id`,`creation_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `ifp_options` (
  `option_id` int(11) NOT NULL auto_increment,
  `option_key` char(100) NULL,
  `option_value` char(100) NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
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

