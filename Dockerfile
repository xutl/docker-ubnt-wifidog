FROM xutongle/docker-ubnt-mipsel

MAINTAINER XUTONGLE <xutongle@gmail.com>

ARG WIFIDOG_VERSION=1.3.0

WORKDIR /app

COPY wifidog-build.sh /bin

RUN chmod 700 /bin/wifidog-build.sh \
   && git clone https://github.com/wifidog/wifidog-gateway.git \
   && /bin/wifidog-build.sh update

VOLUME ["/wifidog"]

ENTRYPOINT ["/bin/wifidog-build.sh"]

