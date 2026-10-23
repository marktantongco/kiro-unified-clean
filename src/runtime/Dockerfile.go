FROM golang:1.22-alpine
WORKDIR /app
COPY kiro_pool_go_v8_2.go .
RUN go build -o kiro-pool-go kiro_pool_go_v8_2.go
EXPOSE 5000
CMD ["./kiro-pool-go"]
