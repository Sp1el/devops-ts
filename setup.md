# Setup

## Обновление системы

```bash
sudo apt update
```

---

## Установка nginx

```bash
sudo apt install nginx -y
```

Проверка версии:

```bash
nginx -v
```

---

## Управление nginx

```bash
sudo systemctl status nginx   # проверка статуса
sudo systemctl start nginx    # запуск
sudo systemctl stop nginx     # остановка
sudo systemctl restart nginx  # перезапуск
```

---

## Настройка статической страницы

Создание файла:

```bash
nano ~/devops-ts/nginx/index.html
```

Копирование в директорию nginx:

```bash
sudo cp ~/devops-ts/nginx/index.html /usr/share/nginx/html/index.html
```

---

## Проверка работы сервера

```bash
curl http://localhost
```

---

## Настройка firewall (ufw)

Установка:

```bash
sudo apt install ufw -y
```

Разрешаем порты:

```bash
sudo ufw allow 22/tcp   # SSH
sudo ufw allow 80/tcp   # HTTP
sudo ufw allow 443/tcp  # HTTPS
```

Включение:

```bash
sudo ufw enable
```

Проверка:

```bash
sudo ufw status verbose
```

---

## Настройка HTTPS (SSL)

Создание директории:

```bash
sudo mkdir /etc/nginx/ssl
```

Генерация самоподписанного сертификата:

```bash
sudo openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx.key \
-out /etc/nginx/ssl/nginx.crt
```

Добавление server блока в конфигурацию nginx:

```nginx
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
```

Проверка конфигурации:

```bash
sudo nginx -t
```

Перезапуск nginx:

```bash
sudo systemctl restart nginx
```

Проверка HTTPS:

```bash
curl -k https://localhost
```

Примечание: флаг `-k` используется, так как сертификат самоподписанный и не доверяется системой.

---

## Генерация времени на странице

Создание скрипта:

```bash
nano ~/devops-ts/nginx/update_time.sh
```

Содержимое:

```bash
#!/bin/bash

TIME=$(date)

echo "<html>
<head>
<meta charset=\"UTF-8\">
</head>
<body>
<h1>Hello DevOps world!</h1>
<p>Current time: $TIME</p>
</body>
</html>" > /usr/share/nginx/html/index.html
```

Делаем исполняемым:

```bash
chmod +x ~/devops-ts/nginx/update_time.sh
```

Запуск:

```bash
sudo ~/devops-ts/nginx/update_time.sh
```

Проверка:

```bash
curl http://localhost
```


## Backup nginx

Создан bash-скрипт для архивирования конфигурации nginx:

```bash
#!/bin/bash

DATE=$(date -u +"%Y-%m-%d_%H-%M-%S")
tar -czf /home/sp1el/devops-ts/backups/nginx_backup_$DATE.tar.gz /etc/nginx
```

```text
Скрипт запускается автоматические через cron
для этого вводим команду crontab -e
и добавляем строку:
```
```bash
0 1 * * 1 /home/sp1el/devops-ts/scripts/backup_nginx.sh
```
