FROM alpine:3.14

COPY icecast.xml start ./
RUN apk add wget build-base libxslt-dev libxslt libvorbis-dev libvorbis && \
    wget -O icecast-2.4.4.tar.gz https://downloads.xiph.org/releases/icecast/icecast-2.4.4.tar.gz && \
    tar -xvzf icecast-2.4.4.tar.gz && \
    cd icecast-2.4.4 && \
    ./configure && \
    make && \
    make install
    
EXPOSE 8000

CMD ["./start"]
