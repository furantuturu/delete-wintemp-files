@echo off

setlocal enabledelayedexpansion

set tempfiles[0]=C:\Users\fuwan\AppData\Local\Temp\*
set tempfiles[1]=C:\Windows\Temp\*

set /a len=1

set /p delPrefetch="Do you also want to delete files inside prefetch directory?[y / n]: "

echo.

if %delPrefetch%==y (
    set tempfiles[2]=C:\Windows\Prefetch\*
    set /a len=2
) else if %delPrefetch%==n (
    echo Prefetch files will not be involed for deletion
    echo.
) else if %delPrefetch% neq y if %delPrefetch% neq n (
    exit
)


for /l %%i in (0, 1, %len%) do (
    del /q !tempfiles[%%i]!
)

endlocal

echo.

pause
