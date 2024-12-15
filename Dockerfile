# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="your-email@example.com"

# Update the package list and install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 8080 to the outside world
EXPOSE 8080

# Start nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]