#!/bin/bash

REPO_URL="https://github.com/t937on/shvirtd-example-python.git"
TARGET_DIR="/opt/app"

if [ ! -d $TARGET_DIR ]; then
  echo "Каталог не существует. Создаю его..."
  sudo mkdir -p  $TARGET_DIR 
fi

cd $TARGET_DIR || { echo "Не удалось перейти в каталог  $TARGET_DIR"; exit 1; }

if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Клонирование репозитория..."
    sudo git clone "$REPO_URL" $TARGET_DIR 
fi

if [ -f "compose.yaml" ]; then
  echo "Запуск проекта с помощью Docker Compose..."
  docker compose up -d --build
else
  echo "Файл compose.yaml не найден в каталоге проекта."
fi

