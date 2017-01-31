@echo off
if "%1"=="" (
    echo Please provide a video file name.
    goto:eof
  ) else (
    echo Processing, please wait.
    start /b /wait python-3.6.0\python.exe do_the_mosh.py %1
)
