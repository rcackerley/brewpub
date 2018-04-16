const express = require('express');
const app = express();
const fs = require('fs');
const db = require('./db.js');

//DB Calls
let getBrewsOfTheWeek = (req, res) =>
  db.query('SELECT name, brewery from beers WHERE botw = 1;')
  .then(beers => res.send(beers))

let getSpiritsOfTheWeek = (req, res) =>
  db.query('SELECT name, distillary from spirits WHERE sotw = 1')
  .then(spirits => res.send(spirits))



//Middleware
app.get('/beers', getBrewsOfTheWeek);
app.get('/spirits', getSpiritsOfTheWeek);
app.use(express.static('public'));


app.listen(3000, () => console.log('Brewpub running on 3000'))
