const express = require('express');
const {
  getScholarships,
  getScholarshipById,
  createScholarship,
  updateScholarship,
  deleteScholarship,
} = require('../controllers/scholarshipController');
const auth = require('../middleware/auth');

const router = express.Router();

router.get('/', getScholarships);
router.get('/:id', getScholarshipById);
router.post('/', auth, createScholarship);
router.put('/:id', auth, updateScholarship);
router.delete('/:id', auth, deleteScholarship);

module.exports = router;
