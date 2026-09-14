#!/usr/bin/env bash

do_resume=false
do_cv=false

while [ $# -gt 0 ]; do
  case "$1" in
    --resume) do_resume=true ;;
    --cv)     do_cv=true ;;
    -h|--help)
      printf "usage: %s [--resume] [--cv]\n(no flags compiles both)\n" "$(basename "$0")"
      exit 0
      ;;
    *)
      printf "\n\033[31m❌ unknown option: %s\033[0m\n\n" "$1" >&2
      exit 1
      ;;
  esac
  shift
done

# no flags = do everything, same as before
if ! $do_resume && ! $do_cv; then
  do_resume=true
  do_cv=true
fi

compile() {
  printf "\n\033[33m📝 compiling $1.tex ...\033[0m\n\n"
  pdflatex "$1.tex"
  printf "\n\033[32m✅ done!\033[0m\n\n"
  printf "\033[33m📂 moving $1.pdf to files/ root\033[0m\n\n"
  mv "$1.pdf" ../
  printf "\033[32m✅ done!\033[0m\n\n"
}

$do_resume && compile resume
$do_cv && compile cv

printf "\033[33m🧹 cleaning up...\033[0m\n\n"
rm -f *.log
rm -f *.out
rm -f *.aux
printf "\033[32m🐷 done with everything!\033[0m\n\n"
