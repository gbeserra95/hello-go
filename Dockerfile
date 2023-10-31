# STAGE 1
FROM golang:1.21 AS builder

WORKDIR /usr/src/myapp

COPY ./hello/hello.go .
COPY ./go.mod .

RUN CGO_ENABLED=0 GOOS=linux go build -o .

# STAGE 2
FROM scratch

WORKDIR /

COPY --from=builder /usr/src/myapp/hello .

ENTRYPOINT [ "/hello"]