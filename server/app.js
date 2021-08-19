const express = require('express');
const morgan = require('morgan');
const db = require('./db');

const app = express();

app.use(morgan('dev'));
app.use(express.json());

app.get('/products', (req, res) => {
  const count = req.query.count ? Number(req.query.count) : 5;
  const page = req.query.page ? Number(req.query.page) : 1;
  const query = {
    text: `SELECT * FROM products
    ORDER BY id
    LIMIT $1
    OFFSET $2;`,
    values: [count, (page - 1) * count],
  };
  db
    .query(query)
    .then((results) => res.status(200).send(results.rows))
    .catch((error) => console.error(error.stack));
});

app.get('/products/:product_id', (req, res) => {
  res.send(req.params);
});

module.exports = app;
