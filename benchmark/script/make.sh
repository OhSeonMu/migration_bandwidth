#!/bin/sh

# Make BFS Grap
TCMALLOC_MEMFS_MALLOC_PATH=/mnt/hugetlbfs/ LD_PRELOAD=/home/osm/Mb/gperftools/.libs/libtcmalloc.so taskset -c 10-90 ../gapbs/pr -u 29 -S
