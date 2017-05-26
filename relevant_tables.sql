-- Create syntax for TABLE 'expedia-all-bookings-2013'
CREATE TABLE `expedia-all-bookings-2013` (
  `date_time` varchar(255) DEFAULT NULL,
  `site_name` int(11) DEFAULT NULL,
  `posa_continent` int(11) DEFAULT NULL,
  `user_location_country` int(11) DEFAULT NULL,
  `user_location_region` int(11) DEFAULT NULL,
  `user_location_city` int(11) DEFAULT NULL,
  `orig_destination_distance` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_mobile` int(11) DEFAULT NULL,
  `is_package` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `srch_ci` varchar(255) DEFAULT NULL,
  `srch_co` varchar(255) DEFAULT NULL,
  `srch_adults_cnt` int(11) DEFAULT NULL,
  `srch_children_cnt` int(11) DEFAULT NULL,
  `srch_rm_cnt` int(11) DEFAULT NULL,
  `srch_destination_id` int(11) DEFAULT NULL,
  `srch_destination_type_id` int(11) DEFAULT NULL,
  `is_booking` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `hotel_continent` int(11) DEFAULT NULL,
  `hotel_country` int(11) DEFAULT NULL,
  `hotel_market` int(11) DEFAULT NULL,
  `hotel_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-all-bookings-2013-reduced'
CREATE TABLE `expedia-all-bookings-2013-reduced` (
  `date_time` varchar(255) DEFAULT NULL,
  `site_name` int(11) DEFAULT NULL,
  `posa_continent` int(11) DEFAULT NULL,
  `user_location_country` int(11) DEFAULT NULL,
  `user_location_region` int(11) DEFAULT NULL,
  `user_location_city` int(11) DEFAULT NULL,
  `orig_destination_distance` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_mobile` int(11) DEFAULT NULL,
  `is_package` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `srch_ci` varchar(255) DEFAULT NULL,
  `srch_co` varchar(255) DEFAULT NULL,
  `srch_adults_cnt` int(11) DEFAULT NULL,
  `srch_children_cnt` int(11) DEFAULT NULL,
  `srch_rm_cnt` int(11) DEFAULT NULL,
  `srch_destination_id` int(11) DEFAULT NULL,
  `srch_destination_type_id` int(11) DEFAULT NULL,
  `is_booking` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `hotel_continent` int(11) DEFAULT NULL,
  `hotel_country` int(11) DEFAULT NULL,
  `hotel_market` int(11) DEFAULT NULL,
  `hotel_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-all-bookings-2014'
CREATE TABLE `expedia-all-bookings-2014` (
  `date_time` varchar(255) DEFAULT NULL,
  `site_name` int(11) DEFAULT NULL,
  `posa_continent` int(11) DEFAULT NULL,
  `user_location_country` int(11) DEFAULT NULL,
  `user_location_region` int(11) DEFAULT NULL,
  `user_location_city` int(11) DEFAULT NULL,
  `orig_destination_distance` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_mobile` int(11) DEFAULT NULL,
  `is_package` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `srch_ci` varchar(255) DEFAULT NULL,
  `srch_co` varchar(255) DEFAULT NULL,
  `srch_adults_cnt` int(11) DEFAULT NULL,
  `srch_children_cnt` int(11) DEFAULT NULL,
  `srch_rm_cnt` int(11) DEFAULT NULL,
  `srch_destination_id` int(11) DEFAULT NULL,
  `srch_destination_type_id` int(11) DEFAULT NULL,
  `is_booking` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `hotel_continent` int(11) DEFAULT NULL,
  `hotel_country` int(11) DEFAULT NULL,
  `hotel_market` int(11) DEFAULT NULL,
  `hotel_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-all-bookings-2014-reduced'
CREATE TABLE `expedia-all-bookings-2014-reduced` (
  `date_time` varchar(255) DEFAULT NULL,
  `site_name` int(11) DEFAULT NULL,
  `posa_continent` int(11) DEFAULT NULL,
  `user_location_country` int(11) DEFAULT NULL,
  `user_location_region` int(11) DEFAULT NULL,
  `user_location_city` int(11) DEFAULT NULL,
  `orig_destination_distance` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_mobile` int(11) DEFAULT NULL,
  `is_package` int(11) DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  `srch_ci` varchar(255) DEFAULT NULL,
  `srch_co` varchar(255) DEFAULT NULL,
  `srch_adults_cnt` int(11) DEFAULT NULL,
  `srch_children_cnt` int(11) DEFAULT NULL,
  `srch_rm_cnt` int(11) DEFAULT NULL,
  `srch_destination_id` int(11) DEFAULT NULL,
  `srch_destination_type_id` int(11) DEFAULT NULL,
  `is_booking` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `hotel_continent` int(11) DEFAULT NULL,
  `hotel_country` int(11) DEFAULT NULL,
  `hotel_market` int(11) DEFAULT NULL,
  `hotel_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-relevant-users-2013'
CREATE TABLE `expedia-relevant-users-2013` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2926 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-relevant-users-2014'
CREATE TABLE `expedia-relevant-users-2014` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2295 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-user-hotel-probability-2013'
CREATE TABLE `expedia-user-hotel-probability-2013` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `probability` varchar(255) DEFAULT NULL,
  `like_hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9802 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-user-hotel-probability-2014'
CREATE TABLE `expedia-user-hotel-probability-2014` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `probability` varchar(255) DEFAULT NULL,
  `like_hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9802 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'expedia-user-hotel-probability-comparison-2013-2014'
CREATE TABLE `expedia-user-hotel-probability-comparison-2013-2014` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `volatility` varchar(255) DEFAULT NULL,
  `like_hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=latin1;
