require('dotenv').config();
const express = require('express');
const cors = require('cors');
const connectDB = require('./config/db');

const authRoutes = require('./routes/auth');
const scholarshipRoutes = require('./routes/scholarships');
const favoriteRoutes = require('./routes/favorites');
const userRoutes = require('./routes/users');

const app = express();

connectDB();

app.use(cors());
app.use(express.json());

app.get('/api', (req, res) => {
  res.json({ message: 'BeaKita API is running' });
});

app.use('/api/auth', authRoutes);
app.use('/api/scholarships', scholarshipRoutes);
app.use('/api/favorites', favoriteRoutes);
app.use('/api/users', userRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Terjadi kesalahan server' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
