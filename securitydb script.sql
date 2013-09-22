use securityDB;


-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'devices'
-- 
-- ---

DROP TABLE IF EXISTS `devices`;
		
CREATE TABLE `devices` (
  `id` BIGINT NULL DEFAULT NULL COMMENT 'mac for each device',
  `indigoId` BIGINT NULL DEFAULT NULL,
  `indigoState` TINYINT NULL DEFAULT NULL,
  `devTypeId` INT NULL DEFAULT NULL,
  `manufacturer` MEDIUMTEXT NULL DEFAULT NULL,
  `model` MEDIUMTEXT NULL DEFAULT NULL,
  `hardware_ver` MEDIUMTEXT NULL DEFAULT NULL,
  `firmware_ver` MEDIUMTEXT NULL DEFAULT NULL,
  `indigoDescription` MEDIUMTEXT NULL DEFAULT NULL,
  `roomId` TINYINT NULL DEFAULT NULL,
  `objectId` TINYINT NULL DEFAULT NULL COMMENT 'object that sensor is mounted on',
  `dateInstalled` DATETIME NULL DEFAULT NULL,
  `dateDeInstalled` DATE NULL DEFAULT NULL,
  `lastHeard` DATETIME NULL DEFAULT NULL,
  `batteryLow` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'rooms'
-- 
-- ---

DROP TABLE IF EXISTS `rooms`;
		
CREATE TABLE `rooms` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` MEDIUMTEXT NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `siteId` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'motionHistory'
-- 
-- ---

DROP TABLE IF EXISTS `motionHistory`;
		
CREATE TABLE `motionHistory` (
  `id` BIGINT NULL AUTO_INCREMENT DEFAULT NULL,
  `deviceID` BIGINT NULL DEFAULT NULL,
  `inMotionEvent` TINYINT NULL DEFAULT NULL,
  `outMotionEvent` TINYINT NULL DEFAULT NULL,
  `dateTime` DATETIME NULL DEFAULT NULL,
  `roomName` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'opencloseHistory'
-- 
-- ---

DROP TABLE IF EXISTS `opencloseHistory`;
		
CREATE TABLE `opencloseHistory` (
  `id` BIGINT NULL AUTO_INCREMENT DEFAULT NULL,
  `deviceId` BIGINT NULL DEFAULT NULL,
  `openEvent` TINYINT NULL DEFAULT NULL,
  `closeEvent` TINYINT NULL DEFAULT NULL,
  `dateTime` DATETIME NULL DEFAULT NULL,
  `objectName` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'sites'
-- 
-- ---

DROP TABLE IF EXISTS `sites`;
		
CREATE TABLE `sites` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `siteName` MEDIUMTEXT NULL DEFAULT NULL,
  `streetNumber` INT NULL DEFAULT NULL,
  `streetName` MEDIUMTEXT NULL DEFAULT NULL,
  `apartmentNumber` MEDIUMTEXT NULL DEFAULT NULL,
  `city` MEDIUMTEXT NULL DEFAULT NULL,
  `state` MEDIUMTEXT NULL DEFAULT NULL,
  `zip5dig` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'deviceTypes'
-- motion or openclose
-- ---

DROP TABLE IF EXISTS `deviceTypes`;
		
CREATE TABLE `deviceTypes` (
  `id` INT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'motion or openclose';

-- ---
-- Table 'objects'
-- doors: frontdoor, refrigerator door, balcony door, etc.
-- ---

DROP TABLE IF EXISTS `objects`;
		
CREATE TABLE `objects` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` MEDIUMTEXT NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'doors: frontdoor, refrigerator door, balcony door, etc.';

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `devices` ADD FOREIGN KEY (devTypeId) REFERENCES `deviceTypes` (`id`);
ALTER TABLE `devices` ADD FOREIGN KEY (roomId) REFERENCES `rooms` (`id`);
ALTER TABLE `devices` ADD FOREIGN KEY (objectId) REFERENCES `objects` (`id`);
ALTER TABLE `rooms` ADD FOREIGN KEY (siteId) REFERENCES `sites` (`id`);
ALTER TABLE `motionHistory` ADD FOREIGN KEY (deviceID) REFERENCES `devices` (`id`);
ALTER TABLE `opencloseHistory` ADD FOREIGN KEY (deviceId) REFERENCES `devices` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `devices` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `motionHistory` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `opencloseHistory` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sites` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `deviceTypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `objects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `devices` (`id`,`indigoId`,`indigoState`,`devTypeId`,`manufacturer`,`model`,`hardware_ver`,`firmware_ver`,`indigoDescription`,`roomId`,`objectId`,`dateInstalled`,`dateDeInstalled`,`lastHeard`,`batteryLow`) VALUES
-- ('','','','','','','','','','','','','','','');
-- INSERT INTO `rooms` (`id`,`name`,`description`,`siteId`) VALUES
-- ('','','','');
-- INSERT INTO `motionHistory` (`id`,`deviceID`,`inMotionEvent`,`outMotionEvent`,`dateTime`,`roomName`) VALUES
-- ('','','','','','');
-- INSERT INTO `opencloseHistory` (`id`,`deviceId`,`openEvent`,`closeEvent`,`dateTime`,`objectName`) VALUES
-- ('','','','','','');
-- INSERT INTO `sites` (`id`,`siteName`,`streetNumber`,`streetName`,`apartmentNumber`,`city`,`state`,`zip5dig`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `deviceTypes` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `objects` (`id`,`name`,`description`) VALUES
-- ('','','');
