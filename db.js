const pg = require('pg-promise')();
// const dbConfig = 'postgres://robby@localhost:5432/brewpub';
const db = pg(dbConfig);
const dbConfig = process.env.DATABASE_URL;

module.exports = db;
