# Use the official Nginx image as a base
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy local files to the container
COPY ./Source/Site-Files/ .

# Insert server_tokens off; directive after server_name in default.conf
RUN sed -i '/server_name  localhost;/a \    server_tokens off;' /etc/nginx/conf.d/default.conf

# Insert Gzip configuration after server_tokens off; directive in default.conf
RUN sed -i '/server_tokens off;/a \
    gzip on; \n\
    gzip_disable "msie6"; \n\
    gzip_comp_level 5; \n\
    gzip_vary on; \n\
    gzip_proxied any; \n\
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;' /etc/nginx/conf.d/default.conf

# Expose the port Nginx is running on
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
