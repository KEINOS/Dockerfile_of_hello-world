FROM golang:alpine AS build
WORKDIR /home/app
COPY ./src .
ENV GO111MODULE=on
RUN apk --no-cache add \
        git \
        make \
        build-base \
        tzdata \
    && go mod init app \
    && CGO_ENABLED=0 go build -o main \
    && chmod +x main

FROM busybox
WORKDIR /home/app
COPY --from=build /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
COPY --from=build /home/app/main /home/app/main
RUN addgroup go \
  && adduser -D -G go go \
  && chown -R go:go /home/app/main
EXPOSE 8080
ENTRYPOINT ["/home/app/main"]
CMD []
