# Use the official Nginx image as a base
FROM nginx:latest

# Set the working directory
WORKDIR /app

# Copy the website files from the host to the container
COPY ~/nginx-sample-website/ /usr/share/nginx/html/

# Copy custom Nginx configuration files
COPY default.conf /etc/nginx/conf.d/default.conf

# Ensure Nginx has read access to the website files
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html

# Expose the necessary port (default Nginx port is 80)
EXPOSE 80

# Ensure Nginx runs in the foreground
CMD ["nginx", "-g", "daemon off;"]
