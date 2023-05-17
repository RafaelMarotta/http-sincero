'use strict';

const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/', express.static(path.join(__dirname, '../public')));

const status = require('../public/status.json');

app.use('/api/v1/codes/:code', (request, response) => {
  let code = request.params.code
  console.log(status)
  let res = status.filter(e => e.code == code)
  if (res.size == 0) {
    response.sendStatus(404);
  }
  response.send(res[0]);
});

module.exports = app;
