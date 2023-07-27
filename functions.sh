#!/usr/bin/env bash

markdown2pdf () {
  # source: https://shivankaul.com/blog/markdown-pdf
  if [ $# -lt2 ]; then
    output_name=$1
  else
    output_name=$2
  fi
  pandoc -t latex $1.md -o $output_name.pdf
}
