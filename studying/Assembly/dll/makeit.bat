@echo off
if exist hookDLL.obj del hookDLL.obj
if exist hookDLL.dll del hookDLL.dll
\masm32\bin\ml /c /coff hookDLL.asm
\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /DEF:hookDLL.def hookDLL.obj 
del hookDLL.obj
del hookDLL.exp
dir hookDLL.*
pause
