set filename_noext=%1
set latex=%2
call %latex% %filename_noext%.tex
set dvi=%3
call %dvi% %filename_noext%.dvi
set ps=%4
call %ps% %filename_noext%.ps
