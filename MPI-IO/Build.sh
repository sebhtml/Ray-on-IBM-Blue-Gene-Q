#!/bin/bash

module load vacpp
module load mpich2

MPICXX=mpicxx
CXXFLAGS="-qminimaltoc -g -O3 -qarch=qp -qtune=qp " \

$MPICXX $CXXFLAGS Test-MPI-IO.cpp -o Test-MPI-IO


