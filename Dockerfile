FROM kry07/xorg:gtk-pulse
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libdbus-glib-1-2

# list of different languages: https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/
ARG FIREFOX_LANG="en-US"
ENV FIREFOX_VERSION 45.0
# shasums: https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/SHA512SUMS
ARG FIREFOX_SHASUM="3f2cd697de578ff78f21768035dc1ac97ffd35f12f98bcf5d5c181f50e06926ebbb5844472de04bee492e66abce16d53f483b0a6029a465b3879e079a1366899"

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2 -o firefox.tar.bz2 \
	&& echo "${FIREFOX_SHASUM} firefox.tar.bz2" > SHA512SUM \
	&& sha512sum -c SHA512SUM \
	&& tar -xjf firefox.tar.bz2 -C /opt/ \
	&& ln -s /opt/firefox/firefox /usr/local/bin/firefox \
	&& su user -c 'mkdir -p /home/user/Downloads/'

RUN rm -rf /var/lib/apt/lists/* \
	&& rm firefox.tar.bz2 \
	&& rm SHA512SUM

USER user
CMD [ "firefox", "--setDefaultBrowser" ]
