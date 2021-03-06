#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# Find heartbleed.
set -x
[ -e openssl-1.0.1f ]  && ./openssl-1.0.1f -max_total_time=300 2>&1 | tee log
grep -Pzo "(?s)ERROR: AddressSanitizer: heap-buffer-overflow.*READ of size.*#1 0x.* in tls1_process_heartbeat .*ssl/t1_lib.c:2586" log
