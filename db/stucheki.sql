SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE `stucheki_development` ;

-- -----------------------------------------------------
-- Table `stucheki_development`.`information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`information` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`information` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NOT NULL,
  `disp_flag` TINYINT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stucheki_development`.`events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`events` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `service_type` SMALLINT NOT NULL,
  `service_event_id` INT NOT NULL,
  `title` TEXT NULL,
  `started_at` DATETIME NULL,
  `ended_at` DATETIME NULL,
  `address` TEXT NULL,
  `place` TEXT NULL,
  `link` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_events_1` (`service_type` ASC, `service_event_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stucheki_development`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`users` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provider` VARCHAR(255) NOT NULL,
  `uid` VARCHAR(255) NOT NULL,
  `screen_name` TEXT NOT NULL,
  `name` TEXT NOT NULL,
  `screen_url` TEXT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `users_1_idx` (`provider` ASC, `uid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stucheki_development`.`cheki_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`cheki_events` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`cheki_events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `cheki_status` TINYINT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cheki_events_events1_idx` (`event_id` ASC),
  INDEX `fk_cheki_events_users1_idx` (`user_id` ASC),
  UNIQUE INDEX `uk_cheki_events_1` (`user_id` ASC, `event_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stucheki_development`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`tags` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`tags` (
  `id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stucheki_development`.`event_tag_maps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stucheki_development`.`event_tag_maps` ;

CREATE TABLE IF NOT EXISTS `stucheki_development`.`event_tag_maps` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evet_tag_maps_events1_idx` (`event_id` ASC),
  INDEX `fk_evet_tag_maps_tags1_idx` (`tag_id` ASC),
  UNIQUE INDEX `uk_event_tag_maps_1` (`event_id` ASC, `tag_id` ASC))
ENGINE = InnoDB;
