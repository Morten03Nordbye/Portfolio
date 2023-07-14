# Start with the official Nginx image as our base.
FROM nginx:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Add our Nginx configuration file
COPY ./nginx.conf /etc/nginx/conf.d/

# Copy our PHP files
COPY ./Portfolio-main /var/www/html

# Expose port 80 for the Nginx web server.
EXPOSE 80

# Start Nginx and PHP-FPM
CMD ["nginx", "-g", "daemon off;"]
