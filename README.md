## ДЗ 3 Мазохин Илья Романович ##

Важно: возможно возникновение ошибки с загрузкой метаданных в докер
Решение: загрузить в dockerDeckstop -> settings -> Docker Engine ->
в конфигурацию json
{
    "registry-mirrors": [
        "https://mirror.gcr.io",
        "https://huecker.io"
    ]
}
