# Build Stage
FROM golang:1.22-alpine AS builder

WORKDIR /app

# Copy module definition files
COPY go.mod ./
# COPY go.sum ./ # (uncomment when dependencies are added)

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build lightweight binary
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/bin/server ./cmd/api

# Final Stage (Minimal Production Runtime)
FROM alpine:latest

WORKDIR /app

# Copy binary from builder stage
COPY --from=builder /app/bin/server /app/server
COPY --from=builder /app/.env /app/.env

EXPOSE 8080

CMD ["/app/server"]
