# you-can-datamosh-on-windows

Hello, friends! Now you can datamosh from the command line on Windows!
(or you can drag and drop a video file on top of datamosh.bat in the file explorer window)

What's a datamosh? Here's an example made by someone who wasn't me!

https://vimeo.com/87545616

The mosh works out of the box and produces videos ready for social media sites like Twitter but I left extensive notes in the program to help you adjust settings and understand what's happening.

How to run the program after it's downloaded:

- Unzip you-can-datamosh-on-windows-master.zip then the files inside: ffmpeg.zip and python-3.6.0.zip
- make sure the Python folder is named python-3.6.0 and that Python.exe and a bunch of other files are in the main python-3.6.0 folder.
- ffmpeg.exe should be in the `you-can-datamosh-on-windows-master` folder

There are two ways to run the datamoshing program:

- If you have Python 3.6 installed and know how to use it run:

`do_the_mosh_win.py [video file name]`

(Other versions of Python might work but I've only tested this with Python 3.6)

or:
- press the Windows button and type `cmd` to open the command prompt and go to the `you-can-datamosh-on-windows-master` folder.
- Then run this command:

`datamosh.bat [video file name]`

which is a convenient way of running this command:

`python-3.6.0\Python.exe do_the_mosh_win.py [video file name]`

You can also drag and drop the video on top of datamosh.bat in the file explorer window and it will run the file.
(However, if you just click on datamosh.bat in the file explorer window no moshing will occur. Instead you'll see a little white screen flash by.)

The datamoshed video will be in a new folder: `moshed_videos\`

If you get a `system can not find file` error at the command line it usually means you forgot to unzip the files or put them in the right folder which is totally okay and nothing to feel bad about. (I forgot like 3 times while testing the code.)

You can most easily reach me on twitter. I am @happyhorseskull there as well.

Good luck, friends!

#

Editing the Python file is easy with a simple code editor like Notepad++ https://notepad-plus-plus.org/

If your code editing session gets wild and you're not sure how to fix `do_the_mosh_win.py` you can always re-download the code from here.

# 

GIF? GIF!

Okay so mp4 files are fun and good but what about GIFs? That is not a problem with ffmpeg.exe.

`ffmpeg.exe -v error -i moshed_videos\moshed_[moshed video file name].mp4 [file name].gif`

Note: the default settings in `do_the_mosh_win.py` produce 60 second videos which is a bit much for a GIF and you'll want to edit the video output settings down to maybe around 10 seconds or less so when you convert the mp4 you aren't getting 84 MB GIF files that cause a lot of GIF players to give up and crash. ffmpeg offers a trim command which might be real handy https://ffmpeg.org/ffmpeg-filters.html#trim
 

--ADVANCED GIF LEARNING--

The results from the above command will be okay but if you want to improve the output you'll find ideas here: http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html

Unfortunately, that's written for Linux and the commands won't translate over to Windows as they're written.


command translations:

Linux        Windows

`ffmpeg    => ffmpeg.exe

ls        => dir

./gif.sh  =>` that runs a shell file on Linux which is like a batch file on Windows

Gonna have a TBH moment here with you. I've only run the high-quality-gif commands from that blog post on Linux and never Windows so I don't have a lot of guidance to offer you on this path.

#

Where did those .exe files come from?? I WILL TELL YOU BECAUSE WE ARE FRIENDS AND I WANT YOU TO FEEL SAFE.

-ffmpeg.exe is the 32-bit, 3.2.2 build from here:
https://ffmpeg.zeranoe.com/builds/

-Python 3.6.0 is the Windows x86 embeddable zip file from here:
https://www.python.org/downloads/release/python-360/

-youtube-dl.exe is the Windows executable from here:
https://rg3.github.io/youtube-dl/

Note: youtube-dl.exe will be out of date by the time you get this and you'll want to update it with the command:

`youtube-dl.exe --update`

#

We just met. I completely understand if you don't totally trust me and want to go to those sites and download the files yourself.
Really I just included them for your conveinence. No big deal. My feelings are fine..no just go do it..go..I'll wait here.

Got 'em? Great. Bat files are real picky about file names so you'll want to make sure a few details are correct. The Python folder should be named python-3.6.0 and contain Python.exe with a bunch of other files in the main python-3.6.0 folder. ffmpeg.exe should be in the `you-can-datamosh-on-windows-master` folder. youtube-dl.exe can go in whichever folder you prefer or on your desktop or whatever.

I didn't want to zip ffmpeg.exe but the file size is 37 MB and github has a 25 MB file size limit. Embeddable Python was included because the usual route for this sort of thing involves editing the Windows path variable. I've never enjoyed doing or explaining how to edit the path variable so I included Python as a convenint shortcut for both of us.

#

Need videos to mosh? I've included youtube-dl.exe to help you out!
Downloading youtube videos is as simple as:

`youtube-dl.exe --format 18 [youtube video url] -o youtube_video.mp4`

But wait, there's more: youtube-dl.exe works with lots of other sites like vimeo and can grab most twitter videos. 
To discover if a site is supported try:

`youtube-dl.exe --list-formats [website url]`

which will show a list of available formats for the video on the page.

NOTE: If youtube-dl fails to download youtube videos try it on another site before deciding youtube-dl is broken. 
Sometimes youtube makes changes to its video player and it takes the youtube-dl team a few days to catch up.
