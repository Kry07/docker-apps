FROM kry07/xorg
MAINTAINER Kry <info.mayl@aol.com>

RUN apt-get update && apt-get install -y --no-install-recommends \

RUN rm -rf /var/lib/apt/lists/*

USER user
CMD [ "" ]
