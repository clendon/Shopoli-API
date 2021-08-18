const { Pool } = require('pg');
const { dbConnectionParams } = require('./config/config');

module.exports = new Pool(dbConnectionParams);
