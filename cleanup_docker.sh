#!/bin/bash

# Удаление всех контейнеров
docker container stop $(docker container ls -aq)  # Остановка всех контейнеров
docker container rm $(docker container ls -aq)  # Удаление всех контейнеров

# Удаление всех образов Docker
docker image rm $(docker image ls -aq) --force  # Удаление всех образов

# Удаление всех Docker volumes (если нужно)
docker volume rm $(docker volume ls -q)  # Удаление всех томов

# Удаление всех сетей Docker (не встроенных)
docker network rm $(docker network ls | grep "bridge\|none\|host" -v | awk '/ / { print $1 }')  # Удаление пользовательских сетей

# Очистка неиспользуемых или висячих образов, контейнеров, томов и сетей
docker system prune -a --volumes --force  # Удаляет все неиспользуемые объекты

# Дополнительно: Очистка кэша сборки Docker
docker builder prune --all --force  # Удаление кэша сборки
