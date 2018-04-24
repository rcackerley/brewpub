const express = require('express');
const app = express();
const fs = require('fs');
const db = require('./db.js');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const signature = '@!3$%%^&1ed^&*!l@#^&***()R0441';
const bodyParser = require('body-parser');

//DB Calls
let getBrewsOfTheWeek = (req, res) =>
  db.query('SELECT name, brewery from beers WHERE botw = 1;')
  .then(beers => res.send(beers))

let getSpiritsOfTheWeek = (req, res) =>
  db.query('SELECT name, distillary from spirits WHERE sotw = 1')
  .then(spirits => res.send(spirits))

let createUser = (user) => {
  db.query(`INSERT into users (email, password, name) VALUES ('${user.email}', '${user.password}', '${user.name}') RETURNING id;`)
}

let getHeroPairings = (req, res) =>
  db.query(`SELECT description, books.name, author, image, genre, "color-gradient-1", "colorgradient-2", 
  "colorgradient-3", beers.name, brewery, type from pairings INNER JOIN books ON 
  (books.id = pairings."books.id") INNER JOIN beers ON (beers.id = pairings."beers.id") 
  where "featured-pairing" = 1;`)
  .then(heros => res.send(heros))

//authorization
let createToken = (userId) =>
  jwt.sign({userId: userId}, signature, {expiresIn: '7d'});

let validateCredentials = (res, email, password) => {
  let userId
  let userQuery = db.query(`SELECT email, password, id from users WHERE email = '${email}';`)
  .then(users => {userId = users[0].id; return users[0]})
  .then(user => bcrypt.compare(password, user.password))
  .then(response => response ? userId : false)
  .then(userId => createToken(userId))
  .then(token => res.send(token))
  .catch(error => res.send(error));
}


//request handlers
let postUser = (req, res) => {
  let credentials = req.body;
  bcrypt.hash(credentials.password, 10)
  .then(hash => Object.assign({}, credentials, {password: hash}))
  .then(user => createUser(user))
  .then(id => createToken(id))
  .then(token => res.send(token))
  .catch(error => res.send(error));
}

let signIn = (req, res) => {
  let credentials = req.body;
  let {email, password} = credentials;
  validateCredentials(res, email, password);
}




//Middleware
app.use(bodyParser.json());
app.post('/signin', signIn);
app.post('/users', postUser);
app.get('/heros', getHeroPairings);
app.get('/beers', getBrewsOfTheWeek);
app.get('/spirits', getSpiritsOfTheWeek);
app.use(express.static('public'));


app.listen(3000, () => console.log('Brewpub running on 3000'))
