CREATE SCHEMA `alcer_db`;

CREATE TABLE `alcer_db`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(500) NULL,
  `price` INT NULL DEFAULT 0,
  `product_photo` VARCHAR(500) NULL,
  `special_offer` TINYINT NULL DEFAULT 0,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `alcer_db`.`products_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `alcer_db`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `discount` INT NULL DEFAULT 0,
  `in_process` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`));
  CREATE TABLE `alcer_db`.`orders_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `alcer_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `birth_date` DATE NOT NULL,
  `profil_photo` VARCHAR(500) NULL,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `alcer_db`.`products`
ADD COLUMN `category_id` INT NULL AFTER `product_photo`,
ADD INDEX `fk_products_category_idx` (`category_id` ASC) VISIBLE;
ALTER TABLE `alcer_db`.`products` 
ADD CONSTRAINT `fk_products_category`
  FOREIGN KEY (`category_id`)
  REFERENCES `alcer_db`.`products_categories` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `alcer_db`.`orders` 
ADD COLUMN `user_id` INT NOT NULL AFTER `order_date`,
ADD INDEX `fk_orders_users_idx` (`user_id` ASC) VISIBLE;
ALTER TABLE `alcer_db`.`orders` 
ADD CONSTRAINT `fk_orders_users`
  FOREIGN KEY (`user_id`)
  REFERENCES `alcer_db`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `alcer_db`.`orders_details` 
ADD COLUMN `order_id` INT NOT NULL AFTER `id`,
ADD COLUMN `product_id` INT NOT NULL AFTER `order_id`,
ADD INDEX `fk_od_orders_idx` (`order_id` ASC) VISIBLE,
ADD INDEX `fk_or_products_idx` (`product_id` ASC) VISIBLE;
ALTER TABLE `alcer_db`.`orders_details` 
ADD CONSTRAINT `fk_od_orders`
  FOREIGN KEY (`order_id`)
  REFERENCES `alcer_db`.`orders` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_or_products`
  FOREIGN KEY (`product_id`)
  REFERENCES `alcer_db`.`products` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;