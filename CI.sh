#!/bin/bash

cd ..

git clone https://github.com/ToolDAQ/zeromq-4.0.7.git
#wget http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz
git clone https://github.com/ToolDAQ/boost_1_66_0.git

#tar zxf boost_1_60_0.tar.gz

cd zeromq-4.0.7

./configure --prefix=`pwd`
make
make install

export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH

cd ../boost_1_66_0

mkdir install

./bootstrap.sh --prefix=`pwd`/install/ > /dev/null 2>/dev/null 
./b2 install iostreams

export LD_LIBRARY_PATH=`pwd`/install/lib:$LD_LIBRARY_PATH

cd ../ToolDAQFramework

make clean
make

export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH
 

./main configfiles/Dummy/ToolChainConfig

