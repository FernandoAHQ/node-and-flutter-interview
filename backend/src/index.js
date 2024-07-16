const Server = require("./app");
require('dotenv').config();


const server = new Server();

server.execute();