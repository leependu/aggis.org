#!/usr/bin/env bash

printf "\n\033[33m📝 compiling resume.tex ...\033[0m\n\n"
pdflatex resume.tex
printf "\n\033[32m✅ done!\033[0m\n\n"
printf "\033[33m📂 moving resume.pdf to files/ root\033[0m\n\n"
# mv resume.pdf ../
printf "\033[32m✅ done!\033[0m\n\n"
printf "\033[33m📝 compiling cv.tex ...\033[0m\n\n"
pdflatex cv.tex
printf "\n\033[32m✅ done!\033[0m\n\n"
printf "\033[33m📂 moving cv.pdf to files/ root\033[0m\n\n"
# mv cv.pdf ../
printf "\033[32m✅ done!\033[0m\n\n"
printf "\033[33m🧹 cleaning up...\033[0m\n\n"
rm *.log
rm *.out
rm *.aux
printf "\033[32m🐷 done with everything!\033[0m\n\n"
