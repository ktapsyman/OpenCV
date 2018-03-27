#!/usr/bin/bash
apt-get update
apt-get upgrade
apt-get install -y build-essential cmake pkg-config
apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get install -y libxvidcore-dev libx264-dev
apt-get install -y libgtk3-dev
apt-get install -y libatlas-base-dev gfortran
apt-get install -y git
git clone https://github.com/opencv/opencv.git
cd opencv
mkdir build
cd build
git clone https://github.com/opencv/opencv_contrib.git
pip3 install numpy
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
	-D CUDA_GENERATION=Auto\
    -D OPENCV_EXTRA_MODULES_PATH=opencv_contrib/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python3 \
	-D WITH_CUDA=ON \
	-D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-9.0 \
    -D BUILD_EXAMPLES=ON ..

make -j4
make install
ldconfig
