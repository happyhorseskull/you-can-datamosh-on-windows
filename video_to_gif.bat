@echo off

                        rem    This assumes you want a GIF that's shorter than the entire video.  
                        rem    Start time is how many seconds into the video to wait before starting to record the GIF
                        rem    Set it to zero if you want to start at the beginning of the video
                        
                        rem    length sets how long the GIF will record. 
                        rem    If start is set to 4 and length set to 5 the GIF will record seconds 4 through 9 of the video
set start=0
set length=10

                        rem keeps the current directory from changing if a file is dropped in the file explorer from a different folder
cd /d "%~dp0" 

if not [%1] == [] goto make_gif

echo Please provide a video file name. Additionally you can include the second from the video that the GIF starts on and the GIF's length in seconds.
goto:eof

:make_gif

  set "gif_folder=GIFs"
  if not exist %gif_folder% mkdir %gif_folder%
                        rem    this splits the file name from the file extension and then uses the name for the GIF
  for %%f in (%1) do ( set "gif_name=%%~nf" )
  set gif_file="%gif_folder%\%gif_name%.gif"
  
                        rem    GIF making information adapted from http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html
  if [%2] == [] ( 
    set start_time=%start%
  ) else (
    set start_time=%2
  )
                       
  if [%3] == [] (
    set duration=%length%
  ) else (
    set duration=%3
  )

  echo Creating GIF, please wait.
  
  set palette="%gif_folder%\palette.png"
  set filters="fps=15,scale=480:-2:flags=lanczos"
  
                        rem    the first run generates a global palette of 256 colors that will be used for every frame
                        
			                  rem    the stats_mode option can be either stats_mode=diff or stats_mode=full
                        rem    stats_mode=full chooses colors that will optimize colors for the entire frame 
                        rem    while stats_mode=diff optimizes colors to make the changes look good 
  start /b /wait ffmpeg.exe -v warning -ss %start_time% -t %duration% -i %1 -vf "%filters%,palettegen=stats_mode=diff" -y %palette%
  
                        rem    the second run uses the color palette while making the GIF
  start /b /wait ffmpeg.exe -v warning -ss %start_time% -t %duration% -i %1 -i %palette% -lavfi "%filters% [x]; [x][1:v] paletteuse" -y %gif_file%

  rm %palette%
