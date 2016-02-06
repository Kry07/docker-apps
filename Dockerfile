FROM kry07/xorg:qt-gstreamer1.0
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends vlc

RUN rm -rf /var/lib/apt/lists/*

USER user
CMD [ "vlc" ]
