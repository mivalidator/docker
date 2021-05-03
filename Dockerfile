FROM adoptopenjdk/openjdk11:alpine-jre
LABEL maintainer="NAKANO Hideo <pinarello.marvel@gmail.com>"

# setup google-chrome
RUN apk add chromium

# setup noto fonts
RUN mkdir -p /usr/share/fonts/noto
RUN wget -O /tmp/NotoSansCJKjp-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
  && unzip -o -d /usr/share/fonts/noto /tmp/NotoSansCJKjp-hinted.zip
RUN wget -O /tmp/NotoSerifCJKjp-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
  && unzip -o -d /usr/share/fonts/noto /tmp/NotoSerifCJKjp-hinted.zip
RUN chmod 644 /usr/share/fonts/noto/*
RUN fc-cache -fv

# setup mivalidator
RUN wget -O /tmp/mivalidator.zip https://github.com/mivalidator/mivalidator/releases/latest/download/mivalidator.zip \
  && unzip -o -d /opt /tmp/mivalidator.zip

# finalize setup
RUN rm -rf /tmp/* && rm -rf /var/cache/apk/*
