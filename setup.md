# Setup

## Обновление пакетов
- sudo apt update

## Установка nginx
- sudo apt install nginx -y (1.24.0)

## Проверка статуса nginx/команды
- systemctl status nginx - проверка статуса
- sudo systemctl start nginx - запуск
- sudo systemctl stop nginx - остановка
- sudo systemctl restart nginx - перезапуск
- nginx -v - проверка версии

## Копирование страницы
- sudo cp ~/devops-ts/nginx/index.html /корневой путь nginx, у меня это usr/share/nginx/html/index.html
- Посмотреть можно командой cat /etc/nginx/conf.d/default.conf (строка root)

## Перезапуск nginx и проверка ответа сервера
- sudo systemctl restart nginx
- curl http://localhost

## Настройка firewall
- sudo apt install ufw -y - установка ufw (удобный инструмент для работы в ubuntu)
- sudo ufw allow 22/tcp - добавляем в список правил разрешенный порт (SSH)
- sudo ufw allow 80/tcp - добавляем в список правил порт (HTTP)
- sudo ufw allow 443/tcp - добавляем в список правил порт (HTTPS)
- sudo ufw enable - активация firewall
- sudo ufw status verbose - проверка статуса

## Настройка HTTPS (SSL)
- sudo mkdir /etc/nginx/ssl - Создание директории для сертификатов

Генерация самоподписанного сертификата:
- sudo openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx.key \
  -out /etc/nginx/ssl/nginx.crt

Добавляем server блок на 443 порт в конфигурации nginx:
server {
    listen 443 ssl;
    server_name localhost;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
- sudo nginx -t - проверка синтаксиса

Перезапускаем nginx: sudo systemctl restart nginx
Проверяем: curl -k https://localhost

