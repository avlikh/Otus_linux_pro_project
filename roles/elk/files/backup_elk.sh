#!/bin/bash

# Устанавливаем переменные
ELASTICSEARCH_DIR="/var/lib/elasticsearch"
BACKUP_DIR="/backup/elk"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/elasticsearch_backup_$DATE.tar.gz"

# Останавливаем Elasticsearch
echo "Остановка Elasticsearch..."
sudo systemctl stop elasticsearch

# Создаём архив с сохранением прав доступа и владельцев
echo "Создание архива бэкапа..."
sudo tar czpf "$BACKUP_FILE" -C "$ELASTICSEARCH_DIR" .

# Запускаем Elasticsearch обратно
echo "Запуск Elasticsearch..."
sudo systemctl start elasticsearch

# Выводим сообщение о завершении
echo "Бэкап успешно завершён. Архив сохранён в $BACKUP_FILE"