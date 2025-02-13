# Use the official Nginx image as a base
FROM nginx:alpine

# Copy the sample website files to the Nginx HTML directory
COPY ./website /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
