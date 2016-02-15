FROM kry07/xorg:gtk-pulse
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libdbus-glib-1-2

# list of different languages: https://download-installer.cdn.mozilla.net/pub/firefox/releases/44.0.2/linux-x86_64/
ARG FIREFOX_LANG="en-US"
ENV FIREFOX_VERSION 44.0.2
# shasums: https://download-installer.cdn.mozilla.net/pub/firefox/releases/44.0.2/SHA512SUMS
ARG FIREFOX_SHASUM="8da1c628413dd22ad28a1eeb8ffc31c5353e830129e35284b321b71ab116f97ec27e6b131d52c61259ece52ffb3b1aba8849d433b8ccf6cf8065233ddba411be"

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2 -o firefox.tar.bz2 \
	&& echo "${FIREFOX_SHASUM} firefox.tar.bz2" > SHA512SUM \
	&& sha512sum -c SHA512SUM \
	&& tar -xjf firefox.tar.bz2 -C /opt/ \
	&& ln -s /opt/firefox/firefox /usr/local/bin/firefox \
	&& su user -c 'mkdir -p /home/user/Downloads/'

RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
		flashplugin-installer

RUN rm -rf /var/lib/apt/lists/* \
	&& rm firefox.tar.bz2 \
	&& rm SHA512SUM

USER user
CMD [ "firefox", "--setDefaultBrowser" ]
