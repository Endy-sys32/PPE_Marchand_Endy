-- MySQL Script generated by MySQL Workbench
-- Fri Jan 15 11:04:35 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PPE_Marchand_Endy
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PPE_Marchand_Endy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PPE_Marchand_Endy` DEFAULT CHARACTER SET utf8 ;
USE `PPE_Marchand_Endy` ;

-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`Client` (
  `idClient` INT NOT NULL,
  `NomClient` VARCHAR(100) NULL,
  `PrenomClient` VARCHAR(45) NULL,
  `AdRueClient` VARCHAR(150) NULL,
  `AdCpClient` INT NULL,
  `AdVilleClient` VARCHAR(100) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`Categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`Categorie` (
  `idCategorie` INT NOT NULL,
  `LibellCategorie` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`Fournisseur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`Fournisseur` (
  `idFournisseur` INT NOT NULL,
  `NomFournisseur` VARCHAR(100) NULL,
  `VilleFournisseur` VARCHAR(100) NULL,
  `CPFournisseur` INT NULL,
  PRIMARY KEY (`idFournisseur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`Produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`Produit` (
  `idProduit` INT NOT NULL,
  `LibelleProduit` VARCHAR(100) NULL,
  `PrixHTProduit` FLOAT NULL,
  `QteStockProduit` INT NULL,
  `idFourn` INT NULL,
  `idCategorie` INT NULL,
  PRIMARY KEY (`idProduit`),
  INDEX `FkidCategorie_idx` (`idCategorie` ASC) VISIBLE,
  INDEX `FKidFournisseur_idx` (`idFourn` ASC) VISIBLE,
  CONSTRAINT `FkidCategorie`
    FOREIGN KEY (`idCategorie`)
    REFERENCES `PPE_Marchand_Endy`.`Categorie` (`idCategorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKidFournisseur`
    FOREIGN KEY (`idFourn`)
    REFERENCES `PPE_Marchand_Endy`.`Fournisseur` (`idFournisseur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`Commande` (
  `idCommande` INT NOT NULL,
  `DateCommande` VARCHAR(10) NULL,
  `idClient` INT NULL,
  PRIMARY KEY (`idCommande`),
  INDEX `FkidClient_idx` (`idClient` ASC) VISIBLE,
  CONSTRAINT `FkidClient`
    FOREIGN KEY (`idClient`)
    REFERENCES `PPE_Marchand_Endy`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PPE_Marchand_Endy`.`LigneDeCommande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PPE_Marchand_Endy`.`LigneDeCommande` (
  `IdCommande` INT NOT NULL,
  `IdProduit` INT NOT NULL,
  `QuantiteCom` INT NOT NULL,
  INDEX `FKidProduit_idx` (`IdProduit` ASC) VISIBLE,
  PRIMARY KEY (`IdProduit`, `IdCommande`),
  CONSTRAINT `FKidCommande`
    FOREIGN KEY (`IdCommande`)
    REFERENCES `PPE_Marchand_Endy`.`Commande` (`idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKidProduit`
    FOREIGN KEY (`IdProduit`)
    REFERENCES `PPE_Marchand_Endy`.`Produit` (`idProduit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`Client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`) VALUES (1, 'Bonaparte', 'Napoléon', '10 Boulevar', 34600, 'Sainte-Hélène');
INSERT INTO `PPE_Marchand_Endy`.`Client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`) VALUES (2, 'Tesla', 'Nicolas', '10 Rue Avenue Foch', 34600, 'Monopoly');
INSERT INTO `PPE_Marchand_Endy`.`Client` (`idClient`, `NomClient`, `PrenomClient`, `AdRueClient`, `AdCpClient`, `AdVilleClient`) VALUES (3, 'ZuckerBerg', 'Mark', '10 Rue de la Paix', 34600, 'Monopoly');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`Categorie`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`Categorie` (`idCategorie`, `LibellCategorie`) VALUES (1, 'Jeux');
INSERT INTO `PPE_Marchand_Endy`.`Categorie` (`idCategorie`, `LibellCategorie`) VALUES (2, 'Travail');
INSERT INTO `PPE_Marchand_Endy`.`Categorie` (`idCategorie`, `LibellCategorie`) VALUES (3, 'Sport');
INSERT INTO `PPE_Marchand_Endy`.`Categorie` (`idCategorie`, `LibellCategorie`) VALUES (4 , 'Déco');
INSERT INTO `PPE_Marchand_Endy`.`Categorie` (`idCategorie`, `LibellCategorie`) VALUES (5, 'Guerre Napoléonienne');

COMMIT;


-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`Fournisseur`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`Fournisseur` (`idFournisseur`, `NomFournisseur`, `VilleFournisseur`, `CPFournisseur`) VALUES (1, 'Lockheed Martin', 'Austerlitz', 34600);
INSERT INTO `PPE_Marchand_Endy`.`Fournisseur` (`idFournisseur`, `NomFournisseur`, `VilleFournisseur`, `CPFournisseur`) VALUES (2, 'Elizabeth Magie', 'Marc Bloch', 34600);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`Produit`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`Produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCategorie`) VALUES (1, 'Le fusil Charleville Modèle 1777', 50, 1000, 1, 5);
INSERT INTO `PPE_Marchand_Endy`.`Produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCategorie`) VALUES (2, 'Carte Sortie de Prison', 50, 3, 2, 1);
INSERT INTO `PPE_Marchand_Endy`.`Produit` (`idProduit`, `LibelleProduit`, `PrixHTProduit`, `QteStockProduit`, `idFourn`, `idCategorie`) VALUES (3, 'Carte 10 Rue de la Paix', 50, 1, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`Commande`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`Commande` (`idCommande`, `DateCommande`, `idClient`) VALUES (1, '14/01/2021', 1);
INSERT INTO `PPE_Marchand_Endy`.`Commande` (`idCommande`, `DateCommande`, `idClient`) VALUES (2, '15/001/2021', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `PPE_Marchand_Endy`.`LigneDeCommande`
-- -----------------------------------------------------
START TRANSACTION;
USE `PPE_Marchand_Endy`;
INSERT INTO `PPE_Marchand_Endy`.`LigneDeCommande` (`IdCommande`, `IdProduit`, `QuantiteCom`) VALUES (1, 1, 2);
INSERT INTO `PPE_Marchand_Endy`.`LigneDeCommande` (`IdCommande`, `IdProduit`, `QuantiteCom`) VALUES (2, 2, 2);
INSERT INTO `PPE_Marchand_Endy`.`LigneDeCommande` (`IdCommande`, `IdProduit`, `QuantiteCom`) VALUES (2, 2, 1);

COMMIT;

