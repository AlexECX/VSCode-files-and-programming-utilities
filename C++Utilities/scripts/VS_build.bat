@echo off
set Architexture=%1
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" %Architexture%     
set compilerflags=/Od /Zi /EHsc /W3
set workdir=%2

::Od no optimization
::Zi add debug info in .objs
::EHsc C++ exceptions only
if %1 == x86 (
    set linkerflags=/OUT:%workdir%\Debug\x86\win_vs.exe
) else (
    set linkerflags=/OUT:%workdir%\Debug\x64\win_vs.exe
)

set ProjectCPP=%workdir%\src\*.cpp
if exist %workdir%/ressource/*.cpp (
    set RessourceCPP=%workdir%/ressource/*.cpp
    ) else (
        RessourceCPP = []
    )

set _ENDL=^^
cl.exe  %compilerflags% %ProjectCPP% %RessourceCPP% %_ENDL%
        -I%workdir%/include -I%workdir%/ressource -I%workdir%/lib %_ENDL%
        /link %linkerflags% /LIBPATH:%workdir%/lib %workdir%/lib/*.lib %_ENDL%
        /SUBSYSTEM:CONSOLE

MOVE /Y %workdir%\Debug\win_vs.ilk %workdir%\Debug\dot_Objects\Win_vs
MOVE /Y %workdir%\Debug\win_vs.pdb %workdir%\Debug\dot_Objects\Win_vs
MOVE /Y vc140.pdb %workdir%\Debug\dot_Objects\Win_vs
MOVE /Y *.obj %workdir%\Debug\dot_Objects\Win_vs
