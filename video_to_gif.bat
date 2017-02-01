@echo off

                        rem    'start_gif' is how many seconds into the video to wait before starting to copy the video
                        rem    Set it to zero if you want to start at the beginning of the video
                        rem    'end_gif' is the second when the copying stops

set start_gif = 0
set end_gif = 10
                        rem    'fps' is frames per second and 'gif_width' is how many pixels wide the final GIF will be
set fps = 15
set gif_width = 480

                        rem    keeps the current directory from changing if a file is dropped in the file explorer from a different folder
cd /d "%~dp0" 

                        rem    If the spot for the video file name isn't blank then it jumps to the make_gif section
if not [%1] == [] goto make_gif

                        rem    If a video file name wasn't given at the command line the message below is echoed and then the program quits
echo Please provide a video file name. Additionally you can include the time in seconds from the video that the GIF starts and ends.
goto:eof


:make_gif

  set "gif_folder=GIFs"
  if not exist %gif_folder% mkdir %gif_folder%
  
                        rem    this splits the file name from the file extension and then uses the name for the GIF
  for %%f in (%1) do ( set "gif_name=%%~nf" )
  set gif_file="%gif_folder%\%gif_name%.gif"
  
                        rem    Assigns default values at the start of the file if none given at command line
  if [%2] == [] ( 
    set start_time = %start_second%
  ) else (
    set start_time = %2
  )
                       
  if [%3] == [] (
    set /A duration = %start_time% + %end_gif%
  ) else (
    set /A duration = %3 - %start_time%
  )

  echo Creating GIF, please wait.
  
                        rem    GIF making information adapted from http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
  
  set palette = "%gif_folder%\palette.png"
  set filters = "fps=%fps,scale=%gif_width%:-2:flags=lanczos"
  
                        rem    the first run generates a global palette of 256 colors that will be used for every frame
                        
			rem    the stats_mode option can be either stats_mode=diff or stats_mode=full
                        rem    stats_mode=full chooses colors that will optimize colors for the entire frame 
                        rem    while stats_mode=diff optimizes colors to make the changes look good 
  start /b /wait ffmpeg.exe -v error -ss %start_time% -t %duration% -i %1 -vf "%filters%,palettegen=stats_mode=diff" -y %palette%
  
                        rem    the second run uses the color palette while making the GIF
  start /b /wait ffmpeg.exe -v error -ss %start_time% -t %duration% -i %1 -i %palette% -lavfi "%filters% [x]; [x][1:v] paletteuse" -y %gif_file%

  rm %palette%
