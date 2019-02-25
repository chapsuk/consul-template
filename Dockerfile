FROM chapsuk/golang:1.11.2
WORKDIR /go/src/github.com/hashicorp/consul-template
ADD . .
RUN go build -o /consul-template .

FROM alpine:3.8
COPY --from=0 /consul-template /bin/consul-template
CMD ["consul-template"]
