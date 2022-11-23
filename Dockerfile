FROM alpine:3.14 AS branchbuildbot
COPY leafbinary/target/destdir.tgz /root/destdir.tgz
RUN apk add libarchive-dev curl libcurl curl-dev libcurl ncurses-dev gcc g++ clang musl-dev python3
RUN cd /root/ && tar xvzf /root/destdir.tgz
RUN cd /root/destdir/ && cp -R usr/ /
RUN apk add py3-pip python3-dev make bash && python3 -m pip install pycurl
COPY branch/ /root/branch
RUN cd /root/branch/branchbuildbot && make install && mkdir -p /opt/workdir/
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
CMD /entry.sh
