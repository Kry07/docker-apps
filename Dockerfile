FROM kry07/xorg:gtk-gstreamer1.0
MAINTAINER Kry <info.mayl@aol.com>

# gpg: key 816950D8: public key "Launchpad HandBrake Snapshots" imported
ARG GPG_KEY="43D3A9F60C58A7169778E6FB8771ADB0816950D8"

RUN set -ex \
	&& echo "deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu trusty main" >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-key "$GPG_KEY" \
	&& apt-get update && apt-get install -y --no-install-recommends \
		librsvg2-common libdbus-glib-1-2 libnotify4 handbrake-gtk 

RUN rm -rf /var/lib/apt/lists/*

USER user
CMD [ "ghb" ]
