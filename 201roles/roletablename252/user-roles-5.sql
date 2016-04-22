-- MySQL Script generated by MySQL Workbench
-- 04/22/16 10:18:46
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema role251d
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema role251d
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `role251d` DEFAULT CHARACTER SET utf8 ;
USE `role251d` ;

-- -----------------------------------------------------
-- Table `role251d`.`fs_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role251d`.`fs_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `active` TINYINT NULL DEFAULT NULL,
  `confirmed_at` DATETIME NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role251d`.`fs_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role251d`.`fs_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role251d`.`roles_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role251d`.`roles_users` (
  `user_id` INT(11) NULL DEFAULT NULL,
  `role_id` INT(11) NULL DEFAULT NULL,
  INDEX `user_id` (`user_id` ASC),
  INDEX `role_id` (`role_id` ASC),
  CONSTRAINT `roles_users_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `role251d`.`fs_user` (`id`),
  CONSTRAINT `roles_users_ibfk_2`
    FOREIGN KEY (`role_id`)
    REFERENCES `role251d`.`fs_role` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `role251d`.`fs_user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role251d`.`fs_user_role` (
  `fs_user_id` INT NOT NULL,
  `fs_role_id` INT NOT NULL,
  INDEX `fk_fs_user_role_fs_user1_idx` (`fs_user_id` ASC),
  INDEX `fk_fs_user_role_fs_role1_idx` (`fs_role_id` ASC),
  CONSTRAINT `fk_fs_user_role_fs_user1`
    FOREIGN KEY (`fs_user_id`)
    REFERENCES `role251d`.`fs_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fs_user_role_fs_role1`
    FOREIGN KEY (`fs_role_id`)
    REFERENCES `role251d`.`fs_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;