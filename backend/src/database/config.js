const mongoose = require('mongoose');

const dbConnection = async() => {

    try {
        await mongoose.connect( process.env.DB_CNN, {
        });

        console.log('DB online')

    } catch ( err ) {
        console.log( err );
        throw new Error('Database error');
    }


}


module.exports = {
    dbConnection
}