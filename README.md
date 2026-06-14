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

Также для работы команды structure требуется установить tree, если он не установлен
Решение проблемы описано в статье https://superuser.com/questions/531592/how-to-add-the-tree-command-to-git-bash-in-windows
