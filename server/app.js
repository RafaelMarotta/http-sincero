'use strict';

const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/', express.static(path.join(__dirname, 'public')));

app.use('/api/v1/codes/:code', (request, response) => {
  response.send({ content: `Status, ${request.params.code}` });
});

module.exports = app;
