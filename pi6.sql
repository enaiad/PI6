-- MySQL Script generated by MySQL Workbench
-- Tue Oct  1 08:33:35 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pi6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pi6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pi6` DEFAULT CHARACTER SET utf8 ;
USE `pi6` ;

-- -----------------------------------------------------
-- Table `pi6`.`pi6_advertiser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_advertiser` (
  `idadvertiser` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(45) NOT NULL,
  `telephonenumberone` VARCHAR(45) NOT NULL,
  `telephonenumbertwo` VARCHAR(45) NOT NULL,
  `dateofbirth` DATE NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `streetnumber` INT NOT NULL,
  PRIMARY KEY (`idadvertiser`),
  UNIQUE INDEX `idadvertiser_UNIQUE` (`idadvertiser` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_usr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_usr` (
  `idusr` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `datecreate` DATE NOT NULL,
  `lastaccess` DATETIME NOT NULL,
  `idadvertiser` INT NOT NULL,
  PRIMARY KEY (`idusr`),
  UNIQUE INDEX `idusr_UNIQUE` (`idusr` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_pi6_usr_pi6_advertiser1_idx` (`idadvertiser` ASC) VISIBLE,
  CONSTRAINT `fk_pi6_usr_pi6_advertiser1`
    FOREIGN KEY (`idadvertiser`)
    REFERENCES `pi6`.`pi6_advertiser` (`idadvertiser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_form_of_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_form_of_payment` (
  `idformofpayment` INT NOT NULL AUTO_INCREMENT,
  `namepayment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idformofpayment`),
  UNIQUE INDEX `idformofpayment_UNIQUE` (`idformofpayment` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_plans` (
  `idplans` INT NOT NULL AUTO_INCREMENT,
  `nameplan` VARCHAR(100) NOT NULL,
  `numbersofplans` INT NOT NULL,
  `value` FLOAT NOT NULL,
  PRIMARY KEY (`idplans`),
  UNIQUE INDEX `idplans_UNIQUE` (`idplans` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_payment_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_payment_status` (
  `idstatus` INT NOT NULL AUTO_INCREMENT,
  `namestatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_advertiser_plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_advertiser_plans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pi6_idadvertiser` INT NOT NULL,
  `pi6_idplans` INT NOT NULL,
  `pi6_idformofpayment` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_pi6_advertiser_plans_pi6_advertiser1_idx` (`pi6_idadvertiser` ASC) VISIBLE,
  INDEX `fk_pi6_advertiser_plans_pi6_plans1_idx` (`pi6_idplans` ASC) VISIBLE,
  INDEX `fk_pi6_advertiser_plans_pi6_form_of_payment1_idx` (`pi6_idformofpayment` ASC) VISIBLE,
  CONSTRAINT `fk_pi6_advertiser_plans_pi6_advertiser1`
    FOREIGN KEY (`pi6_idadvertiser`)
    REFERENCES `pi6`.`pi6_advertiser` (`idadvertiser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pi6_advertiser_plans_pi6_plans1`
    FOREIGN KEY (`pi6_idplans`)
    REFERENCES `pi6`.`pi6_plans` (`idplans`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pi6_advertiser_plans_pi6_form_of_payment1`
    FOREIGN KEY (`pi6_idformofpayment`)
    REFERENCES `pi6`.`pi6_form_of_payment` (`idformofpayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_billing` (
  `idbilling` INT NOT NULL AUTO_INCREMENT,
  `id_advertiser_plans_id` INT NOT NULL,
  `idstatus` INT NOT NULL,
  PRIMARY KEY (`idbilling`),
  UNIQUE INDEX `idbilling_UNIQUE` (`idbilling` ASC) VISIBLE,
  INDEX `fk_pi6_billing_pi6_advertiser_plans1_idx` (`id_advertiser_plans_id` ASC) VISIBLE,
  INDEX `fk_pi6_billing_pi6_payment_status1_idx` (`idstatus` ASC) VISIBLE,
  CONSTRAINT `fk_pi6_billing_pi6_advertiser_plans1`
    FOREIGN KEY (`id_advertiser_plans_id`)
    REFERENCES `pi6`.`pi6_advertiser_plans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pi6_billing_pi6_payment_status1`
    FOREIGN KEY (`idstatus`)
    REFERENCES `pi6`.`pi6_payment_status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_country` (
  `idcountry` INT NOT NULL AUTO_INCREMENT,
  `namecountry` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcountry`),
  UNIQUE INDEX `idcountry_UNIQUE` (`idcountry` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_state` (
  `idstate` INT NOT NULL AUTO_INCREMENT,
  `namestate` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(45) NOT NULL,
  `idcountry` INT NOT NULL,
  PRIMARY KEY (`idstate`),
  UNIQUE INDEX `idstate_UNIQUE` (`idstate` ASC) VISIBLE,
  INDEX `fk_pi6_state_pi6_country1_idx` (`idcountry` ASC) VISIBLE,
  CONSTRAINT `fk_pi6_state_pi6_country1`
    FOREIGN KEY (`idcountry`)
    REFERENCES `pi6`.`pi6_country` (`idcountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pi6`.`pi6_city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pi6`.`pi6_city` (
  `idcity` INT NOT NULL AUTO_INCREMENT,
  `namecity` VARCHAR(45) NOT NULL,
  `pi6_idstate` INT NOT NULL,
  PRIMARY KEY (`idcity`),
  UNIQUE INDEX `idcity_UNIQUE` (`idcity` ASC) VISIBLE,
  INDEX `fk_pi6_city_pi6_state1_idx` (`pi6_idstate` ASC) VISIBLE,
  CONSTRAINT `fk_pi6_city_pi6_state1`
    FOREIGN KEY (`pi6_idstate`)
    REFERENCES `pi6`.`pi6_state` (`idstate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;