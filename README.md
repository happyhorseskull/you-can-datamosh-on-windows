# you-can-datamosh-on-windows

Hello, friends! Now you can datamosh from the command line on Windows!

What's a datamosh?

Here's an example made by someone who wasn't me!

https://vimeo.com/87545616

The mosh works out of the box but I left extensive notes in the program to help you use it and understand what's happening.

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

(If you click on datamosh.bat in the file explorer window no moshing will occur. Instead you'll see a little white screen flash by.)

The datamoshed video will be in a new folder: `moshed_videos\`

If you get a `system can not find file` error at the command line it usually means you forgot to unzip the files or put them in the right folder which is totally okay and nothing to feel bad about. (I forgot like 3 times while testing the code.)

Good luck, friends!

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

Got 'em? Great. Because .bat folders are real picky about file names you'll want to make sure of a few details. The Python folder should be named python-3.6.0 and Python.exe with a bunch of other files should be in the main python-3.6.0 folder. ffmpeg.exe should be in the `you-can-datamosh-on-windows-master` folder. youtube-dl.exe can go in whichever folder you prefer.

I didn't want to zip ffmpeg.exe but the file size is 37 MB and github has a 25 MB file size limit. Embeddable Python was included because the usual route for this sort of thing involves editing the Windows path. An activity I've never enjoyed doing or explaining. But if that's something you know how to do or want to learn how to do then you won't have the .bat file holding you back while programming in Python and experiencing the joy of datamoshing.

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
