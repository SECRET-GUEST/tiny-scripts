@echo off
setlocal

set "drive=X:"
set "passes=3"

echo Starting secure data erasure on %drive%...
for /l %%i in (1,1,%passes%) do (
    echo Pass %%i of %passes%...
    dd if=/dev/zero of=%drive% bs=4M
)

echo Secure data erasure completed on %drive%.
endlocal
