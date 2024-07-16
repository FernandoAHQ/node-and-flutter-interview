const Article = require('../models/articles.model');

const getAllArticles = async(req, res = response ) => { 
    console.log('API HIT');
    const query = req.query.search;
    filter = {}
    if(query) {
        filter = {
            $or: [ {title : { $regex: query, $options: 'i' }}, { descriptio: { $regex: query, $options: 'i' } } ]
        }
    }
    
    try {
        const articles = await Article.find({...filter})
                                .sort({'publishedAt': -1}) //sort by published (newest first)
                                .select('-publishedAt') //returning without publishedDate

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
        const articles = await Article.find({})
                                .sort({'publishedAt': -1}) //sort by published (newest first)
                                .select('-publishedAt') //returning without publishedDate
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