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
  db.query('SELECT name, brewery, icon from beers WHERE botw = 1;')
  .then(beers => res.send(beers))

let getSpiritsOfTheWeek = (req, res) =>
  db.query('SELECT name, distillary, icon from spirits WHERE sotw = 1')
  .then(spirits => res.send(spirits))

let createUser = (user) =>
  db.query(`INSERT into users (email, password, name) VALUES ('${user.email}', '${user.password}', '${user.name}') RETURNING id;`)


let getHeroPairings = (req, res) =>
  db.query(`SELECT COUNT(stars) as reviews, description, books.title, author, image, genre, class, beers.name, brewery, type, sum(stars) AS "stars"
FROM ratings INNER JOIN pairings ON (pairings.id = ratings."pairings.id") INNER JOIN books ON
  (books.id = pairings."books.id") INNER JOIN beers ON (beers.id = pairings."beers.id") WHERE pairings."featured-pairing" = 1
GROUP BY "pairings.id", description, books.title, author, image, genre, class, beers.name, brewery, type;`)
  .then(heros => res.send(JSON.stringify(heros)))

let getAllPairings = (req, res) =>
  db.query(`SELECT COUNT(stars) as reviews, description, books.title, author, image, genre, beers.name, brewery, type, sum(stars) AS "stars"
FROM ratings INNER JOIN pairings ON (pairings.id = ratings."pairings.id") INNER JOIN books ON
  (books.id = pairings."books.id") INNER JOIN beers ON (beers.id = pairings."beers.id") WHERE pairings."featured-pairing" = 0
GROUP BY "pairings.id", description, books.title, author, image, genre, beers.name, brewery, type;`)
  .then(pairings => res.send(JSON.stringify(pairings)))

let getProfileImage = (id) =>
  db.query(`SELECT image from users WHERE ${id} = id;`)

let getUserProfile = (id) =>
  db.query(`SELECT email, name, image from users WHERE ${id} = id;`)

let getBeerTypes = (type) => {
  console.log(type);
  return db.query(`SELECT * FROM beers  WHERE ("type" = '${type}');`)
  .then(res => {
    console.log(res);
    return res
  })
}

//authorization
let createToken = (userId) => {
  console.log(userId);
  let tokenPayload = {userId: userId};
  tokenPayload.token = jwt.sign({userId: userId}, signature, {expiresIn: '7d'});
  return JSON.stringify(tokenPayload)
}

let validateCredentials = (res, email, password) => {
  let userId
  let userQuery = db.query(`SELECT email, password, id from users WHERE email = '${email}';`)
  .then(users => {userId = users[0].id; return users[0]})
  .then(user => bcrypt.compare(password, user.password))
  .then(response => response ? userId : error)
  .then(userId => createToken(userId))
  .then(token => { console.log(token); return res.send(token)})
  .catch(error => res.send(error));
}


//request handlers
let postUser = (req, res) => {
  let credentials = req.body;
  bcrypt.hash(credentials.password, 10)
  .then(hash => Object.assign({}, credentials, {password: hash}))
  .then(user => createUser(user))
  .then(arrayWithIdObject => arrayWithIdObject[0].id)
  .then(id => createToken(id))
  .then(token => res.send(token))
  .catch(error => res.send(error));
}

let signIn = (req, res) => {
  let credentials = req.body;
  let {email, password} = credentials;
  validateCredentials(res, email, password);
}

let getProfileThumbnailImage = (req, res) => {
  let payload = req.body;
  let validation = jwt.verify(payload.token, signature);
  validation && getProfileImage(payload.userId)
  .then(imageUrl => res.send(JSON.stringify(imageUrl[0])))
  .catch(error => res.send(error))
}

let getMyProfile = (req, res) => {
  let payload = req.body;
  let validation = jwt.verify(payload.token, signature);
  validation && getUserProfile(payload.userId)
  .then(user => res.send(JSON.stringify(user[0])))
}

let getSimilarBeers = (req, res) => {
  return getBeerTypes(req.body.type)
  .then(beers => res.send(JSON.stringify(beers)))
  .catch(err => res.send(err))
}


//Middleware
app.use(bodyParser.json());
app.post('/signin', signIn);
app.post('/users', postUser);
app.get('/heros', getHeroPairings);
app.get('/pairings', getAllPairings);
app.get('/beers', getBrewsOfTheWeek);
app.post('/similar-beers', getSimilarBeers)
app.get('/spirits', getSpiritsOfTheWeek);
app.post('/profile', getProfileThumbnailImage);
app.post('/my-profile', getMyProfile)
// app.use(express.static('public'));


app.listen(3000, () => console.log('Brewpub running on 3000'))
