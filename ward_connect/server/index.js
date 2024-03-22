const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const cors = require('cors'); // Import the cors package
const PORT = process.env.PORT || 8080;
const app = express();
require('dotenv').config();

// Use the cors middleware
app.use(cors());

app.use(express.json());
app.use(authRouter);

const DB = process.env.DB;
mongoose.connect(DB).then(() => {
  console.log('DB connection successful');
}).catch(err => {
  console.error('DB connection failed:', err);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
