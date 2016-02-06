FROM kry07/xorg:qt-gstreamer1.0
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends vlc

# gpg: key 19F7E55B: public key "Launchpad PPA for hjmooses" imported
ARG GPG_KEY="8540356019F7E55B"

RUN set -ex \
	&& echo "deb http://ppa.launchpad.net/heyarje/makemkv-beta/ubuntu trusty main" >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-key "$GPG_KEY" \
	&& apt-get update && apt-get install -y --no-install-recommends \
		makemkv-bin makemkv-oss \
	&& apt-get remove libaacs0 \
	&& cd /usr/lib \
	&& ln -s libmmbd.so.0 libaacs.so.0 \
	&& ln -s libmmbd.so.0 libbdplus.so.0

RUN rm -rf /var/lib/apt/lists/*

USER user
CMD [ "vlc" ]
