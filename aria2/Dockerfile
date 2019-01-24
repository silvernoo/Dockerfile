FROM arm64v8/alpine:edge

RUN mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache tzdata bash aria2 darkhttpd s6

RUN	apk update && \
	apk add --no-cache wget && \
	wget https://github.com/mayswind/AriaNg/releases/download/1.0.0/AriaNg-1.0.0.zip && \
        mkdir AriaNg && \
	unzip AriaNg-1.0.0.zip -d AriaNg && \
	apk del git

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf

RUN chmod +x /conf-copy/start.sh

RUN mkdir -p /var/aria2 && \
	touch /var/aria2/session.dat && \
	touch /var/aria2/dht.dat && \
	touch /var/aria2/dht6.dat && \
	touch /var/aria2/session.dat

WORKDIR /

VOLUME ["/data"]
VOLUME ["/conf"]

EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
