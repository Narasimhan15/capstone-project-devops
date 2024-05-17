# Use the official Nginx image as base
FROM nginx:alpine

# Copy the built React.js application to the appropriate directory in the image
COPY . /usr/share/nginx/html

# Expose port 80 to allow incoming connections
EXPOSE 80

# The default command to start Nginx, which will serve our React.js application
CMD ["nginx", "-g", "daemon off;"]
