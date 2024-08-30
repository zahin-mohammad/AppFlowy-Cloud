FROM nginx:alpine

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificate and key
COPY ./nginx/ssl/certificate.crt /etc/nginx/ssl/your-domain.crt
COPY ./nginx/ssl/private_key.key /etc/nginx/ssl/your-domain.key

# Expose ports
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]