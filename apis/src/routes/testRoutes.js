const express = require('express');
const router = express.Router();
const testController = require('../controllers/testController');

router.post('/create_test', testController.addTest);
router.post('/edit_test', testController.editTest);
router.post('/delete_test', testController.deleteTest);
router.post('/add_review', testController.addTestReview);
router.get('/tests', testController.getTests);
router.get('/my-tests', testController.getMyTests);
router.get('/reviews', testController.getReviews);
router.get('/filter-reviews', testController.getFilteredReviews);

module.exports = router;