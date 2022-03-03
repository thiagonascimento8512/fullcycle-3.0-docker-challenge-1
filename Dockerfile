FROM golang:1.17.7-alpine AS builder
WORKDIR /usr/src
RUN go mod init helloWorld
COPY *.go .
RUN CGO_ENABLED=0
RUN go build -o /app

FROM scratch
WORKDIR /usr/src
COPY --from=builder /app /
ENTRYPOINT [ "/app" ]