#!/usr/bin/env bash

duration="${1}"
output_filename="${2}"

# ffmpeg command to generate a silent audio track of the given duration
ffmpeg \
  -f lavfi \
  -i anullsrc=r=44100:cl=stereo \
  -t "${duration}" \
  -q:a 9 \
  -acodec libmp3lame \
  "${output_filename}"
