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
    find . -not -path '*/.*' | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/├── \1/" 
else
    echo "Вы можете вводить только 'build_generator', 'run_generator', 'create_local_data'"
fi


    
