const app = require('./app');
const db = require('./db');

db.connect()
  .then((client) => client
    .query('SELECT $1::text as message', ['Hello world! I hate POSTGRESQL!'])
    .then((res) => console.log(res.rows[0].message))
    .catch((err) => console.error(err))
    .finally(() => client.release()));

const port = 3000;
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
