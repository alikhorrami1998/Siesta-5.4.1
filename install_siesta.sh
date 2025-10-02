#!/bin/bash

set -e

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing dependencies ==="
sudo apt install -y \
    build-essential \
    checkinstall \
    cmake \
    gfortran \
    g++ \
    make \
    pkg-config \
    libxc-dev \
    libreadline-dev \
    libblas-dev \
    liblapack-dev \
    libfftw3-dev \
    libnetcdf-dev \
    libnetcdff-dev \
    libscalapack-mpi-dev \
    libscalapack-openmpi-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-doc \
    libopenblas-dev \
    python3 \
    gnuplot \
    git \
    bison \
    flex

echo "=== Downloading SIESTA 5.4.0 ==="
wget https://gitlab.com/siesta-project/siesta/-/releases/5.4.1/downloads/siesta-5.4.1.tar.gz

echo "=== Extracting archive to /opt ==="
sudo mkdir -p /opt/siesta-5.4.1
sudo tar -xzf siesta-5.4.1.tar.gz -C /opt/siesta-5.4.1 --strip-components=1

echo "=== Removing archive ==="
rm -f siesta-5.4.1.tar.gz

echo "=== Changing ownership to current user ==="
sudo chown -R $USER:$USER /opt/siesta-5.4.1

cd /opt/siesta-5.4.1

echo "=== Creating build directory ==="
mkdir -p build && cd build

echo "=== Running CMake ==="
cmake .. \
  -DSIESTA_WITH_MPI=ON \
  -DSIESTA_WITH_MPI_INTERFACES=legacy \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_Fortran_COMPILER=mpif90 \
  -DCMAKE_CXX_COMPILER=mpicxx \
  -Dlibgridxc_FIND_METHOD=fetch \
  -DSCALAPACK_LIBRARY=scalapack-openmpi \
  -DSCALAPACK_LIBRARY_DIR=/usr/lib/x86_64-linux-gnu \
  -DSIESTA_WITH_NETCDF=ON \
  -DSIESTA_WITH_LIBXC=ON \
  -DSIESTA_WITH_OPENMP=ON \
  -DSIESTA_WITH_FLOOK=ON \
  -DSIESTA_WITH_ELSI=ON \
  -DSIESTA_WITH_ELPA=OFF \
  -DCMAKE_BUILD_TYPE=Release


echo "=== Building SIESTA ==="
make -j$(nproc)

echo "=== Installing SIESTA ==="
sudo make install


echo "✅ SIESTA installed successfully!"



