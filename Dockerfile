FROM gcc:7

RUN apt-get purge -y cmake

WORKDIR /tmp/cmake
RUN wget https://cmake.org/files/v3.9/cmake-3.9.3.tar.gz && \
    tar -xzvf cmake-3.9.3.tar.gz > /dev/null

WORKDIR cmake-3.9.3
RUN ./bootstrap && \
    make -j4 && \
    make install

WORKDIR /
RUN rm -rf /tmp/cmake
