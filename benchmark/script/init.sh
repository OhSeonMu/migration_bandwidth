#!/bin/sh

# Reserve a few large pages
sudo sh -c "echo 17408 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages" # 34GB of large pages
sudo sh -c "echo 174080 > /sys/devices/system/node/node1/hugepages/hugepages-2048kB/nr_hugepages" # 340GB of large pages
sudo mount -t hugetlbfs none /mnt/hugetlbfs
sudo chmod 777 /mnt/hugetlbfs/
