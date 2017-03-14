@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

::Inside rms-sdk-for-cpp directory
call mkdir deploy
call copy bin\rms*_sample.exe deploy\.
call copy bin\rms*.dll deploy\.
call cd deploy
call windeployqt rms_sample.exe rmsauth_sample.exe rms.dll rmscrypto.dll rmsauth.dll rmsauthWebAuthDialog.dll

if %OS%==32BIT (
	call copy C:\Windows\SysWOW64\ssleay32.dll .
	call copy C:\Windows\SysWOW64\libeay32.dll .
) 
if %OS%==64BIT (
	call copy C:\Windows\System32\ssleay32.dll .
	call copy C:\Windows\System32\libeay32.dll .
)


