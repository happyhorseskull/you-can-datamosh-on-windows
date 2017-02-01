@echo off

rem keeps the current directory from changing if a video is dropped on the bat file  
cd /d "%~dp0" 

if not "%1"=="" (
    echo Processing, please wait.
    start /b /wait python-3.6.0\python.exe do_the_mosh_win.py %1
) else (
    echo Please provide a video file name.
)
