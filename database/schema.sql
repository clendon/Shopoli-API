-- Type this command in terminal: psql clendon -d runway -h 127.0.0.1 -a -f ./database/schema.sql

-- Table products

DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE products (
  id SERIAL,
  name VARCHAR(250) NOT NULL,
  slogan VARCHAR(250) NOT NULL,
  description VARCHAR(250) NOT NULL,
  category VARCHAR(250) NOT NULL,
  default_price INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- Table features

DROP TABLE IF EXISTS features CASCADE;

CREATE TABLE features (
  id SERIAL,
  feature VARCHAR(250) NOT NULL,
  value VARCHAR(250) NULL,
  PRIMARY KEY (id)
);

-- Table product_features

DROP TABLE IF EXISTS product_features CASCADE;

CREATE TABLE product_features (
  product_id INTEGER NOT NULL,
  feature_id INTEGER NOT NULL,
  UNIQUE (product_id, feature_id)
);

-- Table styles

DROP TABLE IF EXISTS styles CASCADE;

CREATE TABLE styles (
  id SERIAL,
  name VARCHAR(250) NOT NULL,
  original_price INTEGER NOT NULL,
  sale_price INTEGER NULL DEFAULT NULL,
  "default?" boolean NOT NULL DEFAULT false,
  product_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- Table photos

DROP TABLE IF EXISTS photos CASCADE;

CREATE TABLE photos (
  style_id SERIAL,
  thumbnail_url VARCHAR(250) NOT NULL,
  url VARCHAR(250) NOT NULL
);

-- Table skus

DROP TABLE IF EXISTS skus CASCADE;

CREATE TABLE skus (
  id SERIAL,
  quantity INTEGER NOT NULL DEFAULT 0,
  size VARCHAR(250) NULL,
  style_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- Table related_products

DROP TABLE IF EXISTS related_products CASCADE;

CREATE TABLE related_products (
  product1_id INTEGER NOT NULL,
  product2_id INTEGER NOT NULL,
  UNIQUE (product1_id, product2_id)
);

-- Foreign Keys

ALTER TABLE product_features ADD FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE product_features ADD FOREIGN KEY (feature_id) REFERENCES features (id);
ALTER TABLE styles ADD FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE photos ADD FOREIGN KEY (style_id) REFERENCES styles (id);
ALTER TABLE skus ADD FOREIGN KEY (style_id) REFERENCES styles (id);
ALTER TABLE related_products ADD FOREIGN KEY (product1_id) REFERENCES products (id);
ALTER TABLE related_products ADD FOREIGN KEY (product2_id) REFERENCES products (id);