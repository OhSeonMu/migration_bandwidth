#!/bin/sh

# Run BFS
../gapbs/client 10 127.0.0.1 & 

# Measure memory bandwidth
sudo perf stat -I 10 -e 'LLC-load-misses' -a -o ../python/output_file/pr_total &
sudo perf stat -I 10 -e 'LLC-load-misses' -C 0-5 -o ../python/output_file/pr_migration &
wait
