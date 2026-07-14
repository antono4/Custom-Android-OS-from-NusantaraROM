# 📱 Custom Android OS - Berbasis NusantaraProject

<p align="center">
  <img src="https://img.shields.io/badge/Android-12.0.0--r16-green?style=for-the-badge&logo=android&logoColor=white" alt="Android Version">
  <img src="https://img.shields.io/badge/AOSP-v12-blue?style=for-the-badge&logo=google&logoColor=white" alt="AOSP">
  <img src="https://img.shields.io/badge/License-GPL--3.0-orange?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Status-Ready--to--Build-yellow?style=for-the-badge" alt="Status">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/NusantaraProject-ROM/Nusantara/master/goodies/banner.png" alt="NusantaraProject Banner" width="800">
</p>

> 🎉 **Proyek ini membantu Anda membuat Custom ROM Android sendiri berbasis NusantaraProject!**
> 
> Gratis, open-source, dan mudah diikuti langkah demi langkah.

---

## 📋 Daftar Isi

- [🎯 Gambaran Umum](#-gambaran-umum)
- [✨ Fitur](#-fitur)
- [🛠️ Prasyarat](#️-prasyarat)
- [📥 Instalasi](#-instalasi)
- [🔧 Langkah-Langkah Build](#-langkah-langkah-build)
- [🎨 Kustomisasi](#-kustomisasi)
- [📁 Struktur Repository](#-struktur-repository)
- [❓ FAQ](#-faq)
- [🤝 Kontribusi](#-kontribusi)
- [📜 Lisensi](#-lisensi)

---

## 🎯 Gambaran Umum

### Apa itu Custom ROM?

**Custom ROM** adalah sistem operasi Android yang dimodifikasi dari Android Open Source Project (AOSP) yang memungkinkan Anda:

- ✅ Menghilangkan bloatware bawaan
- ✅ Menambahkan fitur kustom
- ✅ Memperbarui Android versi lama ke versi baru
- ✅ Mengoptimalkan performa perangkat
- ✅ Meningkatkan privasi dan keamanan

### Mengapa Berbasis NusantaraProject?

| Keunggulan | NusantaraProject |
|------------|-----------------|
| 🇮🇩 **Buatan Indonesia** | Dikembangkan oleh developer Indonesia |
| 📦 **Clean Experience** | Bebas bloatware dan iklan |
| 🔧 **Highly Customizable** | Mudah dimodifikasi |
| 📱 **Multi-Device** | Support banyak perangkat |
| 🔄 **Active Development** | Update rutin dari AOSP |

---

## ✨ Fitur

### Fitur Utama
- 🚀 **Stock Android Experience** - Pengalaman Android murni tanpa modifikasi berlebihan
- 🎨 **Customizable UI** - Ubah tema, icon, dan wallpaper sesuai selera
- 🔒 **Enhanced Privacy** - Peningkatan privasi dan keamanan
- ⚡ **Performance Optimized** - Optimasi untuk performa terbaik
- 🌏 **Multi-Language** - Mendukung banyak bahasa termasuk Indonesia

### Fitur Kustomisasi
| Kategori | Tersedia |
|----------|----------|
| Status Bar | Clock, quick settings, network traffic |
| Navigation | Gesture, 3-button, 2-button |
| Lock Screen | Clock style, shortcuts, media art |
| Theme | Dark mode, accent colors, icon packs |
| Sound | Volume panel, ringtones |
| App Drawer | Grid size, sorting, hidden apps |

---

## 🛠️ Prasyarat

### Hardware Requirements

```
┌─────────────────────────────────────────────────────────┐
│  📦 STORAGE                                             │
│  ├─ Minimal: 500 GB (SSD sangat disarankan)              │
│  └─ Direkomendasikan: 1 TB+                             │
├─────────────────────────────────────────────────────────┤
│  💾 RAM                                                 │
│  ├─ Minimal: 16 GB                                     │
│  └─ Direkomendasikan: 32 GB+                           │
├─────────────────────────────────────────────────────────┤
│  ⚙️ PROSESOR                                            │
│  ├─ Minimal: 6 cores                                   │
│  └─ Direkomendasikan: 8+ cores                          │
├─────────────────────────────────────────────────────────┤
│  🌐 KONEKSI INTERNET                                     │
│  └─ Stabil - download source ~50-100 GB                │
└─────────────────────────────────────────────────────────┘
```

### Software Requirements

```
┌─────────────────────────────────────────────────────────┐
│  🖥️ SISTEM OPERASI                                      │
│  ├─ Primary: Ubuntu 20.04/22.04 LTS                     │
│  ├─ Alternative: Debian 11+                             │
│  └─ WSL2: Windows 11 (dengan的限制)                     │
├─────────────────────────────────────────────────────────┤
│  📦 PACKAGES YANG DIBUTUHKAN                            │
│  ├─ Python 3.8+                                         │
│  ├─ OpenJDK 11                                          │
│  ├─ Git                                                 │
│  ├─ Repo                                                │
│  └─ ccache                                              │
└─────────────────────────────────────────────────────────┘
```

### Ilustrasi Setup

```
┌────────────────────────────────────────────────────────────────┐
│                     🖥️ BUILD MACHINE                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        │
│  │   Ubuntu      │  │    RAM        │  │    SSD        │        │
│  │   20.04 LTS   │  │    32 GB      │  │    1 TB       │        │
│  └──────────────┘  └──────────────┘  └──────────────┘        │
│                                                                 │
│  ┌──────────────────────────────────────────────────────┐      │
│  │  🐍 Python  │  ☕ Java  │  📦 Repo  │  💾 ccache   │      │
│  └──────────────────────────────────────────────────────┘      │
└────────────────────────────────────────────────────────────────┘
```

---

## 📥 Instalasi

### Langkah 1: Clone Repository Ini

```bash
# Clone repository
git clone https://github.com/antono4/Custom-Android-OS-from-NusantaraROM.git

# Masuk ke direktori
cd Custom-Android-OS-from-NusantaraROM
```

![Clone Repository](https://i.imgur.com/placeholder.png)
*Hasil clone repository*

### Langkah 2: Fork NusantaraProject

```
1. Buka browser → https://github.com/NusantaraProject-ROM/
2. Klik tombol "Fork" pada repository berikut:
   ✓ android_manifest
   ✓ android_vendor_nusantara  
   ✓ android_packages_apps_NusantaraWings
   ✓ android_packages_apps_Settings
   ✓ android_frameworks_base
```

![Fork Process](https://i.imgur.com/placeholder.png)
*Proses forking repository*

### Langkah 3: Setup Build Environment

```bash
# Beri permissions ke script
chmod +x setup_custom_rom.sh

# Jalankan script setup
./setup_custom_rom.sh
```

![Setup Script](https://i.imgur.com/placeholder.png)
*Output dari script setup*

**Atau install manual:**

```bash
# Install dependencies
sudo apt update && sudo apt install -y \
  bc bison build-essential ccache curl flex \
  g++-multilib gcc-multilib git gnupg gperf \
  imagemagick lib32ncurses5-dev libelf-dev \
  liblz4-tool libncurses5-dev libsdl1.2-dev \
  libssl-dev libxml2 libxml2-utils lzop \
  pngcrush rsync schedtool squashfs-tools \
  xsltproc yaml-cpp zip zlib1g-dev python3 \
  openjdk-11-jdk

# Install Repo tool
mkdir -p ~/.local/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.local/bin/repo
chmod a+x ~/.local/bin/repo
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc

# Setup ccache
sudo apt install ccache
mkdir -p ~/.ccache
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
ccache -M 100G
```

---

## 🔧 Langkah-Langkah Build

### Diagram Alur Build

```
┌─────────────────────────────────────────────────────────────────┐
│                     📥 DOWNLOAD SOURCE                          │
│  repo init → repo sync → (⏳ 2-6 jam)                          │
│                           ↓                                      │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  ⬇️ Downloading ~120GB packages...                      │    │
│  │  ████████████████████████░░░░░░░░░░░░ 70%              │    │
│  └─────────────────────────────────────────────────────────┘    │
│                           ↓                                      │
├─────────────────────────────────────────────────────────────────┤
│                     🔧 KUSTOMISASI                              │
│  Edit vendor → Modifikasi theme → Tambah fitur                  │
│                           ↓                                      │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  ✏️ Mengedit config files...                            │    │
│  │  📝 vendor/nusantara/Android.mk                         │    │
│  │  🎨 packages/apps/Settings/res/values/                  │    │
│  └─────────────────────────────────────────────────────────┘    │
│                           ↓                                      │
├─────────────────────────────────────────────────────────────────┤
│                     🏗️ BUILD ROM                                │
│  source envsetup.sh → lunch → make                             │
│                           ↓                                      │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │  🔨 Compiling...                                        │    │
│  │  [  5%] ████░░░░░░░░░░░░░░░░░░░░░░░░░ 45/800          │    │
│  │  ⏱️ Estimated time: 3-4 hours                          │    │
│  └─────────────────────────────────────────────────────────┘    │
│                           ↓                                      │
├─────────────────────────────────────────────────────────────────┤
│                     ✅ OUTPUT                                   │
│  out/target/product/[device]/                                  │
│  ├─ system.img                                              │
│  ├─ vendor.img                                               │
│  ├─ boot.img                                                 │
│  └─ recovery.img                                             │
└─────────────────────────────────────────────────────────────────┘
```

### Detail Langkah

#### 1. Inisialisasi Repo

```bash
# Buat direktori kerja
mkdir -p ~/custom-rom && cd ~/custom-rom

# Inisialisasi repo (ganti USERNAME dengan username GitHub Anda)
repo init -u https://github.com/USERNAME/android_manifest -b 12

# Output yang diharapkan:
# ...
# Your identity is: your.email@example.com
# Your name and email address match your GitHub credentials.
# repo has been initialized in '/home/user/custom-rom'
# ...
```

#### 2. Sinkronisasi Source

```bash
# Sinkronisasi semua repository
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all)

# Tips: Gunakan flag -j untuk parallel download
# -j$(nproc --all) = gunakan semua core CPU
```

#### 3. Setup Environment

```bash
# Load environment variables
source build/envsetup.sh

# Output:
# ...
# including device/xxx/xxx/vendorsetup.sh
# build/envsetup.sh: Sourcing HAL modules...
# build/envsetup.sh: Processed 1 vendor HAL modules...
# 
# You're building on Linux
# 
# Lunch menu... type 'lunch' to see what to build
# ...
```

#### 4. Pilih Device

```bash
# Lihat daftar device
lunch

# Contoh output:
# 
# You're building on Linux
# 
# Lunch menu... type 'lunch' to see what to build
# 
# AOSP build variants:
# 1. aosp_arm64-eng
# 2. aosp_arm-eng
# 3. aosp_x86_64-eng
# 4. aosp_x86-eng
# 5. aosp_cf_arm64_auto-userdebug
# 6. nad_redfin-userdebug
# 7. nad_sunfish-userdebug
# ...
# 
# Which would you like to build? [aosp_arm64-eng]
```

#### 5. Mulai Build

```bash
# Build ROM
make nad -j$(nproc --all)

# Atau untuk build faster
make systemimage -j$(nproc --all)
make vendorimage -j$(nproc --all)

# Output:
# 
# [100% 801/801] Building with args: ...
# 
# #### build completed successfully (05:32:15 (hh:mm:ss)) ####
# 
```

---

## 🎨 Kustomisasi

### Menggunakan Script Kustomisasi

```bash
# Beri permission
chmod +x customize_rom.sh

# Jalankan
./customize_rom.sh
```

### Menu Kustomisasi

```
╔═══════════════════════════════════════════════════════╗
║         🎨 Custom ROM Customization Menu              ║
╚═══════════════════════════════════════════════════════╝

  ┌─────────────────────────────────────────────────┐
  │  1. 📝 Ganti Nama ROM                            │
  │     Ubah nama ROM sesuai keinginan               │
  ├─────────────────────────────────────────────────┤
  │  2. 🏷️ Ganti Branding/Vendor                   │
  │     Ubah nama vendor/brand                       │
  ├─────────────────────────────────────────────────┤
  │  3. 🎬 Edit Boot Animation                      │
  │     Ganti animasi boot dengan kustom             │
  ├─────────────────────────────────────────────────┤
  │  4. ⚙️ Modifikasi Settings                     │
  │     Atur preferensi settings default             │
  ├─────────────────────────────────────────────────┤
  │  5. 🌏 Tambah Bahasa Indonesia                  │
  │     Aktifkan bahasa Indonesia sebagai default     │
  ├─────────────────────────────────────────────────┤
  │  6. 🚀 Optimasi Performance                     │
  │     Tambah optimasi RAM dan CPU                  │
  ├─────────────────────────────────────────────────┤
  │  7. 🗑️ Hapus Bloatware                        │
  │     Buang aplikasi bawaan yang tidak perlu      │
  ├─────────────────────────────────────────────────┤
  │  8. ✨ Apply Semua Modifikasi                   │
  │     Terapkan semua kustomisasi sekaligus        │
  ├─────────────────────────────────────────────────┤
  │  0. 🚪 Exit                                     │
  └─────────────────────────────────────────────────┘
```

### Edit Manual

#### Mengubah Nama ROM

```bash
# Edit file ini
nano vendor/nusantara/config/nusantara.mk

# Cari dan ubah:
PRODUCT_NAME := NusantaraROM  →  PRODUCT_NAME := CustomROM
PRODUCT_DEVICE := nad        →  PRODUCT_DEVICE := custom
```

#### Mengubah Wallpaper

```bash
# Copy wallpaper baru
cp ~/Downloads/wallpaper.png vendor/nusantara/prebuilt/common/

# Edit references
nano vendor/nusantara/prebuilt/common/product.mk
```

#### Modifikasi Status Bar

```bash
# Edit frameworks
nano frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/phone/PhoneStatusBarPolicy.java
```

---

## 📁 Struktur Repository

```
Custom-Android-OS-from-NusantaraROM/
│
├── 📄 README.md                    # Dokumentasi utama
├── 📄 README_CUSTOM_ROM.md         # Panduan detail
│
├── 📂 android_manifest/            # Manifest repo (sudah di-clone)
│   ├── default.xml                 # Konfigurasi utama manifest
│   ├── snippets/                   # Snippet untuk berbagai ROM
│   │   ├── nusantara.xml          # Snippet NusantaraProject
│   │   ├── lineage.xml            # Snippet LineageOS
│   │   └── remove.xml             # Snippet untuk hapus app
│   └── README.md                  # Cara pakai manifest
│
├── 🔧 setup_custom_rom.sh          # Script setup build environment
├── 🎨 customize_rom.sh             # Script kustomisasi ROM
├── 🔱 fork_manifest.sh             # Script untuk fork repo
│
└── 📂 .github/                     # GitHub config (opsional)
```

### Penjelasan File Penting

| File | Fungsi |
|------|--------|
| `default.xml` | Manifest utama untuk sinkronisasi semua source |
| `nusantara.xml` | Snippet untuk menambahkan repo NusantaraProject |
| `setup_custom_rom.sh` | Install semua dependencies otomatis |
| `customize_rom.sh` | Menu interaktif untuk kustomisasi |

---

## 📊 Perbandingan Build Time

| Hardware | Cores | RAM | Estimated Time |
|----------|-------|-----|----------------|
| Desktop Low | 4 | 16GB | 8-10 hours |
| Desktop Mid | 8 | 32GB | 4-6 hours |
| Desktop High | 16 | 64GB | 2-3 hours |
| Server | 32+ | 128GB+ | 1-2 hours |

### Tips Mempercepat Build

```
┌─────────────────────────────────────────────────────────────────┐
│                    ⚡ TIPS SPEED UP                             │
├─────────────────────────────────────────────────────────────────┤
│  1. 💾 GUNAKAN CCACHE                                          │
│     export USE_CCACHE=1                                        │
│     ccache -M 100G                                             │
│     → Bisa mempercepat hingga 70% setelah build pertama        │
├─────────────────────────────────────────────────────────────────┤
│  2. 🔄 SINKRONISASI INCREMENTAL                                │
│     repo sync -c --no-tags                                     │
│     → Jangan gunakan --force-sync                              │
├─────────────────────────────────────────────────────────────────┤
│  3. 🧹 CLEAN BUILD SECARA SELECTIVE                             │
│     make systemimage -j$(nproc)                                │
│     → Build hanya component yang berubah                        │
├─────────────────────────────────────────────────────────────────┤
│  4. 💿 GUNAKAN SSD                                             │
│     → Baca/tulis 5x lebih cepat dari HDD                       │
└─────────────────────────────────────────────────────────────────┘
```

---

## ❓ FAQ

### Q: Berapa lama untuk build ROM pertama kali?

**A:** Tergantung hardware, biasanya 3-8 jam untuk build pertama. Build berikutnya bisa 30 menit - 1 jam dengan ccache.

### Q: Apakah saya bisa build tanpa Linux?

**A:** Bisa dengan WSL2 di Windows 11 atau menggunakan virtual machine. Namun, build langsung di Linux lebih stabil dan disarankan.

### Q: ROM apa saja yang support?

**A:** Semua device yang memiliki device tree di NusantaraProject. Untuk referensi, cek daftar device di [XDA NusantaraROM](https://forum.xda-developers.com/).

### Q: Bagaimana cara berkontribusi?

**A:** 
1. Fork repository NusantaraProject
2. Buat branch baru untuk fitur/fix
3. Commit perubahan Anda
4. Submit pull request

### Q: Apakah aman untuk daily use?

**A:** Custom ROM bisa digunakan untuk daily use jika di-build dengan benar. Namun, selalu backup data sebelum flash ke perangkat.

---

## 🤝 Kontribusi

Kami sangat menghargai kontribusi! Berikut cara berkontribusi:

```
┌─────────────────────────────────────────────────────────────────┐
│                  🤝 CARA KONTRIBUSI                             │
├─────────────────────────────────────────────────────────────────┤
│  1. 🍴 FORK                                                      │
│     Fork repository ini ke akun GitHub Anda                      │
│                                                                 │
│  2. 🌿 BUAT BRANCH                                              │
│     git checkout -b fitur-baru                                 │
│                                                                 │
│  3. ✏️ EDIT                                                      │
│     Buat perubahan yang diperlukan                              │
│                                                                 │
│  4. 📤 PUSH                                                      │
│     git push origin fitur-baru                                  │
│                                                                 │
│  5. 🔄 PULL REQUEST                                             │
│     Submit pull request untuk di-review                         │
└─────────────────────────────────────────────────────────────────┘
```

### Langkah Debugging Build Error

```
❌ Build Error?
│
├─→ Cek ERROR LOG di output terminal
│
├─→ Cari solusi di:
│     • https://forum.xda-developers.com/
│     • https://github.com/NusantaraProject-ROM/
│     • https://stackoverflow.com/
│
├─→ Bersihkan cache:
│     make clean && repo sync
│
└─→ Jika masih error, buka Issue di repository ini
```

---

## 📜 Lisensi

<p align="center">
  <img src="https://img.shields.io/badge/License-GPL--3.0-blue?style=for-the-badge" alt="License">
</p>

Proyek ini dilisensikan di bawah **GNU General Public License v3.0**.

```
┌─────────────────────────────────────────────────────────────────┐
│                     📜 LISENSI GPL-3.0                         │
├─────────────────────────────────────────────────────────────────┤
│  ✅ BOLEH:                                                       │
│     • Komersial usage                                           │
│     • Modifikasi                                                │
│     • Distribusi                                                │
│     • Patent usage                                              │
│                                                                 │
│  ❌ TIDAK BOLEH:                                                │
│     • Menutup source code                                       │
│     • Menggunakan trademark tanpa izin                          │
│                                                                 │
│  ⚠️ WAJIB:                                                      │
│     • Açıklama source code perubahan                            │
│     • Lisensi dan copyright notice                             │
│     • Distribusi di bawah GPL-3.0                              │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🙏 Credits

| Kontributor | Kontribusi |
|-------------|------------|
| [NusantaraProject-ROM](https://github.com/NusantaraProject-ROM/) | Base ROM & Source |
| [AOSP](https://source.android.com/) | Android Open Source Project |
| [Google](https://www.google.com/) | Android Platform |

---

## 📞 Dukungan

```
┌─────────────────────────────────────────────────────────────────┐
│                    📞 BUTUH BANTUAN?                            │
├─────────────────────────────────────────────────────────────────┤
│  💬 Telegram:  https://t.me/nusantararom                       │
│  🐛 Issues:    https://github.com/antono4/.../issues            │
│  📖 Wiki:      https://github.com/antono4/.../wiki              │
│  💰 Donasi:    https://nusantararom.org/donate                  │
└─────────────────────────────────────────────────────────────────┘
```

---

<p align="center">
  <img src="https://img.shields.io/badge/Made_With-❤️-red?style=for-the-badge" alt="Made with Love">
  <img src="https://img.shields.io/badge/Android-12-green?style=for-the-badge" alt="Android 12">
  <img src="https://img.shields.io/badge/From-Indonesia-orange?style=for-the-badge" alt="From Indonesia">
</p>

<p align="center">
  <strong>📱 Custom-Android-OS-from-NusantaraROM</strong>
  <br>
  <em>Dibuat dengan ❤️ di Indonesia</em>
  <br>
  <a href="https://github.com/antono4/Custom-Android-OS-from-NusantaraROM">Repository</a> •
  <a href="https://github.com/NusantaraProject-ROM">NusantaraProject</a> •
  <a href="https://nusantararom.org">Website</a>
</p>
