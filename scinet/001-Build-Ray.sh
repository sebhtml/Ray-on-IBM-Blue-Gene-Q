cd ray
module load vacpp
module load mpich2
module load compression/all

ray=f9ae217d2338403cbd1330d6837a94734100c92d
rayplatform=1e90a34e1e9b50f60f916deb55c69fb25fb9b1e3
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
