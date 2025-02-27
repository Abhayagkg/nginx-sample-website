# Use the official Nginx image as a base
FROM nginx:latest

# Ensure the logs directory exists and set the correct permissions
RUN mkdir -p /var/log/nginx && \
    touch /var/log/nginx/access.log && \
    chown -R nginx:nginx /var/log/nginx

# Copy custom Nginx configuration files, if any (optional)
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY default.conf /etc/nginx/conf.d/default.conf

# Expose the necessary port (default Nginx port is 80)
EXPOSE 8081

# Ensure Nginx runs in the foreground
CMD ["nginx", "-g", "daemon off;"]
