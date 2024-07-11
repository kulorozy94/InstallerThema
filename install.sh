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
    echo "                         ____      _    ___ _   _ __  __ ____"
    echo "                        |  _ \\    / \\  |_ _| \\ | |  \\/  |/ ___|"
    echo "                        | |_) |  / _ \\  | ||  \\| | |\\/| | |"
    echo "                        |  _ <  / ___ \\ | || |\\  | |  | | |___"
    echo "                        |_| \\_\\/_/   \\_\\___|_| \\_|_|  |_|\\____|"
    echo -e "${RESET}"
    echo ""
    echo -e "${YELLOW}                    WHATSAPP : 085263390832${RESET}"
    echo -e "${GREEN}                    YOUTUBE  : RAINMC${RESET}"
    echo ""
    echo ""
}

# Fungsi instalasi perangkat lunak
install_software() {
    echo "MASUKAN ULANG LICENSE ANDA"
}

# Fungsi untuk animasi teks berkedip
animate_text() {
    local text="$1"
    local delay="${2:-0.1}"
    local colors=("$RED" "$GREEN" "$BLUE" "$YELLOW")

    for (( i = 0; i < 10; i++ )); do
        color_index=$(( $i % ${#colors[@]} ))
        echo -en "${colors[$color_index]}"
        echo -en "$text"
        sleep "$delay"
        echo -en "\r${RESET}"
        sleep "$delay"
    done
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
        cd /var/www && wget https://download1532.mediafire.com/jgxrnebihivgsD7QzyXJzHuVdHF9t32QdWw5hCT1GUEimrT0rTIxt22C0AEz5mv-eqrCfpTcRt2kIj_z1HTHZoX0DJW3qpfxRgdZcld44HBp3kKn6faPrE9X2Ofda8kbHuyLnrT1J5f1JVh1iSFHd8CE55zlf3MbGenuYvOAqWo/cleu1ftfo2pcqmz/ENIGMA+PREMIUM+REMAKE+BY+RAINSTOREID.zip
        unzip ENIGMA+PREMIUM+REMAKE+BY+RAINSTOREID.zip
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
    wget https://download1530.mediafire.com/twq0z9gr2cygc-UEAJHSGPeKwVyPAxron9kwnztIajcwdNOn5U2qHhtGfWdxGlV9Mp-V_BFTH5jXVIqZpH4WaIHL6nQ9m2sNfwQFefgY63zs0ITphU3pPzhyaN8pQX0umB2cyM3W59LqdUZz1ucJ_-vY-5VL7PETWdNu9Gfe2VZzdEo/1xh1v7j7sveba8v/BILLING+MODULE+V1.11.zip
    unzip BILLING+MODULE+V1.11.zip
    cd /var/www/pterodactyl
    yarn
    php artisan billing:install stable
    yarn build:production

    echo "Instalasi Billing Module selesai."
elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ]; then
        echo "Instalasi tema Enigma dibatalkan karena Anda tidak memiliki panel Pterodactyl."
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

# Meminta dan memeriksa lisensi
echo "Masukkan lisensi Anda:"
read -r LICENSE_KEY
echo "$LICENSE_KEY" > "$LICENSE_FILE"

if check_license; then
    echo "Lisensi valid. Memulai instalasi..."
    install_software
    display_message

    # Menampilkan pilihan setelah instalasi selesai
    echo "Pilihan:"
    echo "> 1. FIX YARN"
    echo "> 2. INSTALL THEME ENIGMA"
    echo "> 3. INSTALL BILLING MODULE"
    echo "> 4. INSTALL THEME ICE MINECRAFT (ERROR)"
    echo "> 5. UNINSTALL THEME"
    echo "> 6. HAPUS FILE PTERODACTYL"

    # Menambahkan prompt dengan tanda panah (>)
    read -p "PILIH OPSI (1-6) : " CHOICE
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
        *)
            echo "Pilihan tidak valid. Keluar."
            exit 1
            ;;
    esac
else
    echo "Lisensi tidak valid. Instalasi dibatalkan."
    exit 1
fi
