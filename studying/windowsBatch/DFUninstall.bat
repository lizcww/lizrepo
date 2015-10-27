@echo off
setlocal  EnableDelayedExpansion

set "assentisStartMenu=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Assentis\"
set "assentistmp=C:\Users\admin\AppData\Local\Temp\Assentis"

set "docrepo=DocRepo"
set "docbase=DocBase2"
set "docwrite=DocWrite"
set "docadmin=DocAdmin"
set "docdesign=DocDesign"
set "docbaseclient=DocBase2.NetDemoClient"
set "docadminconsole=DocAdmin Console"

set "regrepo=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocRepo-"
set "regbase=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocBase2-"
set "regwrite=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocWrite-"
set "regadmin=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocAdmin-"
set "regdesign=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocDesign-"
set "regbaseclient=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Assentis DocBase2.NetDemoClient-"


set version=%1

if not defined version ( 
	echo Please input version number!
	goto :end
)

if not exist "%assentisStartMenu%\%version%" (
	echo This version of DocFamily does not have any shotcaut in windows start menu, please ensure that you inputted a right number!
	goto :end
)
:repo
if not exist "%assentisStartMenu%\%version%\%docrepo%" (
	echo DocRepo is not installed.
	goto :base
)
cd /d "%assentisStartMenu%\%version%\%docrepo%"
for %%i in (Uninstall*) do set undocrepo=%assentisStartMenu%\%version%\%docrepo%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocRepo..
"%undocrepo%" /s  
echo %errorlevel%
reg delete "%regrepo%%version%" /f

:base
if not exist "%assentisStartMenu%\%version%\%docbase%" (
	echo DocBase is not installed.
	goto :write
)
cd /d "%assentisStartMenu%\%version%\%docbase%"
for %%i in (Uninstall*) do set undocbase=%assentisStartMenu%\%version%\%docbase%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocBase2..
"%undocbase%" /s
echo %errorlevel%
reg delete "%regbase%%version%" /f

:write
if not exist "%assentisStartMenu%\%version%\%docwrite%" (
	echo DocWrite is not installed.
	goto :admin
)
cd /d "%assentisStartMenu%\%version%\%docwrite%"
for %%i in (Uninstall*) do set undocwrite=%assentisStartMenu%\%version%\%docwrite%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocWrite..
"%undocwrite%" /s
echo %errorlevel%
reg delete "%regwrite%%version%" /f

:admin
if not exist "%assentisStartMenu%\%version%\%docadmin%" (
	echo DocAdmin is not installed.
	goto :design
)
cd /d "%assentisStartMenu%\%version%\%docadmin%"
for %%i in (Uninstall*) do set undocadmin=%assentisStartMenu%\%version%\%docadmin%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocAdmin..
"%undocadmin%" /s
echo %errorlevel%
reg delete "%regadmin%%version%" /f

:design:
if not exist "%assentisStartMenu%\%version%\%docdesign%" (
	echo DocDesign is not installed.
	goto :baseclient
)
cd /d "%assentisStartMenu%\%version%\%docdesign%"
for %%i in (Uninstall*) do set undocdesign=%assentisStartMenu%\%version%\%docdesign%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocDesign..
"%undocdesign%" /s
echo %errorlevel%
reg delete "%regdesign%%version%" /f

:baseclient
if not exist "%assentisStartMenu%\%version%\%docbaseclient%" (
	echo DocBaseClient is not installed.
	goto :adminconsole
)
cd /d "%assentisStartMenu%\%version%\%docbaseclient%"
for %%i in (Uninstall*) do set undocbaseclient=%assentisStartMenu%\%version%\%docbaseclient%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocBase Client..
"%undocbaseclient%" /s
echo %errorlevel%
reg delete "%regbaseclient%%version%" /f

:adminconsole
if not exist "%assentisStartMenu%\%version%\%docadminconsole%" (
	echo DocAdminConsole is not installed.
	goto :end
)
cd /d "%assentisStartMenu%\%version%\%docadminconsole%"
for %%i in (Uninstall*) do set undocadminconsole=%assentisStartMenu%\%version%\%docadminconsole%\%%i
cd /d "%assentisStartMenu%"
echo Uninstalling DocAdminConsole.. 
"%undocadminconsole%" /s
echo %errorlevel%


:end

echo Deleting %assentistmp%\%version%
rd /s /q "%assentistmp%\%version%"
echo %errorlevel%

endlocal