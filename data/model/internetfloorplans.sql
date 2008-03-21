--
-- Table structure for table `uplink_container`
--

CREATE TABLE IF NOT EXISTS `uplink_container` (
  `container_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `name` char(100) NOT NULL default '0',
  `comments` char(255) default NULL,
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `container_index` (`container_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment` (
  `equipment_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `asset_id` char(100) default '-',
  `equipment_type_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `business_line_id` int(11) NOT NULL default '0',
  `priority_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_id` (`equipment_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_category`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_category` (
  `equipment_category_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `name` char(100) NOT NULL default '0',
  `description` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `equipment_category_id` (`equipment_category_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_container`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_container` (
  `equipment_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `business_line_id` int(11) NOT NULL default '0',
  `priority_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `equipment_type_container_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_container_id` (`equipment_type_container_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_content`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_content` (
  `equipment_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '0',
  `content_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `installed_id` int(11) NOT NULL default '0',
  `equipment_type_container_id` int(11) NOT NULL default '0',
  UNIQUE KEY `equipment_content_index` (`equipment_id`,`content_id`,`equipment_type_container_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_type`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_type` (
  `equipment_type_id` int(11) NOT NULL default '0',
  `equipment_category_id` int(11) NOT NULL default '0',
  `account_id` text,
  `name` varchar(100) NOT NULL default '0',
  `description` varchar(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `equipment_type_id` (`equipment_type_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_type_container`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_type_container` (
  `account_id` char(100) NOT NULL default '-',
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_type_images`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_type_images` (
  `equipment_type_image_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_equipment_type_symbol`
--

CREATE TABLE IF NOT EXISTS `uplink_equipment_type_symbol` (
  `equipment_type_symbol_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `equipment_type_id` int(11) NOT NULL default '0',
  `default_symbol` int(11) NOT NULL default '0',
  `symbol_pointer` char(255) NOT NULL default '0',
  `comments` char(255) default '-',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  `name` char(100) NOT NULL default '-',
  `mime_type` char(50) NOT NULL default 'application/x-shockwave-flash',
  UNIQUE KEY `equipment_type_symbol_id` (`equipment_type_symbol_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_address`
--

CREATE TABLE IF NOT EXISTS `uplink_locations` (
  `location_address_id` int(11) NOT NULL default '0',
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
  UNIQUE KEY `location_address_id` (`location_address_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_categories`
--

CREATE TABLE IF NOT EXISTS `uplink_location_categories` (
  `location_category_id` int(11) NOT NULL default '0',
  `location_address_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `category_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_category_id` (`location_category_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_category_types`
--

CREATE TABLE IF NOT EXISTS `uplink_location_category_types` (
  `location_category_type_id` int(11) NOT NULL default '0',
  `location_category_type_group_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `name` char(100) default NULL,
  `description` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_category_type_id` (`location_category_type_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_category_type_groups`
--

CREATE TABLE IF NOT EXISTS `uplink_location_category_type_groups` (
  `location_category_type_group_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `name` char(100) default NULL,
  `description` char(255) default NULL,
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_category_type_group_id` (`location_category_type_group_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_equipment`
--

CREATE TABLE IF NOT EXISTS `uplink_location_equipment` (
  `location_equipment_id` int(11) NOT NULL default '0',
  `location_address_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `equipment_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_id` (`location_equipment_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_equipment_position`
--

CREATE TABLE IF NOT EXISTS `uplink_location_equipment_position` (
  `location_equipment_position_id` int(11) NOT NULL default '0',
  `location_equipment_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `x_position` int(11) NOT NULL default '0',
  `y_position` int(11) NOT NULL default '0',
  `x_scale` int(11) NOT NULL default '100',
  `y_scale` int(11) NOT NULL default '100',
  `rotation_angle` int(11) NOT NULL default '0',
  `alpha_transparency` int(11) NOT NULL default '100',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_position_id` (`location_equipment_position_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_equipment_status`
--

CREATE TABLE IF NOT EXISTS `uplink_location_equipment_status` (
  `location_equipment_status_id` int(11) NOT NULL default '0',
  `location_equipment_id` int(11) NOT NULL default '0',
  `status_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_equipment_status_id` (`location_equipment_status_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_hours`
--

CREATE TABLE IF NOT EXISTS `uplink_location_hours` (
  `location_hours_id` int(11) NOT NULL default '0',
  `location_address_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `day_id` int(11) NOT NULL default '0',
  `open_time` time NOT NULL default '00:00:00',
  `close_time` time NOT NULL default '23:59:59',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_hours_id` (`location_hours_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_images`
--

CREATE TABLE IF NOT EXISTS `uplink_location_images` (
  `location_image_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `location_address_id` int(11) NOT NULL default '0',
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
  UNIQUE KEY `location_image_id` (`location_image_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_language`
--

CREATE TABLE IF NOT EXISTS `uplink_location_language` (
  `location_address_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `language_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime default NULL,
  `deletion_datetime` datetime default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_region`
--

CREATE TABLE IF NOT EXISTS `uplink_location_region` (
  `region_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `location_address_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_region_index` (`region_id`,`location_address_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_space_plan`
--

CREATE TABLE IF NOT EXISTS `uplink_location_space_plan` (
  `location_space_plan_id` int(11) NOT NULL default '0',
  `account_id` varchar(100) NOT NULL default '-',
  `location_address_id` int(11) NOT NULL default '0',
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_location_status`
--

CREATE TABLE IF NOT EXISTS `uplink_location_status` (
  `location_status_id` int(11) NOT NULL default '0',
  `location_address_id` int(11) NOT NULL default '0',
  `account_id` char(100) NOT NULL default '-',
  `status_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `location_status_id` (`location_status_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_region`
--

CREATE TABLE IF NOT EXISTS `uplink_region` (
  `region_id` int(11) NOT NULL default '0',
  `region_name` text,
  `account_id` varchar(100) NOT NULL default '-',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `region_id` (`region_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_user_location`
--

CREATE TABLE IF NOT EXISTS `uplink_user_location` (
  `user_id` int(11) NOT NULL default '0',
  `location_address_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `user_location_index` (`user_id`,`location_address_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uplink_user_region`
--

CREATE TABLE IF NOT EXISTS `uplink_user_region` (
  `user_id` int(11) NOT NULL default '0',
  `region_id` int(11) NOT NULL default '0',
  `creation_datetime` datetime NOT NULL default '1000-01-01 01:01:01',
  `deletion_datetime` datetime NOT NULL default '9999-01-01 01:01:01',
  UNIQUE KEY `user_region_index` (`user_id`,`region_id`,`creation_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
