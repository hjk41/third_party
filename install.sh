#!/bin/bash

# prefix=/usr/local

prefix=`dirname "$0"`
prefix=`cd "$prefix"; pwd`

cd build
tar -zxf eigen-eigen-6b38706d90a9.tar.gz
tar -zxf glog-r142.tar.gz
tar -zxf protobuf-2.5.0.tar.gz
tar -zxf gflags-2.0-no-svn-files.tar.gz
tar -zxf zeromq-4.0.4.tar.gz
tar -zxf zlib-1.2.8.tar.gz
tar -jxf snappy-1.1.2.tar
tar -zxf gtest-1.7.0.zip
# unzip -q gtest-1.7.0.zip

cd protobuf* && ./configure -prefix=$prefix && make && make install && cd ..
cd gflags* && ./configure -prefix=$prefix && make && make install && cd ..
cd glog* && ./configure -prefix=$prefix && make && make install && cd ..
cd zeromq* && ./configure -prefix=$prefix && make && make install && cd ..
cd zlib* && ./configure -prefix=$prefix && make && make install && cd ..
cd snappy* && ./configure -prefix=$prefix && make && make install && cd ..

mv eigen*/Eigen $prefix/include

cd gtest*
g++ -isystem ./include -I. -pthread -c ./src/gtest-all.cc
g++ -isystem ./include -I. -pthread -c ./src/gtest_main.cc
ar -rv libgtest.a gtest-all.o
ar -rv libgtest_main.a gtest_main.o
mv libgtest* ../../lib
mv ./include/gtest ../../include
cd ..

# clean
# rm -rf eigen-eigen-6b38706d90a9 glog-0.3.3 protobuf-2.5.0 gflags-2.0 gtest-1.7.0 zeromq-4.0.4
