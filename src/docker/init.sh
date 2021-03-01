#!/usr/bin/env bash
yum -y  groupinstall "Development Tools"
yum -y  install git
yum -y  install libasan
yum -y  install cmake
yum -y  install snappy-devel
yum -y  install boost-devel
yum -y  install xerces-c-devel
yum -y  install rpm-build