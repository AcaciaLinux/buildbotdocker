FROM alpine:3.14 AS buildtime
RUN cd /root/ && apk add libarchive-dev libarchive curl-dev curl libcurl ncurses ncurses-dev gcc g++ clang musl-dev make cmake git
RUN cd /root/ && git clone https://github.com/AcaciaLinux/leaf --recursive && git clone https://github.com/AcaciaLinux/cleaf --recursive
RUN cd /root/ && mkdir destdir
RUN cd /root/ && cd leaf && mkdir build && cd build && cmake .. && make -j12 && make install && make DESTDIR=/root/destdir install
RUN cd /root/ && cd cleaf && mkdir build && cd build && cmake .. && make -j12 && make DESTDIR=/root/destdir install
RUN cd /root/ && tar cvzf destdir.tgz ./destdir/
CMD cp -v /root/destdir.tgz /host/ && ls /host/
