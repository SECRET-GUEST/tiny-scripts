[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

```
███████╗███████╗██╗     ███████╗    ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗ 
██╔════╝██╔════╝██║     ██╔════╝    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██║     █████╗      ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██║     ██╔══╝      ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗███████╗██║         ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
                                                                                     
```

# Web Server Launcher Script

This script creates a server to launch and test your web pages. It utilizes the Express framework and requires the installation of the Express package before running it (use `npm install express` command).

## Usage

0. Install Javascript on your machine (Node) : https://nodejs.org/en/download

1. Install the necessary dependencies by running the following command in the project folder:
    ```bash
    npm install express
    ```

2. Save the script to a file (e.g., `server.js`) in your project folder.

3. Open a terminal or command prompt and navigate to your project folder.

4. Execute the script by running the following command:
    ```bash
    node server.js
    ```
If you're on windows, you also can simply use the batch file I provide by clicking on it, or make yours, just open a new txt file write `node server.js` and rename the file with the name you want + extension `.bat` ( you first have to enable extension modification on your system, it's where you can also chose to display hidden content)

## Explanation

1. Import the required modules:
   - `express`: A Node.js web application framework.
   - `path`: A Node.js built-in module for working with file paths.
   - `child_process`: A Node.js built-in module for spawning child processes.

2. Create an instance of the Express application.

3. Set the desired port number (default is `3000`). Change this value if needed.

4. Configure Express to serve static files from the current directory.

5. Start the server and log a message to the console indicating the server is running.

6. Execute the `start` command to open a web browser with the server's URL (`http://localhost:<port>`).

Note: Make sure to install the required dependencies and adjust the port number according to your needs.

