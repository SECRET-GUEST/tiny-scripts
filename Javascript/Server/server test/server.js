// Short program who create a server to launche and test your web pages
// you have to install first express in the folder ( npm install express )

const express = require('express');
const path = require('path');
const app = express();
const port = 3000;                                  // default port, change this to your own port
const { exec } = require('child_process');

app.use(express.static(path.join(__dirname, '.'))); // Will serve static file in the folder where you launched it

app.listen(port, () => {
   console.log(`Server is running at http://localhost:${port}`);
   exec(`start http://localhost:${port}`);
});
