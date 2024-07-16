const Article = require('../models/articles.model');

const getAllArticles = async(req, res = response ) => { 
    //const page = Number(req.query.page) || 1;
    try {
        const articles = await Article.find();

        res.status(200).json({
            status: true,
            articles,
        })

    } catch( error ) {
        console.log(error);
        res.status(500).json({
            status: false,
            message: 'Internal Server Error: ' + error.message
        })
    }
}

const getArticlesSplit = async(req, res = response ) => { 
    const page = Number(req.query.page) || 1;
    try {
        const articles = await Article.find()
                                .skip((page - 1 )*5)
                                .limit(5);

        res.status(200).json({
            status: true,
            articles,
        })

    } catch( error ) {
        console.log(error);
        res.status(500).json({
            status: false,
            message: 'Internal Server Error: ' + error.message
        })
    }
}


module.exports = {
    getAllArticles,
    getArticlesSplit
}