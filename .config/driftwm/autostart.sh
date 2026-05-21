#!/bin/sh
sleep 1 && fcitx5 -d &
#!/bin/sh

#!/bin/sh
# Ждем 2 секунды, пока DriftWM применит конфигурацию прозрачности
sleep 2

# Запускаем обои
swaybg -i /home/doogike/.config/driftwm/wallpapers/fondorojo.jpg -m fill &
