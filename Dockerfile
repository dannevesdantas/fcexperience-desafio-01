FROM golang:1.20.3-alpine3.17
WORKDIR /app
COPY . .
RUN go build -ldflags '-w -s -extldflags "-static"' -a -o app hello.go

FROM scratch
WORKDIR /app
COPY --from=0 /app ./
CMD ["app"]