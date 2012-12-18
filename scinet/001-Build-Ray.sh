cd ray
module load vacpp
module load mpich2
module load compression/all

ray=278a63e2794d5c3f04935c002b2e9a3dddf9ba9a
rayplatform=bca919fb19f534e8b605b153a6d63bd5a1576369
prefix=/home/c/clumeq/sebhtml/software/ray/2.1.1-dev-$ray-$rayplatform

make \
PREFIX=$prefix \
-j 10  \
HAVE_LIBZ=y \
MPICXX=mpicxx \
Q="" \
CXXFLAGS="-O3 -qarch=qp -qtune=qp -I $SCINET_ZLIB_INC " \
LDFLAGS=" -L $SCINET_ZLIB_LIB -lz " \

make install
