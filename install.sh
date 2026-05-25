#!/usr/bin/env bash

# Переход в домашнюю директорию
cd ~ || exit

# Список пакетов
PACKAGES=(
    accountsservice alsa-firmware alsa-plugins alsa-utils
    awesome-terminal-fonts base bluez-hid2hci bluez-obex
    bluez-utils btop btrfs-assistant cachyos-fish-config
    cachyos-grub-theme cachyos-hello cachyos-hooks
    cachyos-kernel-manager cachyos-keyring cachyos-micro-settings
    cachyos-mirrorlist cachyos-niri-noctalia cachyos-packageinstaller
    cachyos-plymouth-bootanimation cachyos-plymouth-theme
    cachyos-rate-mirrors cachyos-settings cachyos-v3-mirrorlist
    cachyos-v4-mirrorlist cachyos-wallpapers cachyos-zsh-config
    cantarell-fonts cava cpupower dmraid driftwm duf efitools
    ethtool fcitx5-configtool ffmpegthumbnailer firefox-i18n-ru
    fsarchiver glances grub-btrfs-support grub-hook gst-libav
    gst-plugins-bad gst-plugins-ugly halley hdparm hwdetect
    hwinfo inetutils intel-ucode jfsutils lavat-git
    lib32-vulkan-icd-loader libva-nvidia-driver linux-cachyos-headers
    linux-cachyos-lts-headers logrotate lsb-release lsscsi
    man-pages meld nano-syntax-highlighting netctl
    networkmanager-openvpn nfs-utils nvidia-580xx-dkms paru
    pavucontrol pv rebuild-detector reflector sddm sg3_utils
    shelly sof-firmware ttf-opensans tty-clock ufw-extras
    unimatrix-git unrar unzip vesktop vlc-plugins-all waypaper
    wtype xl2tpd yay ytm-player zsh
)

echo "==> Обновление баз данных..."
yay -Sy

echo "==> Установка пакетов..."
yay -S --needed "${PACKAGES[@]}"

echo "==> Изменение стандартного шелла на zsh..."
# Команда chsh потребует пароль от вашей учетной записи
if chsh -s /usr/bin/zsh; then
    echo "[УСПЕХ] Шелл изменен на zsh. Изменения вступят в силу при следующем входе."
else
    echo "[ОШИБКА] Не удалось изменить шелл автоматически."
fi
echo "Перенос файлов"
mv config ~/.config

