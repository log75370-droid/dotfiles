#!/bin/bash

# Получаем информацию об активном окне из Niri в формате JSON
WINDOW_DATA=$(niri msg --json focused-window)

# Если окон нет, выходим
if [ -z "$WINDOW_DATA" ] || [ "$WINDOW_DATA" == "null" ]; then
    notify-send "Джарвис" "Тут пусто, сэр. Никаких окон не открыто." -i dialog-information
    exit 0
fi

# Парсим имя окна и его идентификатор (процесс/класс)
TITLE=$(echo "$WINDOW_DATA" | jq -r '.title // "Без названия"')
PROCESS=$(echo "$WINDOW_DATA" | jq -r '.app_id // "Неизвестный процесс"')

# Отправляем системное уведомление
notify-send "🤖 Джарвис:" "Сэр, это окно: <b>$TITLE</b>\nЗапущено процессом: <code>$PROCESS</code>" -u critical -i dialog-question

