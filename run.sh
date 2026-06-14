#!/bin/bash

if [ "$1" == "build_generator" ]; then
    echo "Сборка образа генератора..."
    docker build -t generator-app ./generate-app
elif [ "$1" == "run_generator" ]; then
    echo "Запуск контейнера генератора..."
    docker run --rm -v "/$(pwd)/data:/data" generator-app
elif [ "$1" == "create_local_data" ]; then
    echo "Создание локальных csv-данных..."
    python ./generate-app/generate.py local_data
elif [ "$1" == "build_reporter" ]; then
    echo "Сборка образа аналитика..."
    docker build -t analyze-app ./analyze-app
elif [ "$1" == "run_reporter" ]; then
    echo "Запуск контейнера аналитика..."
    docker run --rm -v "/$(pwd)/data:/data" analyze-app
elif [ "$1" == "structure" ]; then
    echo "Структура проекта в текущей директории"
    tree -d /proc/self/ # Источник https://stackoverflow.com/questions/3455625/linux-command-to-print-directory-structure-in-the-form-of-a-tree 
elif [ "$1" == "clear_data" ]; then
    rm ./data/data.csv
    rm ./data/report.html
elif [ "$1" == "inside_generator" ]; then
    docker run --rm -v "/$(pwd)/data:/data" generator-app ls -la /data # Источник https://stackoverflow.com/questions/41485217/mount-current-directory-as-a-volume-in-docker-on-windows-10
elif [ "$1" == "inside_reporter" ]; then
    docker run --rm -v "/$(pwd)/data:data" analyze-app ls -la /data # (ibid.)
else
    echo "Вы можете вводить только 'build_generator', 'run_generator', 'create_local_data'"
fi


    
