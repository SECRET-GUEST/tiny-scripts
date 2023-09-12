@echo off
for /r %%A in (*.pyc) do del "%%A"
for /r %%A in (*.pyo) do del "%%A"
for /r %%A in (*.~) do del "%%A"
for /d /r . %%D in (__pycache__) do @if exist "%%D" rd /s /q "%%D"
