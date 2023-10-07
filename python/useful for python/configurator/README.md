Python 3.10
```
 ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ 
██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝     ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗    ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║    ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝     ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
                                                                                                                 
```

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Config](https://img.shields.io/badge/Config-Manager-green)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

# 📝 Description

`ConfigManager` is a simple and intuitive configuration manager for Python applications. It allows you to easily read and update configuration values from an INI file, making it a breeze to import and use in your Python projects without redundant information.

# 🔑 Key Features

- 📄 Read and write configuration values from INI files.
- 🧩 Easily importable and usable in your Python projects.
- 🛠️ Simplified interface to access and modify configuration values.
- 💾 Automatically saves updated configuration values to the file.
 
# 🛠️ Usage

1. Import the `config_manager.py` file in your Python project:

```python
from config_manager import ConfigManager
```
2. Create a ConfigManager instance with the path to your config.ini file:
```
config_manager = ConfigManager("config.ini")
```

3. Use the `ConfigManager` to read and update configuration values:
```python
# Read values from the configuration
app_name = config_manager.get("general", "name")
app_version = config_manager.get("general", "version")
db_host = config_manager.get("database", "host")

# Update a value in the configuration and save
config_manager.set("general", "version", "1.1.0")
```
 
## :scroll: License

This repository is released under the [MIT License](LICENSE). Please see the `LICENSE` file for more information.

## :question: Support & Questions

If you have any questions or need support, please feel free to open an issue or join my twitter.
