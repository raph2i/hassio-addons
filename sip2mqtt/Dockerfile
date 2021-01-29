ARG BUILD_FROM
FROM ${BUILD_FROM}

# Add env
ENV LANG C.UTF-8

ARG VERSION_PJSIP=2.10

RUN apk add --no-cache python2 py2-paho-mqtt \
    && python -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip install --upgrade pip setuptools \
    && rm -r /root/.cache \
    && apk add --no-cache --virtual .build4pjsip alpine-sdk \
    && apk add --no-cache libsrtp-dev python2-dev openssl-dev linux-headers \
    && curl -L -s -S https://raw.githubusercontent.com/MartyTremblay/sip2mqtt/master/sip2mqtt.py -O  \
    && cd \
    && curl -L -s -S "https://github.com/pjsip/pjproject/archive/${VERSION_PJSIP}.tar.gz" | tar -xz \
    && cd "pjproject-${VERSION_PJSIP}" \
    && ./configure \ 
      --with-external-srtp \
      --enable-shared \
      --disable-sound \
      --disable-sdl \
      --disable-speex-aec \
      --disable-video \
      --prefix=/usr/local > /dev/null \
    \
    && make dep \
    && make \
    && make install \
    && cd pjsip-apps/src/python \
    && make \
    && make install \
    && cd \
    && rm -rf "pjproject-${VERSION_PJSIP}" \
    && apk del .build4pjsip 
    

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
