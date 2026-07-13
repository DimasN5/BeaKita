const mongoose = require('mongoose');

const scholarshipSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Judul beasiswa tidak boleh kosong'],
    trim: true,
  },
  organization: {
    type: String,
    required: [true, 'Organisasi tidak boleh kosong'],
    trim: true,
  },
  deadline: {
    type: Date,
    required: [true, 'Deadline tidak boleh kosong'],
  },
  category: {
    type: String,
    required: true,
    enum: ['S1', 'S2', 'S2/S3', 'S1/S2'],
  },
  funding: {
    type: String,
    required: true,
    enum: ['Fully Funded', 'Partial'],
  },
  location: {
    type: String,
    required: true,
    enum: ['Indonesia', 'Indonesia & Overseas'],
  },
  description: {
    type: String,
    required: true,
  },
  requirement: {
    type: String,
    required: true,
  },
  benefit: {
    type: String,
    required: true,
  },
  website: {
    type: String,
    required: true,
  },
}, { timestamps: true });

module.exports = mongoose.model('Scholarship', scholarshipSchema);
