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

