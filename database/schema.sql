-- Table products

DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE products (
  id SERIAL,
  name VARCHAR(250) NOT NULL,
  slogan VARCHAR(250) NOT NULL,
  description VARCHAR(500) NOT NULL,
  category VARCHAR(250) NOT NULL,
  default_price INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- Table features

DROP TABLE IF EXISTS features CASCADE;

CREATE TABLE features (
  id SERIAL,
  product_id INTEGER NOT NULL,
  feature VARCHAR(250) NOT NULL,
  value VARCHAR(250) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

-- Table product_features

DROP TABLE IF EXISTS product_features CASCADE;

CREATE TABLE product_features (
  product_id INTEGER NOT NULL,
  feature_id INTEGER NOT NULL,
  UNIQUE (product_id, feature_id),
  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (feature_id) REFERENCES features (id)
);

-- Table styles

DROP TABLE IF EXISTS styles CASCADE;

CREATE TABLE styles (
  id SERIAL,
  product_id INTEGER NOT NULL,
  name VARCHAR(250) NOT NULL,
  sale_price INTEGER NULL DEFAULT NULL,
  original_price INTEGER NOT NULL,
  "default?" boolean NOT NULL DEFAULT false,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

-- Table photos

DROP TABLE IF EXISTS photos CASCADE;

CREATE TABLE photos (
  id SERIAL,
  style_id SERIAL,
  url VARCHAR(250) NOT NULL,
  thumbnail_url VARCHAR(500) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (style_id) REFERENCES styles (id)
);

-- Table skus

DROP TABLE IF EXISTS skus CASCADE;

CREATE TABLE skus (
  id SERIAL,
  style_id INTEGER NULL DEFAULT NULL,
  size VARCHAR(250) NULL,
  quantity INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (style_id) REFERENCES styles (id)
);

-- Table related_products

DROP TABLE IF EXISTS related_products CASCADE;

CREATE TABLE related_products (
  id SERIAL,
  current_product_id INTEGER NULL,
  related_product_id INTEGER NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (current_product_id) REFERENCES products (id),
  FOREIGN KEY (related_product_id) REFERENCES products (id)
);
