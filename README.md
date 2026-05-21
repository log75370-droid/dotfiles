ку кароч нужны зависимости если вы на cachy OS то все ок 
# 1. Установка основных программ через pacman
sudo pacman -Syu xorg alacritty gtk3 gtk4 cava fastfetch fcitx5 fcitx5-configtool zsh git unzip

# 2. Установка оконного менеджера и лаунчеров (rofi и fuzzel обычно взаимоисключающие, но ставим оба по запросу)
sudo pacman -S rofi fuzzel

# 3. Установка youtube-tui и drift-wm (обычно через AUR / yay)
yay -S youtube-tui drift-wm-git
