#!/bin/bash
# usage: ./install install_path
if [ $# -eq 0 ]; then
    prefix=`dirname "$0"`
    prefix=`cd "$prefix"; pwd`
else
    prefix=$1
fi

cd build
tar -zxf eigen-eigen-6b38706d90a9.tar.gz
tar -zxf glog-r142.tar.gz
tar -zxf protobuf-2.5.0.tar.gz
tar -zxf gflags-2.0-no-svn-files.tar.gz
tar -zxf zeromq-4.0.4.tar.gz
tar -zxf zlib-1.2.8.tar.gz
tar -zxf snappy-1.1.2.tar.gz
tar -zxf gtest-1.7.0.tar.gz
# tar -zxf mpich-3.1.1.tar.gz
# tar -zxf cityhash-1.1.1.tar.gz
# tar -zxf sparsehash-2.0.2.tar.gz

n=8
cd protobuf* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
cd gflags* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
cd glog* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
cd zeromq* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
cd zlib* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
cd snappy* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
# using the following one if you have problem on fortran compiler
# cd mpich* && ./configure -prefix=$prefix --disable-fortran && make -j$n && make install && cd ..
# cd mpich* && ./configure -prefix=$prefix && make && make -j$n install && cd ..
# cd cityhash* && ./configure -prefix=$prefix && make -j$n && make install && cd ..
# cd sparsehash* && ./configure -prefix=$prefix && make -j$n && make install && cd ..

cp -r eigen*/Eigen $prefix/include

cd gtest*
g++ -isystem ./include -I. -pthread -c ./src/gtest-all.cc
g++ -isystem ./include -I. -pthread -c ./src/gtest_main.cc
ar -rv libgtest.a gtest-all.o
ar -rv libgtest_main.a gtest_main.o
cp libgtest* $prefix/lib
cp -r ./include/gtest $prefix/include
cd ..

# clean
# rm -rf eigen-eigen-6b38706d90a9 glog-0.3.3 protobuf-2.5.0 gflags-2.0 gtest-1.7.0 zeromq-4.0.4
