FROM kry07/xorg:gtk-pulse
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libdbus-glib-1-2

ARG FIREFOX_LANG="en-US"
ENV FIREFOX_VERSION 43.0.4

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2 -o firefox.tar.bz2 \
	&& echo "f652bf4929fd7ce436372cf998b539ec5fb14ee2aa3aba33eddb1d3e268b0a6db926e742456b7d6c33556d6c0a0e9af4d3f642ae7dfc7172c94740e2aa03fb3c  firefox.tar.bz2" > SHA512SUM \
	&& sha512sum -c SHA512SUM \
	&& tar -xjf firefox.tar.bz2 -C /opt/ \
	&& ln -s /opt/firefox/firefox /usr/local/bin/firefox \
	&& su user -c 'mkdir -p /home/user/Downloads/'

RUN rm -rf /var/lib/apt/lists/* \
	&& rm firefox.tar.bz2 \
	&& rm SHA512SUM

USER user
CMD [ "firefox", "--no-remote", "--setDefaultBrowser" ]
