#!/bin/bash

LICENSE_FILE="$HOME/.license"

# ANSI escape sequences for colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RESET='\033[0m'  # Reset text color to default

# Fungsi untuk meminta lisensi dari pengguna
request_license() {
    echo "Masukkan lisensi Anda:"
    read -r LICENSE_KEY
    echo "$LICENSE_KEY" > "$LICENSE_FILE"
}

# Fungsi untuk memeriksa lisensi
check_license() {
    LICENSE_KEY=$(cat "$LICENSE_FILE")
    if [ "$LICENSE_KEY" == "RAIN" ]; then
        return 0
    else
        echo "Lisensi tidak valid."
        return 1
    fi
}

# Fungsi untuk menampilkan pesan setelah lisensi valid
display_message() {
    clear
    echo ""
    echo ""
    echo ""
    echo -e "${RED}"
    echo "          -o          o-            ____      _    ___ _   _ __  __ ____"
    echo "          +hydNNNNdyh+             |  _ \\    / \\  |_ _| \\ | |  \\/  |/ ___|"
    echo "        +mMMMMMMMMMMMMm+           | |_) |  / _ \\  | ||  \\| | |\\/| | |"
    echo "      \`dMMm:NMMMMMMN:mMMd\`         |  _ <  / ___ \\ | || |\\  | |  | | |___"
    echo "      hMMMMMMMMMMMMMMMMMMh         |_| \\_\\/_/   \\_\\___|_| \\_|_|  |_|\\____|"
    echo "  ..  yyyyyyyyyyyyyyyyyyyy  .."
    echo ".mMMm\`MMMMMMMMMMMMMMMMMMMM\`mMMm."
    echo ":MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:"
    echo ":MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:"
    echo ":MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:"
    echo ":MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM:"
    echo "-MMMM-MMMMMMMMMMMMMMMMMMMM-MMMM-"
    echo " +yy+ MMMMMMMMMMMMMMMMMMMM +yy+"
    echo "      mMMMMMMMMMMMMMMMMMMm"
    echo "      \`/++MMMMh++hMMMM++/\`"
    echo "          MMMMo  oMMMM"
    echo "          MMMMo  oMMMM"
    echo "          oNMm-  -mMNs"
    echo -e "${RESET}"
    echo ""
    echo ""
    echo -e "${BLUE}                    WHATSAPP : 085263390832${RESET}"
    echo -e "${YELLOW}                    YOUTUBE  : RAINMC${RESET}"
    echo ""
}

# Fungsi instalasi perangkat lunak
install_software() {
    echo -e "LICENSE ANDA BENAR, SILAKAN MASUKAN ULANG"
}

