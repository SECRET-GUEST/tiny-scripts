[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

```
███████╗███████╗██╗     ███████╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██║     ██╔════╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██║     █████╗      ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██║     ██╔══╝      ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗███████╗██║         ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
                                                                                     
```

# HERE, YOU WILL BE SHOWN HOW TO CREATE A SECURE LOCAL SERVER. THESE STEPS ARE RATHER UNNECESSARY; YOU SIMPLY NEED TO USE THE CODE CONTAINED IN server.js. THE REMAINING PORTION IS PURELY EDUCATIONAL, AIMED AT SECURING YOUR WEBSITES ONLINE AND INTRODUCING YOU TO CYBERSECURITY.


# Web Server Launcher Script

This script creates a server to launch and test your web pages. It utilizes the Express framework and requires the installation of the Express package before running it (use `npm install express` command).

There are three versions of the script:

- `server.js`: the basic version.
- `safeServer.js`: adds additional HTTP headers for improved security.
- `fullSafeServer.js`: includes additional measures such as rate limiting and HTTP parameter pollution protection.

## Usage

0. Install Javascript on your machine (Node) : https://nodejs.org/en/download

1. Install the necessary dependencies by running the following command in the project folder:

```
npm install express
```

For `fullSafeServer.js`, run the following additional commands:

```
npm install helmet express-rate-limit hpp
```

2. Save the script to a file in your project folder.

3. Open a terminal or command prompt and navigate to your project folder.

4. Execute the script by running the following command:

```
node server.js
```
Replace `server.js` with `safeServer.js` or `fullSafeServer.js` as needed.

If you're on windows, you also can simply use the batch file I provide by clicking on it, or make yours, just open a new txt file write `node server.js` and rename the file with the name you want + extension `.bat` ( you first have to enable extension modification on your system, it's where you can also chose to display hidden content)

## Creating a Content Security Policy

The `safeServer.js` and `fullSafeServer.js` scripts include a Content Security Policy (CSP) for improved security. The CSP restricts the sources from which certain types of content can be loaded, helping to prevent cross-site scripting (XSS) attacks. You can customize the CSP for your own project by modifying the `Content-Security-Policy` header in the script.

Here is an example of a CSP for a hypothetical domain:

```html
      <meta
        http-equiv="Content-Security-Policy"
        content="default-src 'self';
          script-src 'self' https://code.jquery.com;
          img-src 'self' https://yourDomain.com/*.svg https://yourDomain.com/*.png https://yourDomain.com/*.jpg;
          child-src 'self' https://www.youtube.com;
          style-src 'self'
      ">
```

Replace `yourDomain.com` with your actual domain. You can also adjust the other directives (`script-src`, `img-src`, etc.) as needed.

## Explanation

1. Import the required modules:
   - `express`: A Node.js web application framework.
   - `path`: A Node.js built-in module for working with file paths.
   - `child_process`: A Node.js built-in module for spawning child processes.
   - `helmet` (for `safeServer.js` and `fullSafeServer.js`): A middleware package for setting HTTP headers related to security.
   - `express-rate-limit` (for `fullSafeServer.js`): A middleware package for rate limiting to protect against brute-force attacks.
   - `hpp` (for `fullSafeServer.js`): A middleware package for protecting against HTTP parameter pollution attacks.

2. Create an instance of the Express application.

3. Set the desired port number (default is `3000`). Change this value if needed.

4. Configure Express to serve static files from the current directory.

5. Start the server and log a message to the console indicating the server is running.

6. Execute the `start` command to open a web browser with the server's URL (`http://localhost:<port>`).

Note: Make sure to install the required dependencies and adjust the port number according to your needs.



