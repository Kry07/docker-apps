FROM kry07/xorg:gtk
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libasound2 libdbus-glib-1-2 bzip2

# list of different languages: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/latest/README.txt
ARG THUNDERBIRD_LANG="en-US"
ENV THUNDERBIRD_VERSION 45.1.1

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${THUNDERBIRD_VERSION}/linux-x86_64/${THUNDERBIRD_LANG}/thunderbird-${THUNDERBIRD_VERSION}.tar.bz2 -o thunderbird.tar.bz2 \
	&& curl https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${THUNDERBIRD_VERSION}/SHA512SUMS \
		| awk -v file="linux-x86_64/${THUNDERBIRD_LANG}/thunderbird-${THUNDERBIRD_VERSION}.tar.bz2" '$2 == file {print $1, "thunderbird.tar.bz2"}' > SHA512SUM \
	&& sha512sum -c SHA512SUM \
	&& tar -xjf thunderbird.tar.bz2 -C /opt/ \
	&& ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird

RUN rm -rf /var/lib/apt/lists/* \
	&& rm thunderbird.tar.bz2 \
	&& rm SHA512SUM

USER user
