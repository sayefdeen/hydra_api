'use strict';

// Dependencies
const express = require('express');
const morgans = require('morgan');
const cors = require('cors');
const app = express();
const cookie = require('cookie-parser');

// Routes

// Middleware

app.set(express.json());
app.use(morgans('dev'));
app.use(cors());
app.use(cookie());

// socket server
const http = require('http').createServer(app);
const io = require('socket.io')(http);
const biddingNameSpace = io.of('/bidding');
biddingNameSpace.on('connection', (socket) => {});

// The Server

module.exports = {
  server: http,
  start: (port) => {
    http.listen(port, () => {
      console.log(`Working on`, port);
    });
  },
  io: biddingNameSpace,
};
