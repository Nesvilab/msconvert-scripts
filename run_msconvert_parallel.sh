#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License. 

# Author: Fengchao Yu

set -x

threads=16

find ./ -name '*.raw' | parallel -j $threads '
  f2={/.}.mzML
  log_file={/.}.log
  if [ ! -f $f2 ];
  then
    outdir=$(dirname {})
    wine msconvert --64 --zlib --filter "peakPicking" --filter "zeroSamples removeExtra 1-" --outdir $outdir {} >$log_file 2>&1
  fi
'
