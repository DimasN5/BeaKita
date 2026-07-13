const Scholarship = require('../models/Scholarship');

exports.getScholarships = async (req, res) => {
  try {
    const { keyword, category, funding, location, page = 1, limit = 20 } = req.query;

    const filter = {};

    if (keyword) {
      filter.$or = [
        { title: { $regex: keyword, $options: 'i' } },
        { organization: { $regex: keyword, $options: 'i' } },
      ];
    }

    if (category && category !== 'All') filter.category = category;
    if (funding && funding !== 'All') filter.funding = funding;
    if (location && location !== 'All') filter.location = location;

    const total = await Scholarship.countDocuments(filter);
    const scholarships = await Scholarship.find(filter)
      .sort({ createdAt: -1 })
      .skip((page - 1) * limit)
      .limit(Number(limit));

    res.json({
      scholarships,
      pagination: {
        total,
        page: Number(page),
        pages: Math.ceil(total / limit),
      },
    });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.getScholarshipById = async (req, res) => {
  try {
    const scholarship = await Scholarship.findById(req.params.id);
    if (!scholarship) {
      return res.status(404).json({ message: 'Beasiswa tidak ditemukan' });
    }
    res.json({ scholarship });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.createScholarship = async (req, res) => {
  try {
    const scholarship = await Scholarship.create(req.body);
    res.status(201).json({ message: 'Beasiswa berhasil ditambahkan', scholarship });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.updateScholarship = async (req, res) => {
  try {
    const scholarship = await Scholarship.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });
    if (!scholarship) {
      return res.status(404).json({ message: 'Beasiswa tidak ditemukan' });
    }
    res.json({ message: 'Beasiswa berhasil diupdate', scholarship });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.deleteScholarship = async (req, res) => {
  try {
    const scholarship = await Scholarship.findByIdAndDelete(req.params.id);
    if (!scholarship) {
      return res.status(404).json({ message: 'Beasiswa tidak ditemukan' });
    }
    res.json({ message: 'Beasiswa berhasil dihapus' });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};
