FROM kry07/xorg:gtk-pulse
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		libdbus-glib-1-2 libstartup-notification0

ARG FIREFOX_LANG="en-US"
ENV FIREFOX_VERSION 43.0.4

ADD https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${FIREFOX_LANG}/firefox-${FIREFOX_VERSION}.tar.bz2 /opt/firefox.tar.bz2
RUN tar -xjf /opt/firefox.tar.bz2 -C /opt/ \
	&& ln -s /opt/firefox/firefox /usr/local/bin/firefox \
	&& su user -c 'mkdir -p /home/user/Downloads/'

RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
		flashplugin-installer

RUN rm -rf /var/lib/apt/lists/* && rm /opt/firefox.tar.bz2

ENTRYPOINT [ "su", "user", "-c" ]
CMD [ "firefox" ]
