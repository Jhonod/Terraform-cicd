# Gunakan image resmi Golang sebagai base image
FROM golang:1.21-alpine

# Set working directory dalam container
WORKDIR /app

# Salin file Go ke dalam container
COPY main.go .

# Build aplikasi Go menjadi binary
RUN go build -o hello main.go

# Perintah default saat container dijalankan
CMD ["./hello"]