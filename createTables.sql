use railroad1;

CREATE TABLE fare_types (
  fare_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fare_name varchar(20) DEFAULT NULL,
  rate decimal(3,2) DEFAULT NULL,
);--ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1

CREATE TABLE passengers (
  passenger_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fname varchar(30) DEFAULT NULL,
  lname varchar(100) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  password varchar(100) DEFAULT NULL,
  preferred_card_number varchar(16) DEFAULT NULL,
  preferred_billing_address varchar(100) DEFAULT NULL,
);-- ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 |

CREATE TABLE reservations (
  reservation_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  reservation_date datetime DEFAULT NULL,
  paying_passenger_id int(11) NOT NULL,
  card_number varchar(16) DEFAULT NULL,
  billing_address varchar(100) DEFAULT NULL,
  -- KEY `paying_passenger_id` (`paying_passenger_id`),
  -- CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`paying_passenger_id`) REFERENCES `passengers` (`passenger_id`)
);--ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE seats_free (
  train_id int(11) NOT NULL,
  segment_id int(11) NOT NULL,
  seat_free_date date NOT NULL,
  freeseat int(11) NOT NULL DEFAULT 448,
  --PRIMARY KEY (`train_id`,`segment_id`,`seat_free_date`),
  -- KEY `segment_id` (`segment_id`),
  --CONSTRAINT `seats_free_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`segment_id`),
  --CONSTRAINT `seats_free_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`)
);--ENGINE=InnoDB DEFAULT CHARSET=latin1 

CREATE TABLE segments (
  segment_id int(11) NOT NULL AUTO_INCREMENT,
  seg_n_end int(11) NOT NULL,
  seg_s_end int(11) NOT NULL,
  seg_fare decimal(7,2) NOT NULL,
  -- PRIMARY KEY (`segment_id`),
  -- KEY `seg_n_end` (`seg_n_end`),
  -- KEY `seg_s_end` (`seg_s_end`),
  -- CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`seg_n_end`) REFERENCES `stations` (`station_id`),
  -- CONSTRAINT `segments_ibfk_2` FOREIGN KEY (`seg_s_end`) REFERENCES `stations` (`station_id`)
);--ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1

CREATE TABLE stations (
  station_id int(11) NOT NULL AUTO_INCREMENT,
  station_name varchar(40) NOT NULL,
  station_symbol char(3) NOT NULL,
  -- PRIMARY KEY (`station_id`),
  -- UNIQUE KEY `station_sym_ind` (`station_symbol`)
);--ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1

CREATE TABLE stops_at (
  train_id int(11) NOT NULL,
  station_id int(11) NOT NULL,
  time_in time DEFAULT NULL,
  time_out time DEFAULT NULL,
  -- PRIMARY KEY (`train_id`,`station_id`),
  -- KEY `station_id` (`station_id`),
  -- CONSTRAINT `stops_at_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`),
  -- CONSTRAINT `stops_at_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`)
);-- ENGINE=InnoDB DEFAULT CHARSET=latin1

CREATE TABLE trains (
  train_id int(11) NOT NULL AUTO_INCREMENT,
  train_start int(11) NOT NULL,
  train_end int(11) NOT NULL,
  train_direction tinyint(1) DEFAULT NULL,
  train_days tinyint(1) DEFAULT NULL,
  -- PRIMARY KEY (`train_id`),
  -- KEY `train_start` (`train_start`),
  -- KEY `train_end` (`train_end`),
  -- CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`train_start`) REFERENCES `stations` (`station_id`),
  -- CONSTRAINT `trains_ibfk_2` FOREIGN KEY (`train_end`) REFERENCES `stations` (`station_id`)
); --ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1

CREATE TABLE trips (
  trip_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  trip_date date NOT NULL,
  trip_seg_start int(11) NOT NULL,
  trip_seg_ends int(11) NOT NULL,
  fare_type int(11) NOT NULL,
  fare decimal(7,2) NOT NULL,
  trip_train_id int(11) NOT NULL,
  reservation_id int(11) NOT NULL,
  -- KEY `trip_seg_start` (`trip_seg_start`),
  -- KEY `trip_seg_ends` (`trip_seg_ends`),
  -- KEY `trip_train_id` (`trip_train_id`),
  -- KEY `reservation_id` (`reservation_id`),
  -- KEY `fare_type` (`fare_type`),
  -- CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`trip_seg_start`) REFERENCES `segments` (`segment_id`),
  -- CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`trip_seg_ends`) REFERENCES `segments` (`segment_id`),
  -- CONSTRAINT `trips_ibfk_3` FOREIGN KEY (`trip_train_id`) REFERENCES `trains` (`train_id`),
  -- CONSTRAINT `trips_ibfk_4` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  -- CONSTRAINT `trips_ibfk_5` FOREIGN KEY (`fare_type`) REFERENCES `fare_types` (`fare_id`)
);--ENGINE=InnoDB DEFAULT CHARSET=latin1