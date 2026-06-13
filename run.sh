#!/bin/bash

if [ "$1" == "build_generator" ]; then
    echo "Сборка docker образа..."
    docker build -t generator-app ./src
elif [ "$1" == "run_generator" ]; then
    echo "Запуск контейнера генератора..."
    docker run --rm -v "/$(pwd)/data:/data" generator-app
elif [ "$1" == "create_local_data" ]; then
    echo "Создание локальных csv-данных..."
    python ./src/generate.py local_data
else
    echo "Вы можете вводить только 'build_generator', 'run_generator', 'create_local_data'"
fi

    
