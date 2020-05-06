FROM php:7
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt install libonig-dev

RUN docker-php-ext-install mysqli pdo pdo_mysql tokenizer  pcntl mbstring
WORKDIR /app
COPY ./server-app /app
RUN composer install

CMD php artisan websockets:serve

EXPOSE 6001
