#!/bin/sh
# @ job_name           = Test-MPI-IO-64nodes,64ranksPerNode,4096ranks-2013-03-25-1
# @ job_type           = bluegene
# @ comment            = ""
# @ output             = $(job_name).$(Host).$(jobid).out
# @ error              = $(job_name).$(Host).$(jobid).err
# @ bg_size            = 64
# @ wall_clock_limit   = 00:10:00
# @ bg_connectivity    = Torus
# @ queue 

# the BGLOCKLESSMPIO_F_TYPE line is to tell MPIIO that we are using GPFS
# 0x47504653 is  GPFS_SUPER_MAGIC

runjob --np 4096 --ranks-per-node=64 --cwd=$PWD \
 --envs BGLOCKLESSMPIO_F_TYPE=0x47504653 \
: /home/c/clumeq/sebhtml/software/Ray-on-IBM-Blue-Gene-Q/MPI-IO/Test-MPI-IO

