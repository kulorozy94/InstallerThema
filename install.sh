#!/bin/bash

LICENSE_FILE="$HOME/.license"

# ANSI escape sequences for colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RESET='\033[0m'  # Reset text color to default

check_license() {
    if [ -f "$LICENSE_FILE" ]; then
        LICENSE_KEY=$(cat "$LICENSE_FILE")
        if [ "$LICENSE_KEY" == "RAIN" ]; then
            return 0
        fi
    fi
    return 1
}

# Fungsi untuk menampilkan pesan setelah lisensi valid
display_message() {
    clear
    echo ""
    echo ""
    echo ""
    echo -e "${RED}"
    echo "____      _    ___ _   _ __  __  ____"
    echo "|  _ \\    / \\  |_ _| \\ | |  \\/  |/ ___|"
    echo "| |_) |  / _ \\  | ||  \\| | |\\/| | |"
    echo "|  _ <  / ___ \\ | || |\\  | |  | | |___"
    echo "|_| \\_\\/_/   \\_\\___|_| \\_|_|  |_|\\____|"
    echo ""
    echo "          \\ \\/ /"
    echo "           \\  /"
    echo "           /  \\"
    echo "          /_/\\_\\"
    echo ""
    echo "_   _    _    ____ _____  _    ____  _______     __"
    echo "| | | |  / \\  / ___|_   _|/ \\  |  _ \\| ____\\ \\   / /"
    echo "| |_| | / _ \\| |     | | / _ \\ | | | |  _|  \\ \\ / /"
    echo "|  _  |/ ___ \\ |___  | |/ ___ \\| |_| | |___  \\ V /"
    echo "|_| |_/_/   \\_\\____| |_/_/   \\_\\____/|_____|  \\_/"
    echo -e "${RESET}"
    echo ""
    echo ""
    echo -e "${BLUE}                    WHATSAPP : 085263390832${RESET}"
    echo -e "${YELLOW}                    YOUTUBE  : RAINMC${RESET}"
    echo ""
}

# Fungsi instalasi perangkat lunak
install_software() {
    echo -e ${RED}"𝗟𝗜𝗖𝗘𝗡𝗦𝗘 𝗔𝗡𝗗𝗔 𝗕𝗘𝗡𝗔𝗥!!, 𝗠𝗔𝗦𝗨𝗞𝗔𝗡 𝗨𝗟𝗔𝗡𝗚"
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
if check_license; then
    display_message
    install_software
    animate_text "𝖯𝖮𝖶𝖤𝖱𝖤𝖣 𝖡𝖸 𝖱𝖠𝖨𝖭𝖬𝖢"
else
    echo "Masukkan lisensi Anda:"
    read -r LICENSE_KEY
    echo "$LICENSE_KEY" > "$LICENSE_FILE"
    check_license
    if [ $? -eq 0 ]; then
        display_message
        install_software
        animate_text "𝖯𝖮𝖶𝖤𝖱𝖤𝖣 𝖡𝖸 𝖱𝖠𝖨𝖭"
    else
        echo "Lisensi tidak valid."
        exit 1
    fi
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
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
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
    echo "ANDA HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    
        echo "APAKAH ANDA SUDAH MENGHAPUS SEMUA THEME DI PANEL PTERODACTYL? (y/n)"
        read -r HAS_PTERODACTYL        
        if [ "$HAS_PTERODACTYL" == "y" ] || [ "$HAS_PTERODACTYL" == "Y" ]; then
            apt install git
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
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
            yarn build:production
            sudo php artisan optimize:clear

            echo "Konfigurasi tambahan selesai."
        elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ] || [ "$HAS_PTERODACTYL" == "n" ] || [ "$HAS_PTERODACTYL" == "N" ]; then
            echo "Mengabaikan konfigurasi tambahan untuk Pterodactyl."
            echo "Dibatalkan."
            exit 1
        else
            echo "Pilihan tidak valid. Instalasi dibatalkan."
            exit 1
        fi
    else
        echo "Anda harus memiliki panel Pterodactyl terlebih dahulu. Instalasi dibatalkan."
        exit 1
    fi
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
echo "ANDA HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    
        echo "APAKAH ANDA SUDAH MENGHAPUS SEMUA THEME DI PANEL PTERODACTYL? (y/n)"
        read -r HAS_PTERODACTYL        
        if [ "$HAS_PTERODACTYL" == "y" ] || [ "$HAS_PTERODACTYL" == "Y" ]; then
            echo "𝗣𝗥𝗢𝗦𝗘𝗦 𝗜𝗡𝗦𝗧𝗔𝗟𝗟"
            echo "ᴊɪᴋᴀ ᴀᴅᴀ ᴘɪʟɪʜᴀɴ ᴅɪʙᴀᴡᴀʜ sɪʟᴀʜᴋᴀɴ ᴘɪʟɪʜ Y"

            # Perintah untuk mengunduh dan menginstal tema Enigma
            apt install git
            cd /var/www && git clone https://github.com/rainmc0123/RainMc.git
            mv /var/www/RainMc/enigmarain.zip /var/www/
            rm -r RainMc
            apt install unzip
