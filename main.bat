@echo off
set ver=19.5
set /a kmscount=0
set fwq=kms.lotro.cc
color 3f
@title Windowsȫ�汾�����-���kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
:fail
cls
echo.
echo.
echo.
echo.�뼤�����������ʧ�ܣ����������������ӻ�����ѡ��kms���������ԡ�
echo. 1.������ҳ
echo. 2.����ѡ��kms������
echo. 3.�˳�����
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
title Windowsȫ�汾�����
:rukou
title Windowsȫ�汾�����
for /f "skip=2 tokens=2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set sysinfo=%%j
color 3f
:loop
cls
echo.     
echo. 
echo.                                kms��������%fwq%
echo. 
echo.                              1.����Office
echo.                              2.����Windows 
echo.                              3.��װOffice
echo.                              4.�Զ���kms������
echo.                              5.��鵱ǰkms������
echo.                              6.��鵱ǰϵͳ�������
echo.                              7.ϵͳ������Ϣ
echo.                              8.��װ�Զ����ڷ��񣨲�֧��ж�أ�
choice /c 1234567890F /n /m "��ѡ��: "
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
echo.                          ��ѡ��Ҫ����������
echo.                       1.����ϵͳ��slmgr.vbs /ato��
echo.                       2.��װ��Կ��slmgr.vbs /ipk xxxxx��
echo.                       3.�������˵�
echo.                       
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 slmgr.vbs /ato 
if %errorlevel%==2 goto my
if %errorlevel%==3 goto loop
goto loop
:my
cls
echo.                             
echo.
echo.        ������Ҫ��װ����Կ
set /p key=������
slmgr.vbs /ipk %key%
pause
goto loop
:office
@title Windowsȫ�汾�����-Officeѡ��˵�
color 3f
cls
echo.                             
echo.
echo.                       
echo.
echo.                                 Windowsȫ�汾�����
echo.                              1.����office2019
echo.                              2.����office2016
echo.                              3.����office2013
echo.                              4.����ofice2010
echo.                              5.�������˵�
echo.       
echo.                              
choice /c 12345 /n /m "��ѡ��: "
if %errorlevel%==1 goto :job19
if %errorlevel%==2 goto :job16
if %errorlevel%==3 goto :job13
if %errorlevel%==4 goto :job2010
if %errorlevel%==5 goto rukou
:job19
@title Windowsȫ�汾�����- Office2019
cls
echo ���ڰ�װ���֤
(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
cscript //nologo ospp.vbs /unpkey:6MWKP >nul&cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul
echo ���ڽ��� KMS ������Ժ�...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job16
@title Windowsȫ�汾�����- office2016 / 365
setlocal EnableDelayedExpansion&color 3f & cd /d "%~dp0"
title Windowsȫ�汾�����-Office 2016 / 365

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
cls

echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cls

echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
cls

echo ���ڵ��� KMS GVLK...
cscript ospp.vbs /inpkey:NYH39-6GMXT-T39D4-WVXY2-D69YY >nul
cscript ospp.vbs /inpkey:7WHWN-4T7MP-G96JF-G33KR-W8GF4 >nul
cscript ospp.vbs /inpkey:RBWW7-NTJD4-FFK2C-TDJ7V-4C2QP >nul
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul
cscript ospp.vbs /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT >nul
cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK >nul
cscript ospp.vbs /inpkey:JNRGM-WHDWX-FJJG3-K47QV-DRTFM 1>nul 2>nul
cls

echo ���ڳ��� KMS ����...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit
:job13
title Windowsȫ�汾�����-Office 2013
cls
@echo.
@echo.���ڼ��office�汾
if exist "%ProgramFiles%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office15"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
cls
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses15\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
cls

echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses15\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses15\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses15\%%x" >nul
cls
echo.���ڰ�װkms��Ʒ��Կ
cscript ospp.vbs /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT >nul
cscript ospp.vbs /inpkey:KBKQT-2NMXY-JJWGP-M62JB-92CD4 >nul
cscript ospp.vbs /inpkey:FN8TT-7WMH6-2D4X9-M337T-2342K >nul
cscript ospp.vbs /inpkey:6NTH3-CW976-3G3Y2-JK3TX-8QHTT >nul
cscript ospp.vbs /inpkey:C2FG9-N6J68-H8BTJ-BW3QX-RM3B3 >nul
cscript ospp.vbs /inpkey:J484Y-4NKBF-W2HMG-DBMJC-PGWR7 >nul
cls
echo ���ڳ��� KMS ����...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause >nul
exit
:job2010
title Windowsȫ�汾�����-Office 2010
cls
color 3f & cd /d "%~dp0"
echo.���ڼ��office�汾
if exist "%ProgramFiles%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office14"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
cls
echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses14\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
cls

echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses14\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses14\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses14\%%x" >nul
cls
echo.���ڰ�װoffice��Ʒ��Կ
cscript ospp.vbs /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB >nul
cscript ospp.vbs /inpkey:V7QKV-4XVVR-XYV4D-F7DFM-8R6BM >nul
cscript ospp.vbs /inpkey:D6QFG-VBYP2-XQHM7-J97RH-VVRCK >nul
cscript ospp.vbs /inpkey:D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ >nul
cscript ospp.vbs /inpkey:7MCW8-VRQVK-G677T-PDJCM-Q8TCP >nul
cscript ospp.vbs /inpkey:767HD-QGMWX-8QTDB-9G3R2-KHFGJ >nul
cls
echo ���ڳ��� KMS ����...
cscript //nologo ospp.vbs /sethst:%fwq% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.& cls & goto officesucc ) || (echo.& cls & goto officefail)
pause
exit
:officesucc
echo.
echo.
echo.���Ѿ��ɹ��ļ�����office
echo.
echo.
echo.
echo. 
echo. 
echo.  1.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
goto rukou
:officefail
echo.
echo.
echo.  ����office�����г���
echo.
echo. 
echo. 
echo. 
echo.
echo.  1.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
goto rukou
:windows
@title Windowsȫ�汾�����-Windows����ǰ���
cls
echo.
echo.
echo.
echo ���ڼ��ϵͳ�Ƿ����ü����
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "���ü���"  > NUL &&  goto 56781
:abc
@title Windowsȫ�汾�����-Windowsѡ��˵�
color 3f
cls
echo.                             
echo.
echo.                       ��ǰϵͳΪ%sysinfo%
echo.
echo.                              
echo.                              1.����windows10 
echo.                              2.����windows8 / 8.1 
echo.                              3.����Windows7 
echo.                              4.����Windows Server 2012
echo.                              5.����Windows Server 2012 R2
echo.                              6.����Windows Server 2008
echo.                              7.����Windows Server 2008 R2
echo.                              8.����Windows Server 2016
echo.                              9.����Windows Server 2019
echo.                              0.����Windows Server, version 1909, version 1903, and version 1809
echo.                              A.�������˵���ѡ��ѡ��ʱ�����д���룩
echo.
echo.
echo.
choice /c x1234567890A /n /m "��ѡ��: "
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
title Windowsȫ�汾�����-Windows10  
cls
echo.
echo.       
echo.   ��ǰϵͳΪ%sysinfo%
echo.        
echo.         ѡ�����ϵͳ�汾
echo.
echo.       0.Windows 10 ȫ�汾���ü�������������
echo.       1.Windows 10 רҵ����վ
echo.       2.Windows 10 רҵ����վ N
echo.       3.Windows 10 רҵ������
echo.       4.Windows 10 רҵ������ N
echo.       5.Windows 10 רҵ��
echo.       6.Windows 10 ��ҵ��
echo.       7.Windows 10 ������
echo.       8.Windows 10 ��ҵ�� LTSB 2015
echo.       9.Windows 10 רҵ�� N
echo.       10.Windows 10 ��ҵ�� N
echo.       11.Windows 10 ������ N
echo.       12.Windows 10 ��ҵ�� LTSB 2015 N
echo.       13.Windows 10 ��ͥ�棨������
echo.       14.Windows 10 ��ҵ�� 2016 ���ڷ����(LTSB 2016)
echo.       15.Windows 10 ��ҵ�� LTSC 2019
echo.       16.Windows 10 ��ҵ�� N LTSC 2019
echo.       17.Windows 10 ��ҵ�� 2016 ���ڷ���� N (LTSB 2016 N)
echo.       18.�������˵�
echo.  ע�⣺ʹ�����ü������а汾�����Ϊרҵ��
echo.        �汾�ı䣬ϵͳ��Ȼ��������ʹ�ò����ü���
echo.        ����Ѿ���Ϊרҵ�棬����ʹ��ԭ����Ӧ�汾kms���ʽ���ȥ
echo.
set /p abc="��ѡ�񲢰��»س���: "
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
echo ���Խ������ü��
cscript //Nologo %windir%\system32\slmgr.vbs /ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T
cscript //Nologo %windir%\system32\slmgr.vbs /ato | find "�ɹ�"  > NUL &&  goto yj
cscript //Nologo %windir%\system32\slmgr.vbs /ipk QJNXR-YD97Q-K7WH4-RYWQ8-6MT6Y
cscript //Nologo %windir%\system32\slmgr.vbs /ato | find "�ɹ�"  > NUL &&  goto yj
cls
echo.
echo.
echo.���ü���ʧ�ܣ���ʹ�ö�Ӧ�汾��KMS���ʽ
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
echo.��ǰϵͳ�Ѿ��ɹ����ü���
echo. 
echo. 
echo.
echo.1.�˳�����
echo.2.��������������Ʒ
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 exit
if %errorlevel%==2 goto rukou
:10activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺w10%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job3
cls
title Windowsȫ�汾�����-Windows8 / 8.1  
echo.
echo.     ��ǰϵͳΪ%sysinfo% 
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows 8 רҵ��
echo. 2.Windows 8 ��ҵ��
echo. 3.Windows 8 רҵ�� N
echo. 4.Windows 8 ��ҵ�� N 
echo. 5.Windows 8.1 רҵ��
echo. 6.Windows 8.1 ��ҵ��
echo. 7.Windows 8.1 רҵ�� N
echo. 8.Windows 8.1 ��ҵ�� N 
echo. 9.�������˵�
choice /c 123456789 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺w81%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job4
cls
title Windowsȫ�汾�����-Windows7  
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows 7 רҵ��
echo. 2.Windows 7 ��ҵ��
echo. 3.Windows 7 רҵ�� N
echo. 4.Windows 7 ��ҵ�� N
echo. 5.Windows 7 ��ҵ��E 
echo. 6.Windows 7 �콢��
echo. 7.Windows 7 ��ͥ��ͨ��
echo. 8.Windows 7 ��ͥ�߼���
echo. 9.�������˵�
choice /c 123456789  /n /m "��ѡ��: "
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
title Windowsȫ�汾�����-Windows7 �콢��
echo.
echo.  
echo.
echo.   ��ѡ�񼤻ʽ���Ƽ��ȳ��Է���1��������ɹ���ʹ�÷���2��
echo. 1.��key����
echo. 2.��װslicģ����򼤻�
echo. 3.�������˵�
choice /c 123  /n /m "��ѡ��: "
if %errorlevel%==1 goto :7key
if %errorlevel%==2 goto :win7u
if %errorlevel%==3 goto rukou
:7key
cls
cscript //Nologo %windir%\system32\slmgr.vbs -upk  
cscript //Nologo %windir%\system32\slmgr.vbs -ipk  RHTBY-VWY6D-QJRJ9-JGQ3X-Q2289 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "����"  > NUL &&  goto ss
:7activate
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺w07%sysinfo%%fwq%%errorcode%
echo.  ϵͳ����ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job5
cls
title Windowsȫ�汾�����-Windows Server 2012 
echo.
echo.     ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2012 
echo. 2.Windows Server 2012 N  
echo. 3.Windows Server 2012 �����԰�
echo. 4.Windows Server 2012 �ض�����/����
echo. 5.Windows Server 2012 Server ��׼��
echo. 6.Windows Server 2012 MultiPoint Standard
echo. 7.Windows Server 2012 MultiPoint �߼���
echo. 8.Windows Server 2012 �������İ�
echo. 9.�������˵�
choice /c 123456789 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
echo.
echo.
echo.
echo        ϵͳ��Ҫ����������ɼ���
echo.  1.��������
echo.  2.�Ժ�����
echo.
choice /c 12 /n /m "��ѡ��: "
if %errorlevel%==1 shutdown -r -t 0
if %errorlevel%==2 goto rukou
pause>nul
exit
:job6
cls
title Windowsȫ�汾�����-Windows Server 2012 R2 
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2012 R2 Server Standard 
echo. 2.Windows Server 2012 R2 Datacenter   
echo. 3.Windows Server 2012 R2 Essentials 
echo. 4.�������˵�
echo. 
choice /c 1234 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺201202%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job7
cls
title Windowsȫ�汾�����-Windows Server 2008 
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Web Server 2008 
echo. 2.Windows Server 2008 ��׼��   
echo. 3.���� Hyper-V �� Windows Server 2008 ��׼��
echo. 4.Windows Server 2008 ��ҵ�� 
echo. 5.���� Hyper-V �� Windows Server 2008 ��ҵ��
echo. 6.Windows Server 2008 HPC 
echo. 7.Windows Server 2008 Datacenter
echo. 8.���� Hyper-V �� Windows Server 2008 �������İ�
echo. 9.������� Itanium ϵͳ�� Windows Server 2008
echo. 0.�������˵�
echo.
set /p server=��ѡ��:
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺200801%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:job8
cls
title Windowsȫ�汾�����-Windows Server 2008 R2 
echo.
echo.     ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2008 R2 Standard 
echo. 2.Windows Server 2008 R2 Datacenter   
echo. 3.Windows Server 2008 R2 Enterprise
echo. 4.Windows Server 2008 R2 HPC Edition 
echo. 5.Windows Web Server 2008 R2
echo. 6.Windows Server 2008 R2 for Itanium-Based Systems 
echo. 7.�������˵�
choice /c 1234567  /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺200802%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit
:ser2016
cls
title Windowsȫ�汾�����-Windows Server 2016
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2016 Datacenter
echo. 2.Windows Server 2016 Standard   
echo. 3.Windows Server 2016 Essentials
echo. 4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺201601%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit



:ser2019
cls
title Windowsȫ�汾�����-Windows Server 2019
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server 2019 Datacenter
echo. 2.Windows Server 2019 Standard   
echo. 3.Windows Server 2019 Essentials
echo. 4.�������˵�
echo.
choice /c 1234 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺201901%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit



:ser1909
cls
title Windowsȫ�汾�����-Windows Server, version 1909, version 1903, and version 1809
echo.
echo.  ��ǰϵͳΪ%sysinfo%
echo.
echo.   ѡ�����ϵͳ�汾
echo. 1.Windows Server Datacenter
echo. 2.Windows Server Standard 
echo. 3.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
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
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
cls
echo.
goto autosetkms
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺1909%sysinfo%%fwq%%errorcode%
echo.
echo        ϵͳ���μ���ʧ�ܣ��볢����ȼ���
echo. 
echo. 
echo.  1.������ȼ���Զ��л�kms���������¼��
echo.  2.�������˵�
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto autosetkms
if %errorlevel%==2 goto rukou
pause>nul
exit




:56781
cls
echo.                             
echo.
echo.                          ��ǰϵͳ�����ü����������ᵼ���������ü����Ϊ180��
echo.                          ȷ��Ҫ������
echo.
echo.                        1.����ʹ��kms��180�죩����
echo.                        2.�������м���״̬���������˵�
echo.
echo.
echo.
choice /c 12 /n /m "��ѡ��: "
if %errorlevel%==1 goto abc
if %errorlevel%==2 goto rukou
:ss
cls
echo.
echo.
echo.
echo.
echo ϵͳ����ɹ�
echo.
echo.1.��������������Ʒ
echo.2.�˳�����
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 exit
goto rukou
:setupo
cls
title Windowsȫ�汾�����-office��װ 
echo.
echo.
echo.   ��ӭʹ��office���ٰ�װ����
echo.
echo.
echo.    ��office��װ�������ǰ����Ҫ�˳������򣬷���ᵼ�°�װ�򼤻�ʧ��
echo.    ���office��װ�����г��ִ�����رձ����ڲ����°�װ
echo.
echo.   ��ѡ��1.������װ
echo.           2.�������˵�
echo.
echo.
choice /c 1234 /n /m "��ѡ��: "
if %errorlevel%==1 goto xuanze
if %errorlevel%==2 goto loop
:xuanze
title Windowsȫ�汾�����-office��װ 
cls
echo.
echo.
echo.   1.office2019 32λ  
echo.   2.office2019 64λ  
echo.   3.office2016 32λ  
echo.   4.office2016 64λ
echo.   5.�������˵�
echo.
echo. ע��office2019��֧��Windows10���µ�ϵͳ
echo.
echo.
echo.
choice /c 12345 /n /m "��ѡ��: "
if %errorlevel%==1 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2019 & setup.exe /configure 2019x86.xml >nul
if %errorlevel%==2 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2019 & setup.exe /configure 2019x64.xml >nul 
if %errorlevel%==3 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2016 & setup.exe /configure 2016x86.xml >nul
if %errorlevel%==4 cls & echo. & echo. & echo. & echo.���ڰ�װoffice ����رձ����� & title office���ٰ�װ�뼤�����-���ڰ�װoffice & set userset=2016 & setup.exe /configure 2016x64.xml >nul 
if %errorlevel%==5 goto loop
:act
title Windowsȫ�汾�����-Office��װ
cls
echo.
echo.  ���ã����Ѿ��ɹ���װ��office��Ʒ
echo.   
echo.  1.��������office
echo.  2.�������˵�
echo.        �����ѡ�񼤻�����Զ���ת��office���������м���
echo.
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto officecheck
if %errorlevel%==2 goto rukou
:officecheck
if %userset%==2016 goto job16
if %userset%==2019 goto job19 

:set
@title Windowsȫ�汾�����-�Զ���kms������
:kms
color 3f
cls
echo.                             
echo.
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.                                 Windowsȫ�汾�����
echo.                              1.ѡ�����е�kms������
echo.                              2.�Զ���kms������
echo.                              3.�������˵�
echo.                              
echo.                              
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto :set
if %errorlevel%==2 goto :set1
if %errorlevel%==3 goto rukou
goto kms
:set
@title Windowsȫ�汾�����-ѡ�����е�kms������
color 3f
cls
echo.                             
echo.                   ʣ��kms���������ʱ�䣺2020/1/28 22��19
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.                              
echo.                              1.kms.lotro.cc��Ĭ�ϣ��Ƽ���
echo.                              2.kms.03k.org
echo.                              3.kms.chinancce.com
echo.                              4.kms.luody.info
echo.                              5.windows.kms.app
echo.                              6.kms.rbq.kr
echo.                              7.kms.cangshui.net
echo.                              8.cloud.1314.cool�����ȶ������Ƽ���
echo.                              9.�������˵�
echo.                              
echo.                              
choice /c 123456789 /n /m "��ѡ��: "
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
echo.                          ��ǰkms������Ϊ%fwq%
echo.
echo.          ˵������������kms�������ᵼ�¼���ʧ�ܣ������������
echo.
echo.
echo.
echo.
echo.
echo.
set /p fwq=������kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto rukou
goto fail2
:fail2
cls
echo.                             
echo.
echo.                      ������ļ��������ʧЧ
echo.                         
echo.          
echo.
echo.                        
echo.                �ѻ�ԭĬ�ϼ��������
echo.
echo.
set fwq=cloud.1314.cool
pause >nul
goto rukou
:checkkms
title Windowsȫ�汾�����-���kms������
cls
echo.
echo.
echo.
echo ���ڼ����%fwq%�������������
echo.
vlmcs %fwq% -l Windows | find "successful"  > NUL &&  goto check
:fail
cls
echo.
echo.
echo.
echo.�뼤�����������ʧ�ܣ����������������ӻ�����ѡ��kms���������ԡ�
echo. 1.������ҳ
echo. 2.����ѡ��kms������
echo. 3.�˳�����
choice /c 123 /n /m "��ѡ��: "
if %errorlevel%==1 goto rukou
if %errorlevel%==2 goto set
if %errorlevel%==3 exit
goto fail
:check
cls
echo.
echo.
echo.
echo. ��%fwq%��������
echo.
echo.
pause >nul
goto rukou
:checkact
cls
echo.                             
echo.
echo.                          ���ڼ��ϵͳ�������
echo.
echo.          
echo.
echo.
echo.
echo.
echo.
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto 1234
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "���ü���"  > NUL &&  goto 5678
goto 9011
:1234
cls
echo.                             
echo.
echo.                          ��ǰϵͳ�ѳɹ�ʹ��kms��180�죩����
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
echo.                          ��ǰϵͳ�����ü���
echo.
echo.
echo.
pause>nul
goto rukou

:9011
cls
echo.                             
echo.
echo.                      ��ǰϵͳδ����    
echo.                         
echo.          
echo.
echo.                        
echo.                �����������
echo.
echo.
echo.
pause >nul
goto rukou
:inf
cls
echo.�������飺
cscript //Nologo %windir%\system32\slmgr.vbs /dlv
echo.�������ޣ�
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
echo.  ��ǰ���Դ���:%kmscount%
echo.
echo   ��ǰkms��������%fwq%
echo.  
echo.  ���ڼ�����Ժ�
echo.
cscript //Nologo %windir%\system32\slmgr.vbs -upk 
cscript //Nologo %windir%\system32\slmgr.vbs -ipk %key%
cscript //Nologo %windir%\system32\slmgr.vbs -skms %fwq% 
cscript //Nologo %windir%\system32\slmgr.vbs /ato
cscript //Nologo %windir%\system32\slmgr.vbs /xpr | find "��������"  > NUL &&  goto ss
goto autosetkms

:baoliover
cls
set kmscount=0
set fwq=cloud.1314.cool
echo.
cscript //Nologo %windir%\system32\slmgr.vbs /xpr  >a.txt  && set/P errorcode=<a.txt 
echo.
echo.  ������룺%sysinfo%%fwq%%errorcode%
echo.
echo.  ���ã����ǳ�����8��������֪���õ�kms�����������Լ�������ϵͳ
echo.
echo   ������Ȼ����ʧ�ܣ���������������绷�����벻Ҫʹ���ٶȹ��������硣
echo.  
echo.  ���ߣ������Դ�MSDN����ԭ�����ϵͳ��������װһ������ϵͳ��
echo.
echo.
echo. 
echo. 
echo.
echo.
echo.  1.�˳�����
echo.  2.����MSDN�Ҹ��������
echo.  3.�������˵�
choice /c 12345 /n /m "��ѡ��: "
if %errorlevel%==1 exit
if %errorlevel%==2 start https://msdn.itellyou.cn/
if %errorlevel%==3 goto rukou
pause>nul
goto rukou
:zidongxvqi
cls
echo.
echo.
echo. ���ڰ�װ�Զ����ڷ������Ժ�
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
echo. �Զ����ڷ���װ���
echo.
echo.  ��������������˵�
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
