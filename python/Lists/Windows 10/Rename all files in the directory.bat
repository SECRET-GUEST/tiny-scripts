@echo off & setlocal EnableDelayedExpansion 
set a=1
for /f "delims=" %%i in ('dir /b *.png') do (
  ren "%%i" "!a!.png" 
  set /a a+=1
) 