echo "𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗣𝗜𝗟𝗜𝗛 𝗔"
            unzip enigmarain.zip         
            echo "𝗣𝗥𝗢𝗦𝗘𝗦 𝗜𝗡𝗦𝗧𝗔𝗟𝗟"
            echo "ᴊɪᴋᴀ ᴀᴅᴀ ᴘɪʟɪʜᴀɴ ᴅɪʙᴀᴡᴀʜ sɪʟᴀʜᴋᴀɴ ᴘɪʟɪʜ ʏ"
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
            echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
            sudo apt update
            sudo apt install -y nodejs
            npm i -g yarn
            cd /var/www/pterodactyl
            yarn
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
            yarn build:production
            echo "Tema Enigma telah diinstal."

            # Perintah untuk instalasi tambahan
            echo "Melakukan konfigurasi tambahan..."

            # Pemeriksaan dan instalasi dependensi (contoh)
            # Misalnya:
            # sudo apt update
            # sudo apt install -y package_name

            echo "Konfigurasi tambahan selesai."
        elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ] || [ "$HAS_PTERODACTYL" == "n" ] || [ "$HAS_PTERODACTYL" == "N" ]; then
            echo "Mengabaikan konfigurasi tambahan untuk Pterodactyl."
            echo "Dibatalkan."
            exit 1
        else
            echo "Pilihan tidak valid. Instalasi dibatalkan."
            exit 1
        fi
    else
        echo "Anda harus memiliki panel Pterodactyl terlebih dahulu. Instalasi dibatalkan."
        exit 1
    fi
}

