-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `slogan` VARCHAR(250) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  `category` VARCHAR(250) NOT NULL,
  `default_price` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS `features`;

CREATE TABLE `features` (
  `id` INTEGER NULL AUTO_INCREMENT,
  `feature` VARCHAR(250) NOT NULL,
  `value` VARCHAR(250) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'product_features'
--
-- ---

DROP TABLE IF EXISTS `product_features`;

CREATE TABLE `product_features` (
  `product_id` INTEGER NOT NULL,
  `feature_id` INTEGER NOT NULL,
  UNIQUE KEY (`product_id`, `feature_id`)
);

-- ---
-- Table 'styles'
--
-- ---

DROP TABLE IF EXISTS `styles`;

CREATE TABLE `styles` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(250) NOT NULL,
  `original_price` INTEGER NOT NULL,
  `sale_price` INTEGER NULL DEFAULT NULL,
  `default?` VARCHAR NOT NULL DEFAULT 'false',
  `product_id` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'photos'
--
-- ---

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `style_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `thumbnail_url` VARCHAR(250) NOT NULL,
  `url` VARCHAR(250) NOT NULL
);

-- ---
-- Table 'skus'
--
-- ---

DROP TABLE IF EXISTS `skus`;

CREATE TABLE `skus` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NOT NULL DEFAULT 0,
  `size` VARCHAR(250) NULL,
  `style_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'related_products'
--
-- ---

DROP TABLE IF EXISTS `related_products`;

CREATE TABLE `related_products` (
  `product1_id` INTEGER NOT NULL,
  `product2_id` INTEGER NOT NULL,
  UNIQUE KEY (`product1_id`, `product2_id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `product_features` ADD FOREIGN KEY (product_id) REFERENCES `products` (`id`);
ALTER TABLE `product_features` ADD FOREIGN KEY (feature_id) REFERENCES `features` (`id`);
ALTER TABLE `styles` ADD FOREIGN KEY (product_id) REFERENCES `products` (`id`);
ALTER TABLE `photos` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`id`);
ALTER TABLE `skus` ADD FOREIGN KEY (style_id) REFERENCES `styles` (`id`);
ALTER TABLE `related_products` ADD FOREIGN KEY (product1_id) REFERENCES `products` (`id`);
ALTER TABLE `related_products` ADD FOREIGN KEY (product2_id) REFERENCES `products` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `product_features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `related_products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `products` (`id`,`name`,`slogan`,`description`,`category`,`default_price`) VALUES
-- ('','','','','','');
-- INSERT INTO `features` (`id`,`feature`,`value`) VALUES
-- ('','','');
-- INSERT INTO `product_features` (`product_id`,`feature_id`) VALUES
-- ('','');
-- INSERT INTO `styles` (`id`,`name`,`original_price`,`sale_price`,`default?`,`product_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `photos` (`style_id`,`thumbnail_url`,`url`) VALUES
-- ('','','');
-- INSERT INTO `skus` (`id`,`quantity`,`size`,`style_id`) VALUES
-- ('','','','');
-- INSERT INTO `related_products` (`product1_id`,`product2_id`) VALUES
-- ('','');