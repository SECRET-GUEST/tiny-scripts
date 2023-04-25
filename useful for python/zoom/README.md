Python 3.10

```python
#███████╗ ██████╗  ██████╗ ███╗   ███╗    ██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██╗     ███████╗██████╗ 
#╚══███╔╝██╔═══██╗██╔═══██╗████╗ ████║    ██║  ██║██╔══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔══██╗
#  ███╔╝ ██║   ██║██║   ██║██╔████╔██║    ███████║███████║██╔██╗ ██║██║  ██║██║     █████╗  ██████╔╝
# ███╔╝  ██║   ██║██║   ██║██║╚██╔╝██║    ██╔══██║██╔══██║██║╚██╗██║██║  ██║██║     ██╔══╝  ██╔══██╗
#███████╗╚██████╔╝╚██████╔╝██║ ╚═╝ ██║    ██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗███████╗██║  ██║
#╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝                                                                     
```

![Python](https://img.shields.io/badge/Python-3.x-blue)
![PyQt5](https://img.shields.io/badge/PyQt5-Compatible-orange)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow)

# 🔍 Zoom Module for PyQt5 Applications

This Zoom Module allows you to easily enable zoom functionality in your PyQt5 applications. Users can zoom in and out using the mouse wheel (while holding the CTRL key) or the "+" and "-" keys. The module is designed to be as simple as possible to integrate into your projects.

# 📌 Usage

1. Copy the `zoom_handler.py` file into your project directory.

2. Import the `enable_zoom` function from the `zoom_module.py` file:


```python
from zoom_module import enable_zoom
```

3. Call the enable_zoom function with your main widget as an argument:


```python
enable_zoom(my_main_widget)
```

📚 Example
Here is an example of how to use the Zoom Module in a PyQt5 application:

```python
from PyQt5.QtWidgets import QApplication, QMainWindow
from zoom_handler import enable_zoom

class MyWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        # Enable zooming for this window
        enable_zoom(self)

if __name__ == "__main__":
    app = QApplication([])
    window = MyWindow()
    window.show()
    app.exec_()
```
 
## :scroll: License

This repository is released under the [MIT License](LICENSE). Please see the `LICENSE` file for more information.

## :question: Support & Questions

If you have any questions or need support, please feel free to open an issue or join my twitter.
