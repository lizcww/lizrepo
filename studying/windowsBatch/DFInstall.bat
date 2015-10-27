WinRAR e *.zip *.exe
for %%i in (DocR*.exe) do %%i /S && sleep 40
for %%i in (DocB*.exe) do %%i /S && sleep 40
for %%i in (DocW*.exe) do %%i /S && sleep 40
for %%i in (DocAdminConsole*.jar) do "C:\Program Files\Java\jdk1.7.0_45\jre\bin\javaw.exe" -Dizpack.mode=privileged -jar %%i
