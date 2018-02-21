DROP SCHEMA IF EXISTS `cafe-manager`;

CREATE SCHEMA `cafe-manager`;

use `cafe-manager`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `users`;

CREATE  TABLE `users` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL ,
  `lastname` VARCHAR(45) NOT NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `user_roles`;

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `waiter`;

CREATE TABLE `waiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ordertable`;

CREATE TABLE `ordertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `waiter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_WAITER_idx` (`waiter_id`),
  CONSTRAINT `FK_WAITER` FOREIGN KEY (`waiter_id`) 
  REFERENCES `waiter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `order`;

CREATE TABLE `orderfortable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `ordertable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TABLE_idx` (`ordertable_id`),
  CONSTRAINT `FK_TABLE` FOREIGN KEY (`ordertable_id`) 
  REFERENCES `ordertable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product_order`;

CREATE TABLE `product_order` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(128) DEFAULT NULL,

  `product_id` int(11) NOT NULL,
  `orderfortable_id` int(11) NOT NULL,
  
   PRIMARY KEY (`id`),
  
  KEY `FK_PRODUCT_idx` (`product_id`),
  
  CONSTRAINT `FK_PRODUCT_idx` FOREIGN KEY (`product_id`) 
  REFERENCES `product` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_ORDER` FOREIGN KEY (`orderfortable_id`) 
  REFERENCES `orderfortable` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


SET FOREIGN_KEY_CHECKS = 1;
