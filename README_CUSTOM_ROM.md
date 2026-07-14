# 📱 Panduan Membuat Custom ROM Berbasis NusantaraProject

## Ringkasan
Panduan ini akan membantu Anda membuat custom ROM Android berdasarkan **NusantaraProject** dengan modifikasi kustom Anda sendiri.

---

## 📋 Prasyarat

### Hardware
- **RAM**: Minimal 16GB (disarankan 32GB+)
- **Storage**: Minimal 500GB ruang kosong (SSD lebih cepat)
- **Prosesor**: Multi-core (lebih banyak core = lebih cepat)

### Software
- **OS**: Ubuntu 20.04/22.04 LTS (Linux)
- **Python**: 3.8+
- **JDK**: OpenJDK 11
- **Repo Tool**: Versi terbaru

---

## 🔧 Langkah 1: Fork Repository NusantaraProject

### Opsi A: Fork Manual di GitHub (Direkomendasikan)

1. Buka browser ke: https://github.com/NusantaraProject-ROM/
2. Login ke akun GitHub Anda
3. Klik tombol **"Fork"** pada setiap repository yang ingin Anda modifikasi
4. Repository yang WAJIB di-fork:
   - `android_manifest` (manifest utama)
   - `android_vendor_nusantara` (vendor modifications)
   - `android_packages_apps_NusantaraWings` (app kustom)
   - `android_packages_apps_Settings` (settings modifikasi)
   - `android_frameworks_base` (framework modifications)

### Opsi B: Via GitHub CLI
```bash
# Install GitHub CLI jika belum ada
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh

# Login
gh auth login

# Fork repositori
gh repo fork NusantaraProject-ROM/android_manifest
gh repo fork NusantaraProject-ROM/android_vendor_nusantara
gh repo fork NusantaraProject-ROM/android_packages_apps_NusantaraWings
```

---

## 🔧 Langkah 2: Setup Build Environment

### 2.1 Install Dependencies
```bash
sudo apt update && sudo apt upgrade
sudo apt install -y bc bison build-essential ccache curl flex \
  g++-multilib gcc-multilib git gnupg gperf imagemagick \
  lib32ncurses5-dev lib32readline-dev lib32z1-dev \
  libelf-dev liblz4-tool libncurses5 libncurses5-dev \
  libsdl1.2-dev libssl-dev libxml2 libxml2-utils \
  lzop pngcrush rsync schedtool squashfs-tools xsltproc \
  yaml-cpp zip zlib1g-dev python3 python3-pip openjdk-11-jdk
```

### 2.2 Setup Repo Tool
```bash
# Install repo
mkdir -p ~/.local/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.local/bin/repo
chmod a+x ~/.local/bin/repo
export PATH=~/.local/bin:$PATH

# Tambahkan ke ~/.bashrc agar permanen
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
```

### 2.3 Setup ccache (untuk mempercepat build)
```bash
sudo apt install ccache
mkdir -p ~/.ccache
echo 'export USE_CCACHE=1' >> ~/.bashrc
echo 'export CCACHE_DIR=~/.ccache' >> ~/.bashrc
ccache -M 100G  # Atur sesuai kebutuhan
```

---

## 🔧 Langkah 3: Download Source Code

### 3.1 Buat direktori kerja
```bash
mkdir -p ~/custom-rom && cd ~/custom-rom
```

### 3.2 Inisialisasi Repo
```bash
# Ganti URL dengan repo fork Anda
repo init -u https://github.com/[USERNAME]/android_manifest -b 12
```

### 3.3 Sync Repository
```bash
# Proses ini bisa memakan waktu 1-6 jam tergantung koneksi
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc)
```

---

## 🔧 Langkah 4: Modifikasi Kustom

### 4.1 Edit Vendor Config
```bash
cd vendor/nusantara
# Edit sesuai kebutuhan
nano vendor.mk
nano Android.mk
```

### 4.2 Edit Branding
```bash
# Edit nama ROM
nano packages/apps/NusantaraWings/res/values/strings.xml

# Edit wallpaper dan icon
cp /path/to/your/wallpaper.png packages/apps/NusantaraWings/res/drawable/
```

### 4.3 Tambah Fitur Custom
```bash
# Edit framework
nano frameworks/base/core/res/res/values/config.xml
```

---

## 🔧 Langkah 5: Build ROM

### 5.1 Setup Environment
```bash
cd ~/custom-rom
source build/envsetup.sh
```

### 5.2 Pilih Device
```bash
# Lihat daftar device
lunch

# Pilih device (contoh untuk Pixel 5)
lunch aosp_sunset-userdebug
```

### 5.3 Build
```bash
# Mulai build
make nad -j$(nproc --all)

# Atau untuk hasil lebih kecil
make systemimage -j$(nproc --all)
```

---

## 🔧 Langkah 6: Output

Setelah build berhasil:
```
out/target/product/[device]/system.img
out/target/product/[device]/boot.img
out/target/product/[device]/vendor.img
```

---

## 📝 Tips Penting

1. **Gunakan ccache** - Mempercepat build berikutnya hingga 70%
2. **Sync secara berkala** - Update source secara rutin
3. **Backup sebelum modifikasi** - Selalu commit perubahan
4. **Test di emulator dulu** - Sebelum flash ke device asli

---

## 🔗 Repository Kunci NusantaraProject

| Repository | Fungsi |
|------------|--------|
| android_manifest | Manifest untuk sync semua source |
| android_vendor_nusantara | Modifikasi vendor Indonesia |
| android_frameworks_base | Framework dasar Android |
| android_packages_apps_Settings | Aplikasi Settings |
| android_packages_apps_NusantaraWings | App launcher kustom |

---

## 📞 Dukungan

- XDA Developers: https://forum.xda-developers.com/
- Telegram NusantaraROM: https://t.me/nusantararom
- GitHub Issues: https://github.com/NusantaraProject-ROM/

---

*Panduan ini dibuat berdasarkan proyek NusantaraProject (Android 12.0.0_r16)*
