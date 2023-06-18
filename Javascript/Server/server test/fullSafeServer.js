// npm install express helmet express-rate-limit hpp

const express = require('express');
const path = require('path');
const helmet = require('helmet'); // for setting HTTP headers
const rateLimit = require("express-rate-limit"); // for rate limiting
const hpp = require('hpp'); // for preventing HTTP Parameter Pollution attacks
const app = express();
const port = 3000;
const { exec } = require('child_process');

// Cybersecurity Headers

// Use Helmet for setting security-related HTTP headers
app.use(helmet());

// Configure rate limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});
app.use(limiter); // apply rate limiting to all requests

// Use hpp to prevent HTTP Parameter Pollution attacks
app.use(hpp());

app.use(express.static(path.join(__dirname, '.')));

app.listen(port, () => {
   console.log(`Server is running at http://localhost:${port}`);
   exec(`start http://localhost:${port}`);
});
