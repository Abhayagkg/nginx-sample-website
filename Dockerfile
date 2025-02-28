# Use the official Nginx base image
FROM nginx:latest

# Copy custom HTML file to the default Nginx directory
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 for Nginx
EXPOSE 80
