#!/bin/bash

# Устанавливаем переменные
ELASTICSEARCH_DIR="/var/lib/elasticsearch"
BACKUP_DIR="/backup/elk"
LAST_BACKUP=$(ls -t $BACKUP_DIR/elasticsearch_backup_*.tar.gz | head -n 1)

# Проверка на наличие архива
if [ -z "$LAST_BACKUP" ]; then
  echo "Ошибка: не найден архив для восстановления в $BACKUP_DIR"
  exit 1
fi

# Останавливаем Elasticsearch
echo "Остановка Elasticsearch..."
sudo systemctl stop elasticsearch

# Очищаем директорию с данными
echo "Очистка папки $ELASTICSEARCH_DIR..."
sudo rm -rf "$ELASTICSEARCH_DIR"/*

# Восстанавливаем данные из последнего архива
echo "Восстановление данных из архива $LAST_BACKUP..."
sudo tar xzpf "$LAST_BACKUP" -C "$ELASTICSEARCH_DIR"

# Запускаем Elasticsearch
echo "Запуск Elasticsearch..."
sudo systemctl start elasticsearch

# Выводим сообщение о завершении
echo "Восстановление завершено успешно из $LAST_BACKUP"