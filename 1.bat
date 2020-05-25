@echo off
title Windows全版本激活工具-自动续期服务
color 3f
echo. 
echo.
echo. 正在进行自动续期，请稍后，完成后会自动关闭本窗口
cscript //Nologo %windir%\system32\slmgr.vbs /ato
exit

