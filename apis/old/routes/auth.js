// src/routes/auth.js

const express = require('express');
// const router = express.Router();
// const auth = require('../middleware/auth');
const { signup, login, getUser } = require('../controllers/authController');

// @route   POST /api/auth/signup
// @desc    Register a new user
router.post('/signup', signup);

// @route   POST /api/auth/login
// @desc    Log in an existing user
router.post('/login', login);

// @route   GET /api/auth/user
// @desc    Get the authenticated user's information
router.get('/user', auth, getUser);

module.exports = router;
