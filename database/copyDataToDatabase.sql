COPY products
  FROM '/home/clendon/hack-reactor/sdc/raw_data/product.csv'
  DELIMITER ','
  CSV HEADER;

COPY features
  FROM '/home/clendon/hack-reactor/sdc/raw_data/features.csv'
  DELIMITER ','
  CSV HEADER;

COPY styles
  FROM '/home/clendon/hack-reactor/sdc/raw_data/styles.csv'
  DELIMITER ','
  NULL 'null'
  CSV HEADER;
-- Some sale_price values are null, and some are 0. Added this line below to convert them all to null for consistency.
UPDATE styles SET sale_price = NULL WHERE sale_price = 0;

COPY photos
  FROM '/home/clendon/hack-reactor/sdc/raw_data/photos.csv'
  DELIMITER ','
  CSV HEADER;
-- Come back and find a way to get data into database without having to fix missing quotes problem at the end of some thumbnail URLs in CSV.

COPY skus
  FROM '/home/clendon/hack-reactor/sdc/raw_data/skus.csv'
  DELIMITER ','
  CSV HEADER;

COPY related_products
  FROM '/home/clendon/hack-reactor/sdc/raw_data/related.csv'
  DELIMITER ','
  NULL '0'
  CSV HEADER;