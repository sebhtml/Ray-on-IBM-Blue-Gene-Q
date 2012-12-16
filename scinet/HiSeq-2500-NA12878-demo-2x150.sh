#!/bin/sh
# @ job_name           = HiSeq-2500-NA12878-demo-2x150-2012-12-15-14
# @ job_type           = bluegene
# @ comment            = "None"
# @ output             = $(job_name).$(Host).$(jobid).out
# @ error              = $(job_name).$(Host).$(jobid).err
# @ bg_size            = 256
# @ wall_clock_limit   = 48:00:00
# @ bg_connectivity    = Torus
# @ queue 

#    Signed-off-by: Sébastien Boisvert <sebastien.boisvert.3@ulaval.ca>
#    Reviewed-by: Sébastien Boisvert <sebastien.boisvert.3@ulaval.ca>
#    Tested-by: Sébastien Boisvert <sebastien.boisvert.3@ulaval.ca>

# Sample: HiSeq-2500-NA12878-demo-2x150
# Producer: Illumina, Inc.
# Instrument: Illumina(R) HiSeq(R) 2500(R)
# Reads: 1171357300
# Read length: 2x150bp

# bg_size is the number of nodes
# 16 cores per node
# 4 threads per core
# 16 GiB RAM per node
# 1 GiB RAM per core
# 256 MiB per thread
# 256  MiB per rank @ 64 ranks/node
# 512  MiB per rank @ 32 ranks/node
# 1024 MiB per rank @ 16 ranks/node

# 16384 Ray processes,  256 nodes, 64 ranks/node -> PASS [ ] FAIL [x] out of memory
#  8192 Ray processes,  256 nodes, 32 ranks/node -> PASS [x] FAIL [ ] 80.124 +/- 2.48219 microseconds
# 16384 Ray processes,  512 nodes, 32 ranks/node -> PASS [x] FAIL [ ] 57.2828 +/- 4.2786 microseconds
# 32768 Ray processes, 1024 nodes, 32 ranks/node -> PASS [ ] FAIL [x] out of memory
#  4096 Ray processes,  256 nodes, 16 ranks/node -> PASS [x] FAIL [ ] 69.5754 +/- 2.62784 microseconds

runjob --np 4096 --ranks-per-node=16 --cwd=$PWD : \
/home/c/clumeq/sebhtml/software/ray/Last-Build/Ray HiSeq-2500-NA12878-demo-2x150.conf
