# Use the official Nginx image as a base
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy local files to the container
COPY ./Source/Site-Files/ .

# Expose the port Nginx is running on
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
