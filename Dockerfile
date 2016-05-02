FROM kry07/xorg:qt-pulse
MAINTAINER Kry <info.mayl@aol.com>

# gpg: key 7212620B: public key "Tony Rowe <tony@tonyrowe.com>" imported
ARG GPG_KEY="7212620B"

RUN set -ex \
		&& echo "deb http://archive.canonical.com/ trusty partner" >> /etc/apt/sources.list \
		&& apt-key adv --keyserver keyserver.ubuntu.com --recv-key "$GPG_KEY" \
		&& dpkg --add-architecture i386 \
		&& apt-get update && apt-get install -y --no-install-recommends skype

RUN rm -rf /var/lib/apt/lists/*

USER user
CMD [ "skype" ]
