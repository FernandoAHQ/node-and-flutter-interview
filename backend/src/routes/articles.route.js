const { Router } = require('express');
const { getAllArticles, getArticlesSplit } = require('../controllers/articles.controller');

const router = Router();

router.get('/all', getAllArticles);

router.get('/', getArticlesSplit);



module.exports = router;