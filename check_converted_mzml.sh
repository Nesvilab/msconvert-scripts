#!/bin/bash

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Fengchao Yu

if [ $# -eq 0 ]; then
  echo "Usage: $0 <root_directory_path>"
  exit 1
fi


root="$1"

# List the number of raw and mzML files in each directory to see if all files have been converted
for dir in "$root"/*/; do
  if [ -d "$dir" ]; then
    num_files=$(find "$dir" -type f -name "*.raw" | wc -l)
    echo "Number of raw  files in $dir: $num_files"
    
    num_files=$(find "$dir" -type f -name "*.mzML" | wc -l)
    echo "Number of mzML files in $dir: $num_files"
  fi
done

for dir in "$root"; do
  if [ -d "$dir" ]; then
    num_files=$(find "$dir" -type f -name "*.raw" | wc -l)
    echo "Number of raw  files in $dir: $num_files"
    
    num_files=$(find "$dir" -type f -name "*.mzML" | wc -l)
    echo "Number of mzML files in $dir: $num_files"
  fi
done


# msconvert might stop in the middle of the conversion.
# Check if all mzML files are complete.
all_files_valid=true

find "$root" -type f -name "*.mzML" | while read -r file; do
  last_line=$(tail -n 1 "$file")
  if [ "$last_line" != "</indexedmzML>" ]; then
    echo "File $file does not end with </indexedmzML>"
    all_files_valid=false
  fi
done

if $all_files_valid; then
  echo "All mzML files end with </indexedmzML>"
else
  echo "Some mzML files do not end with </indexedmzML>"
fi


