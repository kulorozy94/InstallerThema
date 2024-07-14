#!/bin/bash

# Mendapatkan tanggal hari ini
tanggal_hari_ini=$(date +"%Y-%m-%d")
echo "Tanggal hari ini: $tanggal_hari_ini"

# Meminta input dari pengguna
read -p "Masukkan jumlah hari ke depan yang ingin dihitung: " jumlah_hari

# Fungsi untuk menghitung dan menampilkan tanggal
tampilkan_tanggal_masa_depan() {
    local jumlah_hari=$1
    tanggal=$(date -d "$tanggal_hari_ini + $jumlah_hari day" +"%Y-%m-%d")
    echo "Tanggal setelah $jumlah_hari hari: $tanggal"
}

# Tampilkan tanggal ke depan
tampilkan_tanggal_masa_depan $jumlah_hari