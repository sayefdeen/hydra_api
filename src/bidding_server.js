'use strict';
const server = require('./server');
require('dotenv').config();
const bidServer = server.io;

bidServer.on('connection', (socket) => {
  console.log('Yes');
});
