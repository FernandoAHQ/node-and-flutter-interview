const express = require('express');
const http = require('http');
//const cors = require('cors');
const { dbConnection } = require('./database/config');



class Server {

    constructor() {
        this.app = express();
        this.port = process.env.PORT||3000;

        dbConnection();

        this.server = http.createServer( this.app );

    }


    middlewares() {

        this.app.use( express.json() );

        this.app.use( '/api/articles', require('./routes/articles.route') );
 }




    execute() {

        this.middlewares();

        this.server.listen( this.port, () => {
            console.log('Server running on port:', this.port );
        })
    }


}


module.exports = Server;