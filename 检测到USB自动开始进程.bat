@echo off
title USB Desktop Opener

:check
for /f "tokens=1" %%D in ('wmic logicaldisk get deviceid ^| find ":"') do (
    if exist "%%D\." (
        if not "%%D"=="C:" (
            echo 检测到可能的U盘：%%D

            start "" "%USERPROFILE%\Desktop"

            timeout /t 5 /nobreak >nul
            exit
        )
    )
)

timeout /t 2 /nobreak >nul
goto check