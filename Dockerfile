ARG user=sepret
ARG uid=55

FROM php:8.2-fpm
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user
WORKDIR /app
COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer  && chmod +x /usr/bin/composer
RUN composer install
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
