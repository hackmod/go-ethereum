FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 --branch release/1.8 https://github.com/pirl/pirl && \
  (cd pirl && make geth) && \
  cp pirl/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /pirl && rm -rf /var/cache/apk/*

EXPOSE 6588
EXPOSE 30303

ENTRYPOINT ["/geth"]
