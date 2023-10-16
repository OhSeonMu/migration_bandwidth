#!/bin/sh

# Measure memory bandwidth
# sudo perf stat -e 'uncore_imc_0/cas_count_read/, uncore_imc_0/cas_count_write/, uncore_imc_3/cas_count_read/, uncore_imc_3/cas_count_write/, uncore_imc_6/cas_count_read/, uncore_imc_6/cas_count_write/, uncore_imc_9/cas_count_read/, uncore_imc_9/cas_count_write/' -C 0 -I 1 -o mb_stat.o
# sudo perf stat -e 'uncore_imc_0/cas_count_read/, uncore_imc_0/cas_count_write/, uncore_imc_3/cas_count_read/, uncore_imc_3/cas_count_write/, uncore_imc_6/cas_count_read/, uncore_imc_6/cas_count_write/, uncore_imc_9/cas_count_read/, uncore_imc_9/cas_count_write/' -C 1 &
# sudo perf stat -e 'uncore_imc_0/cas_count_read/, uncore_imc_0/cas_count_write/, uncore_imc_3/cas_count_read/, uncore_imc_3/cas_count_write/, uncore_imc_6/cas_count_read/, uncore_imc_6/cas_count_write/, uncore_imc_9/cas_count_read/, uncore_imc_9/cas_count_write/' -C 2 &
# sudo perf stat -e 'uncore_imc_0/cas_count_read/, uncore_imc_0/cas_count_write/, uncore_imc_3/cas_count_read/, uncore_imc_3/cas_count_write/, uncore_imc_6/cas_count_read/, uncore_imc_6/cas_count_write/, uncore_imc_9/cas_count_read/, uncore_imc_9/cas_count_write/' -C 3 &
# sudo perf stat -I 1000 -e 'uncore_imc_0/cas_count_read/, uncore_imc_0/cas_count_write/, uncore_imc_3/cas_count_read/, uncore_imc_3/cas_count_write/, uncore_imc_6/cas_count_read/, uncore_imc_6/cas_count_write/, uncore_imc_9/cas_count_read/, uncore_imc_9/cas_count_write/' -a -o mb_stat.o

# sudo perf stat -I 10 -e 'LLC-load-misses, LLC-store-misses' -C 0-5 -o ./python/output_csv/migration
# sudo perf stat -I 10 --interval-count 5000000 -e 'LLC-load-misses' -a -o ../python/output_file/pr_total &
# sudo perf stat -I 10 --interval-count 5000000 -e 'LLC-load-misses' -C 0-5 -o ../python/output_file/pr_migration &
sudo perf stat -e 'LLC-load-misses, LLC-store-misses' -a -o ../python/output_file/pr_total_stat ../gapbs/client 10 127.0.0.1     
sudo perf stat -e 'LLC-load-misses, LLC-store-misses' -C 0-5 -o ../python/output_file/pr_migration_stat ../gapbs/client 10 127.0.0.1     
