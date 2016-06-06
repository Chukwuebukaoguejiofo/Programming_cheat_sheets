'use strict';
var express = require('express');
var app = express();

app.use(express.static('app'));  // app is the root folder now!

app.get('/', function(request, response){
  response.sendFile(__dirname + '/app/index.html'); // on '/', serve this file!   ('/app/index.html' is relative to this file (app.js))
});

app.listen(3000);