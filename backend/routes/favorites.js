const express = require('express');
const { getFavorites, addFavorite, removeFavorite } = require('../controllers/favoriteController');
const auth = require('../middleware/auth');

const router = express.Router();

router.get('/', auth, getFavorites);
router.post('/', auth, addFavorite);
router.delete('/', auth, removeFavorite);

module.exports = router;
