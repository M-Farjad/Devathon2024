const express = require('express');
const app = express();
const authRoutes = require('./routes/authRoutes');
const testRoutes = require('./routes/testRoutes');

app.use(express.json());
app.use('/auth', authRoutes);
app.use('/test', testRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
