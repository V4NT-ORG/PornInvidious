# Base image
FROM debian:bullseye-slim

# Set working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl git lua5.4 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the repository (replace with your repo URL)
RUN git clone https://github.com/ndivjnifoviof/PornInvidious.git . 

# Set permissions and ensure scripts are executable
RUN chmod +x start.sh

# Expose the default port
EXPOSE 8080

# Start the application
CMD ["lua", "start.lua"]