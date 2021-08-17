# Gabbro-System-Designs-Products
Handles requests to /products

# How To Use
Add schema to postgresQL database from root directory of repository, and copy the data into the database by typing the following two lines into the terminal:

`psql clendon -d runway -h 127.0.0.1 -a -f ./database/schema.sql`
`psql clendon -d runway -h 127.0.0.1 -a -f ./database/copyDataToDatabase.sql`
