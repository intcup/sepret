FROM php
WORKDIR /app
COPY . .
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
