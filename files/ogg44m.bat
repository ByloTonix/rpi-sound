@echo off
linco -B 16 -C 1 -R 44100 | oggenc - -r -B 16 -C 1 -R 44100 -o out.ogg %1 %2 %3 %4 %5 %6 %7 %8 %9
