# SSH Setup

## Генерация SSH ключа

ssh-keygen -t ed25519 -C "devops-test"

Ключи создаются в директории:

~/.ssh/

- id_ed25519 — приватный ключ
- id_ed25519.pub — публичный ключ

## Добавление публичного ключа в GitHub

1. Скопировать ключ:

cat ~/.ssh/id_ed25519.pub

2. Перейти в GitHub:
Settings → SSH and GPG keys

3. Нажать "New SSH key" и вставить ключ

## Запуск ssh-agent

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

## Проверка подключения

ssh -T git@github.com

При успешном подключении выводится:

"Successfully authenticated"

## Использование

Для работы с репозиторием используется SSH:

git@github.com:Sp1el/devops-ts.git