# Fungsi untuk menangani pilihan "INSTALL BILLING MODULE"
install_billing_module() {
echo "ANDA HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    
        echo "APAKAH ANDA SUDAH MENGHAPUS SEMUA THEME DI PANEL PTERODACTYL? (y/n)"
        read -r HAS_PTERODACTYL        
        if [ "$HAS_PTERODACTYL" == "y" ] || [ "$HAS_PTERODACTYL" == "Y" ]; then

            echo "𝗣𝗥𝗢𝗦𝗘𝗦 𝗜𝗡𝗦𝗧𝗔𝗟𝗟"
            echo "ᴊɪᴋᴀ ᴀᴅᴀ ᴘɪʟɪʜᴀɴ ᴅɪʙᴀᴡᴀʜ sɪʟᴀʜᴋᴀɴ ᴘɪʟɪʜ Y"
            
    echo "Anda memilih untuk menginstal Billing Module."
    echo "Menjalankan perintah instalasi Billing Module"
        # Lanjutkan dengan instalasi tema

    # Perintah untuk instalasi Billing Module
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/
    wget https://download1582.mediafire.com/tp82qkr13zlgXygV6f9r6KZbm0RdsVUhIhCYw5hAMd2fy2FwzVcQBSjA7jaZsW_n77bmtqWKiV1VKDrbOL9QiqJh2kzDR_o8d6LIxzVBCKctI3eCx2DfTpJpBAzg5uyg2vENBPeYcQrbXW0g0KHOWqPmr4h5tdAYJ3bFcD7BSQJwn-az/ajzpzd0n54d3rvm/billmodv11.zip
    apt install unzip
echo "𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗣𝗜𝗟𝗜𝗛 𝗔"
    unzip billmodv11.zip
    cd /var/www/pterodactyl
    yarn
    php artisan billing:install stable
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
    yarn build:production

            echo "Konfigurasi tambahan selesai."
        elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ] || [ "$HAS_PTERODACTYL" == "n" ] || [ "$HAS_PTERODACTYL" == "N" ]; then
            echo "Mengabaikan konfigurasi tambahan untuk Pterodactyl."
            echo "Dibatalkan."
            exit 1
        else
            echo "Pilihan tidak valid. Instalasi dibatalkan."
            exit 1
        fi
    else
        echo "Anda harus memiliki panel Pterodactyl terlebih dahulu. Instalasi dibatalkan."
        exit 1
    fi
}
installThemeice() {
echo "ANDA HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    
        echo "APAKAH ANDA SUDAH MENGHAPUS SEMUA THEME DI PANEL PTERODACTYL? (y/n)"
        read -r HAS_PTERODACTYL        
        if [ "$HAS_PTERODACTYL" == "y" ] || [ "$HAS_PTERODACTYL" == "Y" ]; then
            echo "𝗣𝗥𝗢𝗦𝗘𝗦 𝗜𝗡𝗦𝗧𝗔𝗟𝗟"
            echo "ᴊɪᴋᴀ ᴀᴅᴀ ᴘɪʟɪʜᴀɴ ᴅɪ ʙᴀᴡᴀʜ sɪʟᴀʜᴋᴀɴ ᴘɪʟɪʜ Y"
                sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    apt install unzip
    cd /var/www/pterodactyl
    yarn
    chown -R www-data:www-data /var/www/pterodactyl/*
    php artisan optimize
    php artisan view:clear
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

            cd /var/www/pterodactyl
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
            yarn build:production
            sudo php artisan optimize:clear

            echo "Konfigurasi tambahan selesai."
        elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ] || [ "$HAS_PTERODACTYL" == "n" ] || [ "$HAS_PTERODACTYL" == "N" ]; then
            echo "Mengabaikan konfigurasi tambahan untuk Pterodactyl."
            echo "Dibatalkan."
            exit 1
        else
            echo "Pilihan tidak valid. Instalasi dibatalkan."
            exit 1
        fi
    else
        echo "Anda harus memiliki panel Pterodactyl terlebih dahulu. Instalasi dibatalkan."
        exit 1
    fi
}
install_futuristic_theme() {
echo "ANDA HARUS MEMILIKI PANEL PTERODACTYL TERLEBIH DAHULU! APAKAH ANDA MEMPUNYAINYA? (YES/NO)"
    read -r HAS_PTERODACTYL

    if [ "$HAS_PTERODACTYL" == "YES" ] || [ "$HAS_PTERODACTYL" == "yes" ]; then
    
        echo "APAKAH ANDA SUDAH MENGHAPUS SEMUA THEME DI PANEL PTERODACTYL? (y/n)"
        read -r HAS_PTERODACTYL        
        if [ "$HAS_PTERODACTYL" == "y" ] || [ "$HAS_PTERODACTYL" == "Y" ]; then
            echo "𝗣𝗥𝗢𝗦𝗘𝗦 𝗜𝗡𝗦𝗧𝗔𝗟𝗟"
            echo "ᴊɪᴋᴀ ᴀᴅᴀ ᴘɪʟɪʜᴀɴ ᴅɪʙᴀᴡᴀʜ sɪʟᴀʜᴋᴀɴ ᴘɪʟɪʜ Y"
                sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update
    sudo apt install -y nodejs
    npm i -g yarn
    apt install unzip
    cd /var/www/pterodactyl
    yarn
    chown -R www-data:www-data /var/www/pterodactyl/*
    php artisan optimize
    php artisan view:clear
            cd /var/www/
            apt install git
            git clone https://github.com/rainmc0123/RainFuturistic
            mv /var/www/RainFuturistic/pterodactyl.zip /var/www/
            echo "𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗣𝗜𝗟𝗜𝗛 𝗔"
            unzip pterodactyl.zip
            echo "Installing theme..."
            cd /var/www/pterodactyl
   echo -e {RED}"𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗗𝗜𝗧𝗨𝗡𝗚𝗚𝗨, 𝗜𝗡𝗜 𝗔𝗞𝗔𝗡 𝗦𝗘𝗗𝗜𝗞𝗜𝗧 𝗟𝗔𝗠𝗔"
            yarn build:production
            sudo php artisan optimize:clear

            echo "Konfigurasi tambahan selesai."
        elif [ "$HAS_PTERODACTYL" == "NO" ] || [ "$HAS_PTERODACTYL" == "no" ] || [ "$HAS_PTERODACTYL" == "n" ] || [ "$HAS_PTERODACTYL" == "N" ]; then
            echo "Mengabaikan konfigurasi tambahan untuk Pterodactyl."
            echo "Dibatalkan."
            exit 1
        else
            echo "Pilihan tidak valid. Instalasi dibatalkan."
            exit 1
        fi
    else
        echo "Anda harus memiliki panel Pterodactyl terlebih dahulu. Instalasi dibatalkan."
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
    cd /var/www/
    rm -r pterodactyl.zip
    rm -r enigmarain.zip
    rm -r RainMc
    rm -r billmodv11.zip
    rm -r IceMinecraftTheme.tar.gz
    rm -r RainFuturistic
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
LICENSE_FILE="/tmp/license_key"
LICENSE_TIMESTAMP_FILE="/tmp/license_timestamp"

trap '' SIGINT

trap 'echo -e "\n𝗞𝗘𝗧𝗜𝗞 𝟵 𝗟𝗔𝗟𝗨 𝗘𝗡𝗧𝗘𝗥 𝗨𝗡𝗧𝗨𝗞 𝗞𝗘𝗟𝗨𝗔𝗥 𝗗𝗔𝗥𝗜 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗘𝗥";' SIGINT

show_menu() {
    if [ "$1" == "first" ]; then
        message="SAYA ADALAH PROGRAM YANG DIBUAT UNTUK MEMBANTU ANDA, SILAHKAN DIPILIH OPSI DIBAWAH INI."
        for (( i=0; i<${#message}; i++ )); do
            echo -n "${message:$i:1}"
            sleep 0.1
        done
        echo
    fi
    echo -e "\n\033[1;34mPilihan:\033[0m"
    for i in {1..9}; do
        case $i in
            1) echo -e "\033[1;34m1. FIX YARN\033[0m";;
            2) echo -e "\033[1;34m2. INSTALL THEME ENIGMA\033[0m";;
            3) echo -e "\033[1;34m3. INSTALL BILLING MODULE\033[0m";;
            4) echo -e "\033[1;34m4. INSTALL THEME ICE MINECRAFT\033[0m";;
            5) echo -e "\033[1;34m5. UNINSTALL THEME\033[0m";;
            6) echo -e "\033[1;34m6. HAPUS FILE PTERODACTYL\033[0m";;
            7) echo -e "\033[1;34m7. FUTURISTIC THEME (𝗘𝗥𝗥𝗢𝗥)\033[0m";;
            8) echo -e "\033[1;34m8. INSTALL CONTROL PANEL PTERODACTYL\033[0m";;
            9) echo -e "\033[1;34m9. KELUAR DARI INSTALLER\033[0m";;
        esac
        sleep 0.5
    done
}

handle_choice() {
    read -p "PILIH OPSI (1-9): " CHOICE
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
            curl -s https://raw.githubusercontent.com/rainmc0123/rainmc0123/main/install2.sh -o /tmp/install2.sh
            source /tmp/install2.sh
            ;;
        9)
            echo -e ${GREEN}"𝗔𝗡𝗗𝗔 𝗧𝗘𝗟𝗔𝗛 𝗞𝗘𝗟𝗨𝗔𝗥 𝗗𝗔𝗥𝗜 𝗜𝗡𝗦𝗧𝗔𝗟𝗟𝗘𝗥 𝗥𝗔𝗜𝗡𝗠𝗖"${RESET}
            exit 0
            ;;
        *)
            echo -e ${RED}"Pilihan tidak Benar Silakan coba lagi"${RESET}
            ;;
    esac
}

check_license() {
    # Tambahkan logika untuk memeriksa lisensi disini
    true
}

install_software() {
    # Tambahkan logika untuk menginstal perangkat lunak disini
    true
}

display_message() {
    # Tambahkan logika untuk menampilkan pesan setelah instalasi selesai disini
    true
}

# Main program
if [ -f "$LICENSE_TIMESTAMP_FILE" ]; then
    LAST_TIMESTAMP=$(cat "$LICENSE_TIMESTAMP_FILE")
    CURRENT_TIMESTAMP=$(date +%s)
    let DIFF=($CURRENT_TIMESTAMP-$LAST_TIMESTAMP)/86400

    if [ $DIFF -ge 1 ]; then
        echo "Lisensi telah kadaluarsa, silakan masukkan kembali lisensi Anda:"
        read -r LICENSE_KEY
        echo "$LICENSE_KEY" > "$LICENSE_FILE"
        echo "$(date +%s)" > "$LICENSE_TIMESTAMP_FILE"
    else
        LICENSE_KEY=$(cat "$LICENSE_FILE")
    fi
else
    echo "Masukkan lisensi Anda:"
    read -r LICENSE_KEY
    echo "$LICENSE_KEY" > "$LICENSE_FILE"
    echo "$(date +%s)" > "$LICENSE_TIMESTAMP_FILE"
fi

if check_license; then
    echo -e ${GREEN}"(𝗔𝗨𝗧𝗢𝗠𝗔𝗧𝗜𝗖) 𝗟𝗜𝗖𝗘𝗡𝗦𝗘 𝗕𝗘𝗡𝗔𝗥"${RESET}
    install_software
    display_message

    first_run=true

    while true
    do
        if [ "$first_run" == true ]; then
            show_menu "first"
            first_run=false
        else
            show_menu
        fi
        handle_choice
    done
else
    echo -e ${RED}"Lisensi tidak Benar Instalasi dibatalkan."${RESET}
    exit 1
fi
