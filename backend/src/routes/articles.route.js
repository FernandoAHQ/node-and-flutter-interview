const { Router } = require('express');
const { getAllArticles, getArticlesSplit } = require('../controllers/articles.controller');

const router = Router();

router.get('/all', getAllArticles);
router.get('/', getArticlesSplit);

router.get('/:userId', (req, res) => {
  return res.send(req.context.models.users[req.params.userId]);
});

module.exports = router;