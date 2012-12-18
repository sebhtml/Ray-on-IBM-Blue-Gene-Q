cd ray
make clean HAVE_LIBZ=y

module load vacpp
module load mpich2
module load compression/all

ray=a1e1db808f3162959ebb771e1fd0e315f19a57f0
rayplatform=bca919fb19f534e8b605b153a6d63bd5a1576369
version=2.1.1-dev-$ray-$rayplatform
prefix=/home/c/clumeq/sebhtml/software/ray/$version

rm -rf $prefix

make PREFIX=$prefix -j 10  \
HAVE_LIBZ=y ASSERT=y \
CXXFLAGS="-O3 -qarch=qp -qtune=qp -I $SCINET_ZLIB_INC " \
LDFLAGS=" -L $SCINET_ZLIB_LIB -lz " \

make install

cd /home/c/clumeq/sebhtml/software/ray/
rm Last-Build
ln -s $version Last-Build
