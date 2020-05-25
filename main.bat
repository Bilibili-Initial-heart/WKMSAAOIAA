@echo off
set ver=19.5
set /a kmscount=0
set fwq=kms.lotro.cc
color 3f
@title Windows全版本激活工具-检查kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
:fail
cls
echo.
echo.
echo.
echo.与激活服务器连接失败，请检查您的网络连接或重新选择kms服务器再试。
echo. 1.进入主页
echo. 2.重新选择kms服务器
echo. 3.退出程序
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
title Windows全版本激活工具
:rukou
title Windows全版本激活工具
for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j
color 3f
:loop
cls
echo.     
echo. 
echo.                                kms服务器：%fwq%
echo. 
echo.                              1.激活Office
echo.                              2.激活Windows 
echo.                              3.安装Office
echo.                              4.自定义kms服务器
echo.                              5.检查当前kms服务器
echo.                              6.检查当前系统激活情况
echo.                              7.系统激活信息
echo.                              8.安装自动续期服务（不支持卸载）
choice /c 1234567890F /n /m "请选择: "
if %errorlevel%==1 goto office
if %errorlevel%==2 goto windows
if %errorlevel%==3 goto setupo
if %errorlevel%==4 goto set
if %errorlevel%==5 goto checkkms
if %errorlevel%==6 goto checkact
if %errorlevel%==7 goto inf
if %errorlevel%==8 goto zidongxvqi
goto :loop
:ml
cls
echo.                             
echo.
echo.                          请选择要操作的命令
echo.                       1.激活系统（slmgr.vbs /ato）
echo.                       2.安装密钥（slmgr.vbs /ipk xxxxx）
echo.                       3.返回主菜单
echo.                       
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 slmgr.vbs /ato 
if %errorlevel%==2 goto my
if %errorlevel%==3 goto loop
goto loop
:my
cls
echo.                             
echo.
echo.        请输入要安装的密钥
set /p key=请输入
slmgr.vbs /ipk %key%
pause
goto loop
:office
@title Windows全版本激活工具-Office选择菜单
color 3f
cls
echo.                             
echo.
echo.                       
echo.
echo.                                 Windows全版本激活工具
echo.                              1.激活office2019
echo.                              2.激活office2016
echo.                              3.激活office2013
echo.                              4.激活ofice2010
echo.                              5.返回主菜单
echo.       
echo.                              
choice /c 12345 /n /m "请选择: "
if %errorlevel%==1 goto :job19
if %errorlevel%==2 goto :job16
if %errorlevel%==3 goto :job13
if %errorlevel%==4 goto :job2010
if %errorlevel%==5 goto rukou
:job19
@title Windows全版本激活工具- Office2019
cls
echo 正在安装许可证
(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
cscript //nologo ospp.vbs /unpkey:6MWKP >nul&cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul
echo 正在进行 KMS 激活，请稍后...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job16
@title Windows全版本激活工具- office2016 / 365
setlocal EnableDelayedExpansion&color 3f & cd /d "%~dp0"
title Windows全版本激活工具-Office 2016 / 365

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
cls

echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cls

echo 正在安装 MAK 许可证...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cls

echo 正在导入 KMS GVLK...
cscript ospp.vbs /inpkey:NYH39-6GMXT-T39D4-WVXY2-D69YY >nul
cscript ospp.vbs /inpkey:7WHWN-4T7MP-G96JF-G33KR-W8GF4 >nul
cscript ospp.vbs /inpkey:RBWW7-NTJD4-FFK2C-TDJ7V-4C2QP >nul
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul
cscript ospp.vbs /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT >nul
cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK >nul
cscript ospp.vbs /inpkey:JNRGM-WHDWX-FJJG3-K47QV-DRTFM 1>nul 2>nul
cls

echo 正在尝试 KMS 激活...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit
:job13
title Windows全版本激活工具-Office 2013
cls
@echo.
@echo.正在检查office版本
if exist "%ProgramFiles%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office15"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
cls
echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses15\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
cls

echo 正在安装 MAK 许可证...
for /f %%x in ('dir /b ..\root\Licenses15\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
cls
echo.正在安装kms产品密钥
cscript ospp.vbs /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT >nul
cscript ospp.vbs /inpkey:KBKQT-2NMXY-JJWGP-M62JB-92CD4 >nul
cscript ospp.vbs /inpkey:FN8TT-7WMH6-2D4X9-M337T-2342K >nul
cscript ospp.vbs /inpkey:6NTH3-CW976-3G3Y2-JK3TX-8QHTT >nul
cscript ospp.vbs /inpkey:C2FG9-N6J68-H8BTJ-BW3QX-RM3B3 >nul
cscript ospp.vbs /inpkey:J484Y-4NKBF-W2HMG-DBMJC-PGWR7 >nul
cls
echo 正在尝试 KMS 激活...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job2010
title Windows全版本激活工具-Office 2010
cls
color 3f & cd /d "%~dp0"
echo.正在检查office版本
if exist "%ProgramFiles%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office14"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
cls
echo 正在安装 KMS 许可证...
for /f %%x in ('dir /b ..\root\Licenses14\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
cls

echo 正在安装 MAK 许可证...
for /f %%x in ('dir /b ..\root\Licenses14\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
cls
echo.正在安装office产品密钥
cscript ospp.vbs /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB >nul
cscript ospp.vbs /inpkey:V7QKV-4XVVR-XYV4D-F7DFM-8R6BM >nul
cscript ospp.vbs /inpkey:D6QFG-VBYP2-XQHM7-J97RH-VVRCK >nul
cscript ospp.vbs /inpkey:D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ >nul
cscript ospp.vbs /inpkey:7MCW8-VRQVK-G677T-PDJCM-Q8TCP >nul
cscript ospp.vbs /inpkey:767HD-QGMWX-8QTDB-9G3R2-KHFGJ >nul
cls
echo 正在尝试 KMS 激活...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit
:officesucc
echo.
echo.
echo.您已经成功的激活了office
echo.
echo.
echo.
echo. 
echo. 
echo.  1.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto rukou
goto rukou
:officefail
echo.
echo.
echo.  激活office过程中出错
echo.
echo. 
echo. 
echo. 
echo.
echo.  1.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto rukou
goto rukou
:windows
@title Windows全版本激活工具-Windows激活前检查
cls
echo.
echo.
echo.
echo 正在检查系统是否永久激活……
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久激活"  > NUL &&  goto 56781
:abc
@title Windows全版本激活工具-Windows选择菜单
color 3f
cls
echo.                             
echo.
echo.                       当前系统为%sysinfo%
echo.
echo.                              
echo.                              1.激活windows10 
echo.                              2.激活windows8 / 8.1 
echo.                              3.激活Windows7 
echo.                              4.激活Windows Server 2012
echo.                              5.激活Windows Server 2012 R2
echo.                              6.激活Windows Server 2008
echo.                              7.激活Windows Server 2008 R2
echo.                              8.激活Windows Server 2016
echo.                              9.激活Windows Server 2019
echo.                              0.激活Windows Server, version 1909, version 1903, and version 1809
echo.                              A.返回主菜单（选择本选项时，请大写输入）
echo.
echo.
echo.
choice /c x1234567890A /n /m "请选择: "
if %errorlevel%==1 goto :all
if %errorlevel%==2 goto :job2
if %errorlevel%==3 goto :job3
if %errorlevel%==4 goto :job4
if %errorlevel%==5 goto :job5
if %errorlevel%==6 goto :job6
if %errorlevel%==7 goto :job7
if %errorlevel%==8 goto :job8
if %errorlevel%==9 goto :ser2016
if %errorlevel%==10 goto :ser2019
if %errorlevel%==11 goto :ser1909
if %errorlevel%==12 goto rukou
goto job00
:job2
title Windows全版本激活工具-Windows10  
cls
echo.
echo.       
echo.   当前系统为%sysinfo%
echo.        
echo.         选择你的系统版本
echo.
echo.       0.Windows 10 全版本永久激活（这个看运气）
echo.       1.Windows 10 专业工作站
echo.       2.Windows 10 专业工作站 N
echo.       3.Windows 10 专业教育版
echo.       4.Windows 10 专业教育版 N
echo.       5.Windows 10 专业版
echo.       6.Windows 10 企业版
echo.       7.Windows 10 教育版
echo.       8.Windows 10 企业版 LTSB 2015
echo.       9.Windows 10 专业版 N
echo.       10.Windows 10 企业版 N
echo.       11.Windows 10 教育版 N
echo.       12.Windows 10 企业版 LTSB 2015 N
echo.       13.Windows 10 家庭版（新增）
echo.       14.Windows 10 企业版 2016 长期服务版(LTSB 2016)
echo.       15.Windows 10 企业版 LTSC 2019
echo.       16.Windows 10 企业版 N LTSC 2019
echo.       17.Windows 10 企业版 2016 长期服务版 N (LTSB 2016 N)
echo.       18.返回主菜单
echo.  注意：使用永久激活所有版本均会变为专业版
echo.        版本改变，系统仍然可以正常使用并永久激活
echo.        如果已经变为专业版，可以使用原来对应版本kms激活方式变回去
echo.
set /p abc="请选择并按下回车键: "
if %abc%==0 goto :10yongjiu
if %abc%==1 goto :10prow
if %abc%==2 goto :10pronw
if %abc%==3 goto :10eduw
if %abc%==4 goto :10edunw
if %abc%==5 goto :10pro
if %abc%==6 goto :10ent
if %abc%==7 goto :10edu
if %abc%==8 goto :10entlstb
if %abc%==9 goto :10pron
if %abc%==10 goto :10entn
if %abc%==11 goto :10edun
if %abc%==12 goto :10entlstbn
if %abc%==13 goto :10home
if %abc%==14 goto :10long2016
if %abc%==15 goto :10long2019
if %abc%==16 goto :10longn2019
if %abc%==17 goto :10longn2016
if %abc%==18 goto rukou
goto job2

:10prow
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
goto :10activate

:10pronw
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk 9FNHH-K3HBT-3W4TD-6383H-6XYWF
set key=9FNHH-K3HBT-3W4TD-6383H-6XYWF
goto :10activate

:10eduw
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y 
set key=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
goto :10activate

:10edunw
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk YVWGF-BXNMC-HTQYQ-CPQ99-66QFC 
set key=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC
goto :10activate

:10pro
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX 
set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
goto :10activate

:10pron
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk MH37W-N47XK-V7XM9-C7227-GCQG9 
set key=MH37W-N47XK-V7XM9-C7227-GCQG9
goto :10activate

:10ent
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 
set key=NPPR9-FWDCX-D2C8J-H872K-2YT43
goto :10activate

:10entn
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 
set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
goto :10activate

:10edu
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 
set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto :10activate

:10edun
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ 
set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
goto :10activate

:10entlstb
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 
set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
goto :10activate

:10entlstbn
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ 
set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ
goto :10activate

:10home
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
goto :10activate

:10long2016
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
goto :10activate

:10long2019
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D
goto :10activate

:10longn2019
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H
goto :10activate

:10longn2016
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639
goto :10activate

:10yongjiu
cls
echo 尝试进行永久激活。
cscript //Nologo %windir%\system32\slmgr.vbs /ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T
cscript //Nologo %windir%\system32\slmgr.vbs /ato | find "成功"  > NUL &&  goto yj
cscript //Nologo %windir%\system32\slmgr.vbs /ipk QJNXR-YD97Q-K7WH4-RYWQ8-6MT6Y
cscript //Nologo %windir%\system32\slmgr.vbs /ato | find "成功"  > NUL &&  goto yj
cls
echo.
echo.
echo.永久激活失败，请使用对应版本的KMS激活方式
echo.
echo.
echo.
echo.
echo.
pause >nul
goto job2
:yj
cls
echo.
echo.
echo.
echo.当前系统已经成功永久激活
echo. 
echo. 
echo.
echo.1.退出程序
echo.2.继续激活其他产品
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 exit
if %errorlevel%==2 goto rukou
:10activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：w10%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job3
cls
title Windows全版本激活工具-Windows8 / 8.1  
echo.
echo.     当前系统为%sysinfo% 
echo.
echo.   选择你的系统版本
echo. 1.Windows 8 专业版
echo. 2.Windows 8 企业版
echo. 3.Windows 8 专业版 N
echo. 4.Windows 8 企业版 N 
echo. 5.Windows 8.1 专业版
echo. 6.Windows 8.1 企业版
echo. 7.Windows 8.1 专业版 N
echo. 8.Windows 8.1 企业版 N 
echo. 9.返回主菜单
choice /c 123456789 /n /m "请选择: "
if %errorlevel%==1 goto :8pro
if %errorlevel%==2 goto :8ent
if %errorlevel%==3 goto :8pro1
if %errorlevel%==4 goto :8ent1
if %errorlevel%==5 goto :8.1pro
if %errorlevel%==6 goto :8.1ent
if %errorlevel%==7 goto :8.1pro1
if %errorlevel%==8 goto :8.1ent1
if %errorlevel%==9 goto rukou
goto job3
:8pro
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  NG4HW-VH26C-733KW-K6F98-J8CK4
set key=NG4HW-VH26C-733KW-K6F98-J8CK4
goto :8.1activate
:8ent
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  32JNW-9KQ84-P47T8-D8GGY-CWCK7
set key=32JNW-9KQ84-P47T8-D8GGY-CWCK7
goto :8.1activate
:8pro1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  XCVCF-2NXM9-723PB-MHCB7-2RYQQ 
set key=XCVCF-2NXM9-723PB-MHCB7-2RYQQ
goto :8.1activate
:8ent1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  JMNMF-RHW7P-DMY6X-RF3DR-X2BQT 
set key=JMNMF-RHW7P-DMY6X-RF3DR-X2BQT
goto :8.1activate
:8.1pro
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  GCRJD-8NW9H-F2CDX-CCM8D-9D6T9  
set key=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
goto :8.1activate
:8.1ent
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 
set key=MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
goto :8.1activate
:8.1pro1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  HMCNV-VVBFX-7HMBH-CTY9B-B4FXY   
set key=HMCNV-VVBFX-7HMBH-CTY9B-B4FXY
goto :8.1activate
:8.1ent1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  TT4HM-HN7YT-62K67-RGRQJ-JFFXW 
set key=TT4HM-HN7YT-62K67-RGRQJ-JFFXW
goto :8.1activate
:8.1activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq%  
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：w81%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job4
cls
title Windows全版本激活工具-Windows7  
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows 7 专业版
echo. 2.Windows 7 企业版
echo. 3.Windows 7 专业版 N
echo. 4.Windows 7 企业版 N
echo. 5.Windows 7 企业版E 
echo. 6.Windows 7 旗舰版
echo. 7.Windows 7 家庭普通版
echo. 8.Windows 7 家庭高级版
echo. 9.返回主菜单
choice /c 123456789  /n /m "请选择: "
if %errorlevel%==1 goto :7pro
if %errorlevel%==2 goto :7ent
if %errorlevel%==3 goto :7pro1
if %errorlevel%==4 goto :7ent1
if %errorlevel%==5 goto :7ent2
if %errorlevel%==6 goto :7qjb
if %errorlevel%==7 goto :win7hb
if %errorlevel%==8 goto :win7hp
if %errorlevel%==9 goto rukou
goto job4
:7pro
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4  
set key=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
goto :7activate
:7ent
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  33PXH-7Y6KF-2VJC9-XBBR8-HVTHH 
set key=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
goto :7activate
:7pro1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  MRPKT-YTG23-K7D7T-X2JMM-QY7MG   
set key=MRPKT-YTG23-K7D7T-X2JMM-QY7MG
goto :7activate
:7ent1
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  YDRBP-3D83W-TY26F-D46B2-XCKRJ 
set key=YDRBP-3D83W-TY26F-D46B2-XCKRJ
goto :7activate
:7ent2
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  C29WB-22CC8-VJ326-GHFJW-H9DH4 
set key=C29WB-22CC8-VJ326-GHFJW-H9DH4
goto :7activate
:7qjb
cls
title Windows全版本激活工具-Windows7 旗舰版
echo.
echo.  
echo.
echo.   请选择激活方式（推荐先尝试方法1，如果不成功再使用方法2）
echo. 1.神key激活
echo. 2.安装slic模拟程序激活
echo. 3.返回主菜单
choice /c 123  /n /m "请选择: "
if %errorlevel%==1 goto :7key
if %errorlevel%==2 goto :win7u
if %errorlevel%==3 goto rukou
:7key
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  RHTBY-VWY6D-QJRJ9-JGQ3X-Q2289 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久"  > NUL &&  goto ss
:7activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：w07%sysinfo%%fwq%%errorcode%
echo.  系统激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job5
cls
title Windows全版本激活工具-Windows Server 2012 
echo.
echo.     当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2012 
echo. 2.Windows Server 2012 N  
echo. 3.Windows Server 2012 单语言版
echo. 4.Windows Server 2012 特定国家/地区
echo. 5.Windows Server 2012 Server 标准版
echo. 6.Windows Server 2012 MultiPoint Standard
echo. 7.Windows Server 2012 MultiPoint 高级版
echo. 8.Windows Server 2012 数据中心版
echo. 9.返回主菜单
choice /c 123456789 /n /m "请选择: "
if %errorlevel%==1 goto :S1211
if %errorlevel%==2 goto :S1212
if %errorlevel%==3 goto :S1213
if %errorlevel%==4 goto :S1214
if %errorlevel%==5 goto :S1215
if %errorlevel%==6 goto :S1216
if %errorlevel%==7 goto :S1217
if %errorlevel%==8 goto :S1218
if %errorlevel%==9 goto rukou
goto job5
:S1211
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  BN3D2-R7TKB-3YPBD-8DRP2-27GG4 
set key=BN3D2-R7TKB-3YPBD-8DRP2-27GG4
goto :S112activate
:S1212
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  8N2M2-HWPGY-7PGT9-HGDD8-GVGGY 
set key=8N2M2-HWPGY-7PGT9-HGDD8-GVGGY
goto :S112activate
:S1213
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  2WN2H-YGCQR-KFX6K-CD6TF-84YXQ 
set key=2WN2H-YGCQR-KFX6K-CD6TF-84YXQ
goto :S112activate
:S1214
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  4K36P-JN4VD-GDC6V-KDT89-DYFKP 
set key=4K36P-JN4VD-GDC6V-KDT89-DYFKP
goto :S112activate
:S1215
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  XC9B7-NBPP2-83J2H-RHMBY-92BT4 
set key=XC9B7-NBPP2-83J2H-RHMBY-92BT4
goto :S112activate
:S1216
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  HM7DN-YVMH3-46JC3-XYTG7-CYQJJ 
set key=HM7DN-YVMH3-46JC3-XYTG7-CYQJJ
goto :S112activate
:S1217
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G 
set key=XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G
goto :S112activate
:S1218
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  48HP8-DN98B-MYWDG-T2DCC-8W83P     
set key=48HP8-DN98B-MYWDG-T2DCC-8W83P
goto :S112activate
:S112activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
echo.
echo.
echo.
echo        系统需要重启才能完成激活
echo.  1.立即重启
echo.  2.稍后重启
echo.
choice /c 12 /n /m "请选择: "
if %errorlevel%==1 shutdown -r -t 0
if %errorlevel%==2 goto rukou
pause>nul
exit
:job6
cls
title Windows全版本激活工具-Windows Server 2012 R2 
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2012 R2 Server Standard 
echo. 2.Windows Server 2012 R2 Datacenter   
echo. 3.Windows Server 2012 R2 Essentials 
echo. 4.返回主菜单
echo. 
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto :S1221
if %errorlevel%==2 goto :S1222
if %errorlevel%==3 goto :S1223
if %errorlevel%==4 goto rukou
goto job
:S1221
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  D2N9P-3P6X9-2R39C-7RTCD-MDVJX 
set key=D2N9P-3P6X9-2R39C-7RTCD-MDVJX
goto :S12activate
:S1222
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9     
set key=W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9
goto :S12activate
:S1223
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  KNC87-3J2TX-XB4WP-VCPJV-M4FWM       
set key=KNC87-3J2TX-XB4WP-VCPJV-M4FWM
goto :S12activate
:S12activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq%  
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：201202%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job7
cls
title Windows全版本激活工具-Windows Server 2008 
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Web Server 2008 
echo. 2.Windows Server 2008 标准版   
echo. 3.不带 Hyper-V 的 Windows Server 2008 标准版
echo. 4.Windows Server 2008 企业版 
echo. 5.不带 Hyper-V 的 Windows Server 2008 企业版
echo. 6.Windows Server 2008 HPC 
echo. 7.Windows Server 2008 Datacenter
echo. 8.不带 Hyper-V 的 Windows Server 2008 数据中心版
echo. 9.面向基于 Itanium 系统的 Windows Server 2008
echo. 0.返回主菜单
echo.
set /p server=请选择:
IF %server% ==0 goto rukou
IF %server% ==1 goto :S0811
IF %server% ==2 goto :S0821
IF %server% ==3 goto :S0831
IF %server% ==4 goto :S0841
IF %server% ==5 goto :S0851
IF %server% ==6 goto :S0861
IF %server% ==7 goto :S0871
IF %server% ==8 goto :S0881
IF %server% ==9 goto :S0891
goto job7
:S0811
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  WYR28-R7TFJ-3X2YQ-YCY4H-M249D 
set key=WYR28-R7TFJ-3X2YQ-YCY4H-M249D
goto :081activate
:S0821
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  TM24T-X9RMF-VWXK6-X8JC9-BFGM2   
set key=TM24T-X9RMF-VWXK6-X8JC9-BFGM2
goto :081activate
:S0831
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ 
set key=W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ
goto :081activate
:S0841
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  YQGMW-MPWTJ-34KDK-48M3W-X4Q6V 
set key=YQGMW-MPWTJ-34KDK-48M3W-X4Q6V
goto :081activate
:S0851
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  39BXF-X8Q23-P2WWT-38T2F-G3FPG 
set key=39BXF-X8Q23-P2WWT-38T2F-G3FPG
goto :081activate
:S0861
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  RCTX3-KWVHP-BR6TB-RB6DM-6X7HP 
set key=RCTX3-KWVHP-BR6TB-RB6DM-6X7HP
goto :081activate
:S0871
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  7M67G-PC374-GR742-YH8V4-TCBY3 
set key=7M67G-PC374-GR742-YH8V4-TCBY3
goto :081activate
:S0881
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  22XQ2-VRXRG-P8D42-K34TD-G3QQC 
set key=22XQ2-VRXRG-P8D42-K34TD-G3QQC
goto :081activate
:S0891
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  4DWFP-JF3DJ-B7DTH-78FJB-PDRHK 
set key=4DWFP-JF3DJ-B7DTH-78FJB-PDRHK
goto :081activate
:081activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：200801%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job8
cls
title Windows全版本激活工具-Windows Server 2008 R2 
echo.
echo.     当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2008 R2 Standard 
echo. 2.Windows Server 2008 R2 Datacenter   
echo. 3.Windows Server 2008 R2 Enterprise
echo. 4.Windows Server 2008 R2 HPC Edition 
echo. 5.Windows Web Server 2008 R2
echo. 6.Windows Server 2008 R2 for Itanium-Based Systems 
echo. 7.返回主菜单
choice /c 1234567  /n /m "请选择: "
if %errorlevel%==1 goto :S0812
if %errorlevel%==2 goto :S0822
if %errorlevel%==3 goto :S0832
if %errorlevel%==4 goto :S0842
if %errorlevel%==5 goto :S0852
if %errorlevel%==6 goto :S0862
if %errorlevel%==7 goto rukou
goto job8
:S0812
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  YC6KT-GKW9T-YTKYR-T4X34-R7VHC 
set key=YC6KT-GKW9T-YTKYR-T4X34-R7VHC
goto :082activate
:S0822
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  74YFP-3QFB3-KQT8W-PMXWJ-7M648    
set key=74YFP-3QFB3-KQT8W-PMXWJ-7M648
goto :082activate
:S0832
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  489J6-VHDMP-X63PK-3K798-CPX3Y      
set key=489J6-VHDMP-X63PK-3K798-CPX3Y
goto :082activate
:S0842
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  FKJQ8-TMCVP-FRMR7-4WR42-3JCD7 
set key=FKJQ8-TMCVP-FRMR7-4WR42-3JCD7
goto :082activate
:S0852
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  6TPJF-RBVHG-WBW2R-86QPH-6RTM4 
set key=6TPJF-RBVHG-WBW2R-86QPH-6RTM4
goto :082activate
:S0862
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  GT63C-RJFQ3-4GMB6-BRFB9-CB83V 
set key=GT63C-RJFQ3-4GMB6-BRFB9-CB83V
goto :082activate
:082activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq%  
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：200802%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:ser2016
cls
title Windows全版本激活工具-Windows Server 2016
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2016 Datacenter
echo. 2.Windows Server 2016 Standard   
echo. 3.Windows Server 2016 Essentials
echo. 4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto :S1611
if %errorlevel%==2 goto :S1621
if %errorlevel%==3 goto :S1631
if %errorlevel%==4 goto rukou
goto :ser2016
:S1611
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  CB7KF-BWN84-R7R2Y-793K2-8XDDG 
set key=CB7KF-BWN84-R7R2Y-793K2-8XDDG
goto :161activate
:S1621
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY  
set key=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
goto :161activate
:S1631
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  JCKRF-N37P4-C2D82-9YXRT-4M63B 
set key=JCKRF-N37P4-C2D82-9YXRT-4M63B
goto :161activate
:161activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：201601%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit



:ser2019
cls
title Windows全版本激活工具-Windows Server 2019
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server 2019 Datacenter
echo. 2.Windows Server 2019 Standard   
echo. 3.Windows Server 2019 Essentials
echo. 4.返回主菜单
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto :S1911
if %errorlevel%==2 goto :S1921
if %errorlevel%==3 goto :S1931
if %errorlevel%==4 goto rukou
goto :ser2019
:S1911
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  WMDGN-G9PQG-XVVXX-R3X43-63DFG
set key=WMDGN-G9PQG-XVVXX-R3X43-63DFG
goto :191activate
:S1921
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  N69G4-B89J2-4G8F4-WWYCC-J464C
set key=N69G4-B89J2-4G8F4-WWYCC-J464C
goto :191activate
:S1931
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  WVDHN-86M7X-466P6-VHXV7-YY726
set key=WVDHN-86M7X-466P6-VHXV7-YY726
goto :191activate
:191activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：201901%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit



:ser1909
cls
title Windows全版本激活工具-Windows Server, version 1909, version 1903, and version 1809
echo.
echo.  当前系统为%sysinfo%
echo.
echo.   选择你的系统版本
echo. 1.Windows Server Datacenter
echo. 2.Windows Server Standard 
echo. 3.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto :S190901
if %errorlevel%==2 goto :S190902
if %errorlevel%==3 goto rukou
goto :ser1909
:S190901
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  6NMRW-2C8FM-D24W7-TQWMY-CWH2D
set key=6NMRW-2C8FM-D24W7-TQWMY-CWH2D
goto :1901activate
:S190902
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  N2KJX-J94YW-TQVFB-DG9YT-724CC
set key=N2KJX-J94YW-TQVFB-DG9YT-724CC
goto :1901activate
:1901activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：1909%sysinfo%%fwq%%errorcode%
echo.
echo        系统初次激活失败，请尝试深度激活
echo. 
echo. 
echo.  1.进行深度激活（自动切换kms服务器重新激活）
echo.  2.返回主菜单
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit




:56781
cls
echo.                             
echo.
echo.                          当前系统已永久激活，继续激活会导致现有永久激活变为180天
echo.                          确定要继续吗？
echo.
echo.                        1.继续使用kms（180天）激活
echo.                        2.保留现有激活状态，返回主菜单
echo.
echo.
echo.
choice /c 12 /n /m "请选择: "
if %errorlevel%==1 goto abc
if %errorlevel%==2 goto rukou
:ss
cls
echo.
echo.
echo.
echo.
echo 系统激活成功
echo.
echo.1.继续激活其他产品
echo.2.退出程序
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 exit
goto rukou
:setupo
cls
title Windows全版本激活工具-office安装 
echo.
echo.
echo.   欢迎使用office快速安装程序
echo.
echo.
echo.    在office安装激活完毕前，不要退出本程序，否则会导致安装或激活失败
echo.    如果office安装过程中出现错误，请关闭本窗口并重新安装
echo.
echo.   请选择：1.继续安装
echo.           2.返回主菜单
echo.
echo.
choice /c 1234 /n /m "请选择: "
if %errorlevel%==1 goto xuanze
if %errorlevel%==2 goto loop
:xuanze
title Windows全版本激活工具-office安装 
cls
echo.
echo.
echo.   1.office2019 32位  
echo.   2.office2019 64位  
echo.   3.office2016 32位  
echo.   4.office2016 64位
echo.   5.返回主菜单
echo.
echo. 注：office2019不支持Windows10以下的系统
echo.
echo.
echo.
choice /c 12345 /n /m "请选择: "
if %errorlevel%==1 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2019 & setup.exe /configure 2019x86.xml >nul
if %errorlevel%==2 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2019 & setup.exe /configure 2019x64.xml >nul 
if %errorlevel%==3 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2016 & setup.exe /configure 2016x86.xml >nul
if %errorlevel%==4 cls & echo. & echo. & echo. & echo.正在安装office 请勿关闭本窗口 & title office快速安装与激活程序-正在安装office & set userset=2016 & setup.exe /configure 2016x64.xml >nul 
if %errorlevel%==5 goto loop
:act
title Windows全版本激活工具-Office安装
cls
echo.
echo.  您好，你已经成功安装了office产品
echo.   
echo.  1.继续激活office
echo.  2.返回主菜单
echo.        如果您选择激活，程序将自动跳转到office激活界面进行激活
echo.
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto officecheck
if %errorlevel%==2 goto rukou
:officecheck
if %userset%==2016 goto job16
if %userset%==2019 goto job19 

:set
@title Windows全版本激活工具-自定义kms服务器
:kms
color 3f
cls
echo.                             
echo.
echo.                          当前kms服务器为%fwq%
echo.
echo.                                 Windows全版本激活工具
echo.                              1.选择现有的kms服务器
echo.                              2.自定义kms服务器
echo.                              3.返回主菜单
echo.                              
echo.                              
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto :set
if %errorlevel%==2 goto :set1
if %errorlevel%==3 goto rukou
goto kms
:set
@title Windows全版本激活工具-选择现有的kms服务器
color 3f
cls
echo.                             
echo.                   剩余kms服务器检查时间：2020/1/28 22：19
echo.                          当前kms服务器为%fwq%
echo.
echo.                              
echo.                              1.kms.lotro.cc（默认，推荐）
echo.                              2.kms.03k.org
echo.                              3.kms.chinancce.com
echo.                              4.kms.luody.info
echo.                              5.windows.kms.app
echo.                              6.kms.rbq.kr
echo.                              7.kms.cangshui.net
echo.                              8.cloud.1314.cool（不稳定，不推荐）
echo.                              9.返回主菜单
echo.                              
echo.                              
choice /c 123456789 /n /m "请选择: "
if %errorlevel%==1 set fwq=kms.lotro.cc
if %errorlevel%==2 set fwq=kms.03k.org
if %errorlevel%==3 set fwq=kms.chinancce.com
if %errorlevel%==4 set fwq=kms.luody.info
if %errorlevel%==5 set fwq=windows.kms.app
if %errorlevel%==6 set fwq=kms.rbq.kr
if %errorlevel%==7 set fwq=kms.cangshui.net
if %errorlevel%==8 set fwq=cloud.1314.cool
if %errorlevel%==9 goto rukou
goto set
:set1
cls
echo.                             
echo.
echo.                          当前kms服务器为%fwq%
echo.
echo.          说明：输入错误的kms服务器会导致激活失败，请检查后再输入
echo.
echo.
echo.
echo.
echo.
echo.
set /p fwq=请输入kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
goto fail2
:fail2
cls
echo.                             
echo.
echo.                      您输入的激活服务器失效
echo.                         
echo.          
echo.
echo.                        
echo.                已还原默认激活服务器
echo.
echo.
set fwq=cloud.1314.cool
pause >nul
goto rukou
:checkkms
title Windows全版本激活工具-检查kms服务器
cls
echo.
echo.
echo.
echo 正在检查与%fwq%的连接情况……
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto check
:fail
cls
echo.
echo.
echo.
echo.与激活服务器连接失败，请检查您的网络连接或重新选择kms服务器再试。
echo. 1.进入主页
echo. 2.重新选择kms服务器
echo. 3.退出程序
choice /c 123 /n /m "请选择: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
:check
cls
echo.
echo.
echo.
echo. 与%fwq%连接正常
echo.
echo.
pause >nul
goto rukou
:checkact
cls
echo.                             
echo.
echo.                          正在检查系统激活情况
echo.
echo.          
echo.
echo.
echo.
echo.
echo.
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto 1234
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "永久激活"  > NUL &&  goto 5678
goto 9011
:1234
cls
echo.                             
echo.
echo.                          当前系统已成功使用kms（180天）激活
echo.
echo.          
echo.
echo.
echo.
echo.
echo.
echo.
pause >nul
goto rukou
:5678
cls
echo.                             
echo.
echo.                          当前系统已永久激活
echo.
echo.
echo.
pause>nul
goto rukou

:9011
cls
echo.                             
echo.
echo.                      当前系统未激活    
echo.                         
echo.          
echo.
echo.                        
echo.                按任意键激活
echo.
echo.
echo.
pause >nul
goto rukou
:inf
cls
echo.激活详情：
cscript //Nologo %windir%\system32\slmgr.vbs /dlv
echo.激活期限：
cscript //Nologo %windir%\system32\slmgr.vbs /xpr
pause >nul
goto rukou
pause>nul
goto rukou
:autosetkms
set /a kmscount=%kmscount%+1
if %kmscount%==1 set fwq=kms.kbq.kr
if %kmscount%==2 set fwq=kms.lotro.cc
if %kmscount%==3 set fwq=kms.03k.org
if %kmscount%==4 set fwq=kms.chinancce.com
if %kmscount%==5 set fwq=kms.luody.info
if %kmscount%==6 set fwq=kms.kbq.kr
if %kmscount%==7 set fwq=kms.cz9.cn
if %kmscount%==8 set fwq=kms.cangshui.net
if %kmscount%==9 goto baoliover
cls
echo.
echo.
echo.  当前尝试次数:%kmscount%
echo.
echo   当前kms服务器：%fwq%
echo.  
echo.  正在激活，请稍后
echo.
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk %key%
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "批量激活"  > NUL &&  goto ss
goto autosetkms

:baoliover
cls
set kmscount=0
set fwq=cloud.1314.cool
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  错误代码：%sysinfo%%fwq%%errorcode%
echo.
echo.  您好，我们尝试了8个我们已知可用的kms服务器来尝试激活您的系统
echo.
echo   但是仍然激活失败，请您检查您的网络环境，请不要使用速度过慢的网络。
echo.  
echo.  或者，您可以从MSDN下载原版操作系统并尝试重装一下您的系统。
echo.
echo.
echo. 
echo. 
echo.
echo.
echo.  1.退出程序
echo.  2.进入MSDN我告诉你官网
echo.  3.返回主菜单
choice /c 12345 /n /m "请选择: "
if %errorlevel%==1 exit
if %errorlevel%==2 start https://msdn.itellyou.cn/
if %errorlevel%==3 goto rukou
pause>nul
goto rukou
:zidongxvqi
cls
echo.
echo.
echo. 正在安装自动续期服务，请稍后
echo.
echo.
echo.
del 1.bat >nul
wget -q http://%actupdatesev%/update/act/1.bat
copy 1.bat C:\ >nul
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v lin /t REG_SZ /d C:\1.bat /f
cls
echo.
echo.
echo. 自动续期服务安装完成
echo.
echo.  按任意键返回主菜单
echo.
pause >nul
goto rukou
:win7hb
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
:win7hp
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
:win7u
md "files"
copy bootrest.exe files
copy Certificate.xrm-ms files
copy showdrive.exe files
copy w7ldr files
copy bootinst.exe files
@echo off
echo.
files\showdrive.exe

if not exist %windir%\system32\slmgr.vbs goto nont6
if not exist files\bootinst.exe goto nofile
if not exist files\bootrest.exe goto nofile
if not exist files\w7ldr goto nofile
if not exist files\Certificate.xrm-ms goto nofile

cscript %windir%\system32\slmgr.vbs -ilc files\Certificate.xrm-ms >nul
if %errorlevel% neq 0 goto commandprompt

for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j

if exist sysname.* attrib -r -h -s sysname.*>nul &del sysname.*>nul

set /a nt6num = 0
if exist A:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist B:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist C:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1
if exist D:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist E:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist F:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist G:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist H:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist I:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist J:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist K:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist L:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist M:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist N:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist O:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist P:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Q:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist R:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist S:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist T:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist U:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist V:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist W:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist X:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Y:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
if exist Z:\windows\system32\slmgr.vbs set /a nt6num = nt6num + 1 
