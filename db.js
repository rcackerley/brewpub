const pg = require('pg-promise')();
// const dbConfig = 'postgres://robby@localhost:5432/brewpub';
const dbConfig = process.env.DATABASE_URL;
const db = pg(dbConfig);

module.exports = db;
