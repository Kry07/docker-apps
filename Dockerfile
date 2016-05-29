FROM kry07/xorg:gtk-pulse
MAINTAINER Kry <info.mayl@aol.com>

# new distro dep python3 distro-info-data libmpdec2 libxcb-util1 lsb-release
RUN apt-get update && apt-get install -y --no-install-recommends \
		libdbus-glib-1-2 bzip2

# list of different languages: https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/README.txt
ARG FIREFOX_LANG="en-US"
ENV FIREFOX_VERSION 46.0.1

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2 -o firefox.tar.bz2 \
	&& curl https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/SHA512SUMS \
		| awk -v file="linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2" '$2 == file {print $1, "firefox.tar.bz2"}' > SHA512SUM \
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
