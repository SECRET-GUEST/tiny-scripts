// npm install express

const express = require('express');
const path = require('path');
const app = express();
const port = 3000;
const { exec } = require('child_process');

// Cybersecurity Headers

// Middleware to add security headers
app.use(function(req, res, next) {

  // Content Security Policy (CSP)
  // It helps reduce XSS attacks by allowing you to define where resources can be loaded from,
  // preventing browsers from loading data from any other locations.
  // This makes it harder for an attacker to inject malicious code into your site.
  res.setHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' https://code.jquery.com; img-src 'self' data:; child-src 'self' https://www.youtube.com; style-src 'self' 'unsafe-inline';");

  // HTTP Strict Transport Security (HSTS)
  // This header tells the browser to always use HTTPS.
  // This helps prevent man in the middle attacks and cookie hijacking.
  res.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");

  // X-Content-Type-Options
  // This header prevents the browser from interpreting files as a different MIME type to what is specified in the Content-Type HTTP header.
  // This helps prevent attacks where an HTML file is served with a MIME type that is interpreted as something else.
  res.setHeader("X-Content-Type-Options", "nosniff");

  // X-Frame-Options
  // This header tells the browser whether the site can be framed.
  // Not allowing the site to be iframed helps prevent clickjacking attacks.
  res.setHeader("X-Frame-Options", "SAMEORIGIN");

  next();
});

app.use(express.static(path.join(__dirname, '.')));

app.listen(port, () => {
   console.log(`Server is running at http://localhost:${port}`);
   exec(`start http://localhost:${port}`);
});
