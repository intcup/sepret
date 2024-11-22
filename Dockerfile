FROM php
WORKDIR /app
COPY . .
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer  && chmod +x /usr/bin/composer
RUN composer install
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
