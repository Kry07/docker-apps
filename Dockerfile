FROM kry07/xorg:gtk
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libasound2 libdbus-glib-1-2

# Bug fix for GLib-CRITICAL **: g_slice_set_config: assertion 'sys_page_size == 0' failed
ENV G_SLICE always-malloc
# list of different languages: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/38.5.1/linux-x86_64/
ARG THUNDERBIRD_LANG="en-US"
ENV THUNDERBIRD_VERSION 38.5.1
# shasums: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/38.5.1/SHA512SUMS
ARG THUNDERBIRD_SHASUM="129754fd5ad6e680aacfae7687b4d873fe87c616fa7fd0cf5ae3b1ce38a14f903633051e979500567e77ee99188bad9de9ad939d524732fc8fce87fbaa453dba"

RUN set -ex \
	&& curl -fSL https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${THUNDERBIRD_VERSION}/linux-x86_64/${THUNDERBIRD_LANG}/thunderbird-${THUNDERBIRD_VERSION}.tar.bz2 -o thunderbird.tar.bz2 \
	&& echo "${THUNDERBIRD_SHASUM} thunderbird.tar.bz2" > SHA512SUM \
	&& sha512sum -c SHA512SUM \
	&& tar -xjf thunderbird.tar.bz2 -C /opt/ \
	&& ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird

RUN rm -rf /var/lib/apt/lists/* \
	&& rm thunderbird.tar.bz2 \
	&& rm SHA512SUM

USER user
CMD [ "thunderbird", "-setDefaultMail" ]