# Fungsi untuk animasi teks berkedip satu per satu
animate_text() {
    local text="$1"
    local delay="${2:-0.1}"

    for (( i = 0; i < ${#text}; i++ )); do
        echo -en "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "${RESET}"
}

# Main script
request_license
if check_license; then
    display_message
    install_software
    animate_text "POWERED BY RAINMC"
else
    exit 1
fi
# Fungsi untuk menangani pilihan "FIX YARN"
fix_yarn() {
    echo "Anda memilih untuk memperbaiki YARN."
    echo "Menjalankan perintah perbaikan YARN..."
# Pemeriksaan apakah pengguna sudah memiliki panel Pterodactyl
    echo "KAMU HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
        # Lanjutkan dengan instalasi tema

    # Perintah untuk memperbaiki YARN
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/pterodactyl
    yarn build:production

    echo "Perbaikan YARN selesai."
elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema Enigma dibatalkan karena Anda tidak memiliki panel Pterodactyl."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}
installThemeice(){
    cd /var/www/
    tar -cvf IceMinecraftTheme.tar.gz pterodactyl
    echo "Installing theme..."
    cd /var/www/pterodactyl
    rm -r IceMinecraftTheme
    git clone https://github.com/Angelillo15/IceMinecraftTheme.git
    cd IceMinecraftTheme
    rm /var/www/pterodactyl/resources/scripts/IceMinecraftTheme.css
    rm /var/www/pterodactyl/resources/scripts/index.tsx
    rm /var/www/pterodactyl/resources/scripts/components/server/console/Console.tsx
    mv resources/scripts/index.tsx /var/www/pterodactyl/resources/scripts/index.tsx
    mv resources/scripts/IceMinecraftTheme.css /var/www/pterodactyl/resources/scripts/IceMinecraftTheme.css
    mv resources/scripts/components/server/console/Console.tsx /var/www/pterodactyl/resources/scripts/components/server/console/Console.tsx
    cd /var/www/pterodactyl

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt update
    apt install -y nodejs

    npm i -g yarn
    yarn

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear
}
deletefilesptero(){
    echo "PROSES"
    echo "Menjalankan perintah Anda"
    echo "APAKAH ANDA INGIN MENGUNINSTAL FILE PTERODACTYL? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    cd /var/ && rm -r www
    echo "FILE PTERODACTYL TELAH TER UNINSTALL"
    elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema Enigma dibatalkan karena Anda tidak memiliki panel Pterodactyl."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}
# Fungsi untuk menangani pilihan "INSTALL THEME ENIGMA"
install_theme_enigma() {
    echo "Anda memilih untuk menginstal tema Enigma."
    echo "Menjalankan perintah instalasi tema Enigma..."

    # Pemeriksaan apakah pengguna sudah memiliki panel Pterodactyl
    echo "KAMU HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
        # Lanjutkan dengan instalasi tema Enigma
        echo "Instalasi tema Enigma dimulai..."

        # Perintah untuk mengunduh dan menginstal tema Enigma
        cd /var/www && wget https://download1320.mediafire.com/eozumer0w90gsfphVEVjR6SxMBhRBDbm94tRvQOTEtqKWQzR4KdYZtKDPeaD0L9MzzSwEdTWYxZS12_2xIjyxVgp13VmdQ-6rKrkOD_54gMwaQ1ZbuxXwXyQ2ouJeZ9B5VPix1AjqctCUsEDrCUhGHkQONseIX_UkGjXjtjKQ7iwoV4/ppt17cu93e5fh2l/pterodactyl.zip
        apt install unzip
        rm -r pterodactyl.zip
        unzip pterodactyl.zip
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/pterodactyl
    yarn
    yarn build:production
        echo "Tema Enigma telah diinstal."

        # Perintah untuk instalasi tambahan
        echo "Melakukan konfigurasi tambahan..."

        # Pemeriksaan dan instalasi dependensi (contoh)
        # Misalnya:
        # sudo apt update
        # sudo apt install -y package_name

        echo "Konfigurasi tambahan selesai."
    elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Dibatalkan."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}

# Fungsi untuk menangani pilihan "INSTALL BILLING MODULE"
install_billing_module() {
    echo "Anda memilih untuk menginstal Billing Module."
    echo "Menjalankan perintah instalasi Billing Module..."
# Pemeriksaan apakah pengguna sudah memiliki panel Pterodactyl
    echo "KAMU HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
        # Lanjutkan dengan instalasi tema

    # Perintah untuk instalasi Billing Module
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/
    wget https://download1582.mediafire.com/zw3oybkqe7tgypTC3QvQLbjxuRTULGU4CFmIM1964SM_mffjBZrfVf22p5CpQXJI75Pcm4IfDkn3VwvnlxZ12EQ73Mt3YYJ6wAYm9bb74N_2VXOFmS4PV8OF3VPZedkpQaF3eY0eADFr6Q3Op149chzwWwqRyqcTNIgdkML7XV84/n5sy1vgbhc7habn/pterodactyl.zip
    apt install unzip
    rm -r pterodactyl.zip
    unzip pterodactyl.zip
    cd /var/www/pterodactyl
    yarn
    php artisan billing:install stable
    yarn build:production

    echo "Instalasi Billing Module selesai."
elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema dibatalkan karena Anda tidak memiliki panel Pterodactyl."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}
install_futuristic_theme() {
    echo "Anda memilih untuk menginstal Billing Module."
    echo "Menjalankan perintah instalasi Billing Module..."
# Pemeriksaan apakah pengguna sudah memiliki panel Pterodactyl
    echo "KAMU HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
        # Lanjutkan dengan instalasi tema

    # Perintah untuk instalasi
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/
    wget https://download1530.mediafire.com/fcxkg5ap4kjgfXsoL1Amn3NsTAftQGMigU_dEEiqGoPoaKYqkfWSiq9HYqNvfnWciXIAyNCO7SL4r3Js-0CGR7zrjMybhtWu84GMWb-aibdDUCyKqPkPrnvM908KJYLBHVqc1RGUdgVBt4lM6YGb5Frno0rRD53_sluTHqZHziaO7j8/1iwvcjhesia1ott/pterodactyl.zip
    apt install unzip
    rm -r pterodactyl.zip
    unzip pterodactyl.zip
    cd /var/www/pterodactyl
    yarn
    chown -R www-data:www-data /var/www/pterodactyl/*
    php artisan optimize
    php artisan view:clear
    yarn build:production

    echo "Instalasi Billing Module selesai."
elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema dibatalkan karena Anda tidak memiliki panel Pterodactyl."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}

# Fungsi untuk menangani pilihan "UNINSTALL THEME"
uninstall_theme() {
    echo "Anda memilih untuk menghapus tema."
    echo "Menjalankan perintah uninstall tema..."

# Pemeriksaan apakah pengguna sudah memiliki panel Pterodactyl
    echo "KAMU HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then

        # Lanjutkan dengan instalasi tema

    # Perintah untuk uninstall tema
    cd /var/www/pterodactyl
    php artisan down
    curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
    chmod -R 755 storage/* bootstrap/cache
    composer install --no-dev --optimize-autoloader
    php artisan view:clear
    php artisan config:clear
    php artisan migrate --seed --force
    chown -R www-data:www-data /var/www/pterodactyl/*
    php artisan up

    echo "Uninstall tema selesai."
   elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema Enigma dibatalkan karena Anda tidak memiliki panel Pterodactyl."
        exit 1
    else
        echo "Pilihan tidak valid. Instalasi dibatalkan."
        exit 1
    fi
}
# Fungsi untuk menampilkan menu opsi
show_menu() {
    echo "Pilihan:"
    echo "1. FIX YARN"
    echo "2. INSTALL THEME ENIGMA"
    echo "3. INSTALL BILLING MODULE"
    echo "4. INSTALL THEME ICE MINECRAFT"
    echo "5. UNINSTALL THEME"
    echo "6. HAPUS FILE PTERODACTYL"
    echo "7. FUTURISTIC THEME"
    echo "8. KELUAR DARI INSTALLER"
}

# Fungsi untuk menangani pilihan setelah instalasi selesai
handle_choice() {
    read -p "PILIH OPSI (1-7): " CHOICE
    case "$CHOICE" in
        1)
            fix_yarn
            ;;
        2)
            install_theme_enigma
            ;;
        3)
            install_billing_module
            ;;
        4)
            installThemeice
            ;;
        5)
            uninstall_theme
            ;;
        6)
            deletefilesptero
            ;;
        7)
           install_futuristic_theme
            ;;
        8)
            echo "𝗔𝗡𝗗𝗔 𝗧𝗘𝗟𝗔𝗛 𝗞𝗘𝗟𝗨𝗔𝗥 𝗗𝗔𝗥𝗜 𝗣𝗥𝗢𝗚𝗥𝗔𝗠 𝗥𝗔𝗜𝗡𝗠𝗖"
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid. Silakan coba lagi."
            ;;
    esac
}

# Main program
echo "Masukkan lisensi Anda:"
read -r LICENSE_KEY
echo "$LICENSE_KEY" > "$LICENSE_FILE"

if check_license; then
    echo "Lisensi valid. Memulai instalasi..."
    install_software
    display_message

    while true
    do
        show_menu
        handle_choice
    done
else
    echo "Lisensi tidak valid. Instalasi dibatalkan."
    exit 1
fi
