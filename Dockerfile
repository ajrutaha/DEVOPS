FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nginx \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-common \
    php8.2-mbstring \
    php8.2-gd \
    php8.2-intl \
    php8.2-xml \
    php8.2-zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create required directories
RUN mkdir -p /run/php /var/log/php /var/www/html

# Configure PHP-FPM
RUN sed -i 's/;listen = \/run\/php\/php8.2-fpm.sock/listen = \/run\/php\/php-fpm.sock/' /etc/php/8.2/fpm/pool.d/www.conf && \
    sed -i 's/;listen.owner = www-data/listen.owner = www-data/' /etc/php/8.2/fpm/pool.d/www.conf && \
    sed -i 's/;listen.group = www-data/listen.group = www-data/' /etc/php/8.2/fpm/pool.d/www.conf && \
    sed -i 's/;listen.mode = 0660/listen.mode = 0660/' /etc/php/8.2/fpm/pool.d/www.conf

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/sites-available/default

# Set permissions
RUN chown -R www-data:www-data /var/www/html /var/log/php /run/php && \
    chmod -R 755 /var/www/html

# Expose port and set working directory
EXPOSE 80
WORKDIR /var/www/html

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

