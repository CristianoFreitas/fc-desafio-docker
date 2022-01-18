FROM golang:1-alpine AS build_base

WORKDIR /go/src/app

COPY . .

RUN go mod init CristianoFreitas/desafio-docker && \
    go build .

FROM scratch

COPY --from=build_base /go/src/app/desafio-docker /

CMD ["/desafio-docker"]