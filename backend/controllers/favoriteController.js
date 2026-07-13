const Favorite = require('../models/Favorite');
const Scholarship = require('../models/Scholarship');

exports.getFavorites = async (req, res) => {
  try {
    const favorites = await Favorite.find({ user: req.user._id })
      .populate('scholarship')
      .sort({ createdAt: -1 });

    res.json({ favorites: favorites.filter((f) => f.scholarship != null).map((f) => f.scholarship) });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.addFavorite = async (req, res) => {
  try {
    const { scholarshipId } = req.body;

    const scholarship = await Scholarship.findById(scholarshipId);
    if (!scholarship) {
      return res.status(404).json({ message: 'Beasiswa tidak ditemukan' });
    }

    const existing = await Favorite.findOne({ user: req.user._id, scholarship: scholarshipId });
    if (existing) {
      return res.status(400).json({ message: 'Beasiswa sudah ada di favorit' });
    }

    await Favorite.create({ user: req.user._id, scholarship: scholarshipId });
    res.status(201).json({ message: 'Berhasil ditambahkan ke favorit' });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};

exports.removeFavorite = async (req, res) => {
  try {
    const { scholarshipId } = req.body;

    const result = await Favorite.findOneAndDelete({
      user: req.user._id,
      scholarship: scholarshipId,
    });

    if (!result) {
      return res.status(404).json({ message: 'Favorit tidak ditemukan' });
    }

    res.json({ message: 'Berhasil dihapus dari favorit' });
  } catch (error) {
    res.status(500).json({ message: 'Terjadi kesalahan server' });
  }
};
