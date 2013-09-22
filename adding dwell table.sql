SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roomDwell`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`roomDwell` (
  `id` BIGINT NOT NULL ,
  `timeIn` DATETIME NULL ,
  `timeOut` DATETIME NULL ,
  `roomDwell` DATETIME NULL ,
  `roomID` TINYINT NULL ,
  `rooms_id` TINYINT(4) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_roomDwell_rooms` (`rooms_id` ASC) ,
  CONSTRAINT `fk_roomDwell_rooms`
    FOREIGN KEY (`rooms_id` )
    REFERENCES `securityDB`.`rooms` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;