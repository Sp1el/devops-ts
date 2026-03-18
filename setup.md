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

