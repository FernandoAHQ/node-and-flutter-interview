const { Schema, model } = require('mongoose');

const ArticleSchema = Schema({

    author: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        require: true
    },
    url: {
        type: String,
        required: true
    },
    urlToImage: {
        type: String,
        required: true
    },
    publishedAt: {
        type: Date,
        default: new Date
    },
    

}, { timestamps: true });


ArticleSchema.method('toJSON', function(){
    const { __v,  ...object } = this.toObject();
    return object;
});



module.exports = model( 'Article', ArticleSchema );