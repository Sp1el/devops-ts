# SSH Setup

## Генерация SSH-ключа

```bash
ssh-keygen -t ed25519 -C "devops-test"
```

По умолчанию ключи сохраняются в директории:

```text
~/.ssh/
```

Файлы:

* `id_ed25519` — приватный ключ (никому не передавать)
* `id_ed25519.pub` — публичный ключ

---

## Добавление ключа в GitHub

1. Скопировать публичный ключ:

```bash
cat ~/.ssh/id_ed25519.pub
```

2. Перейти в GitHub:

```
Settings → SSH and GPG keys
```

3. Нажать **"New SSH key"** и вставить ключ

---

## Запуск ssh-agent и добавление ключа

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

## Проверка подключения

```bash
ssh -T git@github.com
```

Ожидаемый результат:

```text
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Использование SSH в Git

После настройки используется SSH-ссылка:

```bash
git@github.com:username/repository.git
```

Пример:

```bash
git@github.com:Sp1el/devops-ts.git
```

---

## Важные замечания

* Приватный ключ (`id_ed25519`) нельзя передавать другим
* Публичный ключ безопасен и используется для аутентификации
* SSH позволяет работать с Git без ввода пароля
