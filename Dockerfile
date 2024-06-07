
FROM golang:1.19 AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o kafka-connector

FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/kafka-connector .
COPY --from=builder /app/kafka_connector.conf .
EXPOSE 8080
CMD ["./kafka-connector"]
