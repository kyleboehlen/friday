# syntax=docker/dockerfile:1

# Base build stage with shared dependencies
FROM golang:latest AS base
WORKDIR /src
COPY go.mod go.sum* ./
RUN go mod download
COPY . .

# Build for macOS Apple Silicon (arm64)
FROM base AS macos-builder
RUN CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 \
    go build -ldflags="-s -w" -o bin/friday-darwin-arm64 ./main.go

# Build for Windows x86 (386)
FROM base AS windows-builder
RUN CGO_ENABLED=0 GOOS=windows GOARCH=386 \
    go build -ldflags="-s -w" -o bin/friday-windows-386.exe ./main.go

# Final stage to collect all binaries
FROM scratch AS dum-e
COPY --from=macos-builder /src/bin/friday-darwin-arm64 /arm64/friday
COPY --from=windows-builder /src/bin/friday-windows-386.exe /x86_64/friday