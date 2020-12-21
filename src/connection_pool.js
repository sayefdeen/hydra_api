/* eslint-disable comma-dangle */
require('dotenv').config();
const pg = require('pg');
require('colors');

const pool = new pg.Client({
  connectionString: process.env.DATABASE_URL,
});

module.exports = pool;

pool
  .connect()
  .then(() => {
    console.log(
      `Connected to Data Base correctly ${pool.database} 🐍`.green.bold
    );
  })
  .catch((e) => {
    console.log(`Can't connect to dataBase 💧`.red.bold);
  });
