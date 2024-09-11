@echo off
REM  batch script for loading git-bash and the vs tools in the same window
REM  inspiration: http://www.drrandom.org/post/2011/11/16/Grappling-with-multiple-remotes-in-git-tfs.aspx
REM  screenshot: https://twitter.com/#!/tim_abell/status/199474387731226624/photo/1
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat" amd64
REM echo Use full exe names when running under bash, e.g. "msbuild.exe"
REM echo Loading bash, you may now use git and msbuild in the same console \o/.
"C:\Users\agorodetzky\AppData\Local\Programs\Git\bin\sh.exe" --login -i
