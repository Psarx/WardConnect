const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const cors = require('cors'); // Import the cors package
const PORT = process.env.PORT || 8080;
const app = express();
const cookieParser = require('cookie-parser');
require('dotenv').config();

// Use the cors middleware
app.use(cors());

app.use(express.json());
app.use(authRouter);
app.use("/api/auth", authRoutes);
app.use("/api/user", userRoutes);
app.use((req, res, next) => {
  // Middleware logic
  next();
});
// Parse cookies
app.use(cookieParser());
const DB = process.env.DB;
//mongo db connection 16-21
mongoose.connect(DB).then(() => {
  console.log('DB connection successful');
}).catch(err => {
  console.error('DB connection failed:', err);
});
// opening expreesjs
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
