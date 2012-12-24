cd ray
make clean

module load bgqgcc
module load mpich2

ray=0d73638d2fa1ee50da721233402425a01e0c2e24
rayplatform=bca919fb19f534e8b605b153a6d63bd5a1576369
version=2.1.1-dev-$ray-$rayplatform-GNU-Compilers
prefix=/home/c/clumeq/sebhtml/software/ray/$version

rm -rf $prefix

make PREFIX=$prefix -j 10 Q="" \
ASSERT=y \
MPICXX=powerpc64-bgq-linux-g++ \
LD=powerpc64-bgq-linux-g++ \
CXXFLAGS="-g -O3 -Wall -std=c++98 -I/bgsys/drivers/V1R1M2/ppc64/comm/sys/include -I/bgsys/drivers/V1R1M2/ppc64 -I/bgsys/drivers/V1R1M2/ppc64/spi/include -I/bgsys/drivers/V1R1M2/ppc64/spi/include/kernel/cnk -I/bgsys/drivers/V1R1M2/ppc64/comm/xl/include -L/bgsys/drivers/V1R1M2/ppc64/comm/xl/lib -lcxxmpich -lmpich -lopa -lmpl -L/bgsys/drivers/V1R1M2/ppc64/comm/sys/lib -lpami -L/bgsys/drivers/V1R1M2/ppc64/spi/lib -lSPI -lSPI_cnk -lpthread -lrt -lstdc++" \
LDFLAGS="-I/bgsys/drivers/V1R1M2/ppc64/comm/sys/include -I/bgsys/drivers/V1R1M2/ppc64 -I/bgsys/drivers/V1R1M2/ppc64/spi/include -I/bgsys/drivers/V1R1M2/ppc64/spi/include/kernel/cnk -I/bgsys/drivers/V1R1M2/ppc64/comm/xl/include -L/bgsys/drivers/V1R1M2/ppc64/comm/xl/lib -lcxxmpich -lmpich -lopa -lmpl -L/bgsys/drivers/V1R1M2/ppc64/comm/sys/lib -lpami -L/bgsys/drivers/V1R1M2/ppc64/spi/lib -lSPI -lSPI_cnk -lpthread -lrt -lstdc++" 

make install

cd /home/c/clumeq/sebhtml/software/ray/
rm Last-Build
ln -s $version Last-Build
