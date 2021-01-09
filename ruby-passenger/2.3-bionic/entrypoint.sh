#!/bin/bash
set -ex

for file in /opt/nginx/{,**/}*.erb; do
  if [ -f "$file" ]; then
    # don't overwrite an existing destination file
    if [ ! -e "${file%.*}" ]; then
      erb -T- "$file" > "${file%.*}"
      echo "${file%.*}: generated."
    else
      >&2 echo "${file%.*}: SKIPPED! refusing to overwrite existing file."
    fi
  fi
done
