#!/bin/bash

# Создание файла
echo "check Tin 0,1!" > file.txt

# Инициализация git-репозитория
git init

# Установка начальной даты (сегодня)
start_date=$(date +%Y-%m-%d)

# Первый коммит
git add file.txt
git commit -m "Initial commit"

# Установка текущей даты для начала отсчета
current_date=$start_date

# Генерация случайных изменений файла и коммитов
for ((i=1; i<=1100; i++))
do
  # Получение предыдущей даты (смещение на один день назад)
  current_date=$(date -d "$current_date -1 day" +%Y-%m-%d)
  
  # Рандомное изменение файла
  echo "check pull in version $i" >> file.txt

  # Добавление изменений и коммит
  git add file.txt
  
  # Создание коммита с указанной датой
  GIT_COMMITTER_DATE="$current_date 12:00:00" git commit --date="$current_date 12:00:00" -m "Commit $i"
done