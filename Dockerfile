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
RUN useradd -G www-data,root -u  1055 -d /home/sepret sepret
RUN mkdir -p /home/sepret/.composer && \
    chown -R sepret:sepret /home/sepret
WORKDIR /app
COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer  && chmod +x /usr/bin/composer
RUN composer install
RUN mv .env.example .env
RUN php artisan key:generate
RUN php artisan migrate
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
