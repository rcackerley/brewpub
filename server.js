const express = require('express');
const app = express();
const fs = require('fs');


app.use(express.static('public'))




app.listen(3000, () => console.log('Brewpub running on 3000'))
