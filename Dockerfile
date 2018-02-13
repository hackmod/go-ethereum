# Build Gesc in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-esc
RUN cd /go-esc && make gesc

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-esc/build/bin/gesc /usr/local/bin/

EXPOSE 9545 9546 50505 50505/udp 50506/udp
ENTRYPOINT ["gesc"]
