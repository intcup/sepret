FROM php
WORKDIR /app
COPY . .
RUN composer install
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
