#!/bin/bash
# ===========================================
# Custom ROM Setup Script untuk NusantaraProject
# ===========================================

set -e

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║     Custom ROM Setup - Berbasis NusantaraProject      ║"
echo "║                   Android 12.0.0_r16                   ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Cek OS
echo -e "${YELLOW}[1/6] Memeriksa sistem...${NC}"
if [[ ! -f /etc/lsb-release ]]; then
    echo -e "${RED}❌ Script ini hanya untuk Linux (Ubuntu/Debian)${NC}"
    exit 1
fi

# Cek RAM
RAM_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
RAM_GB=$((RAM_KB / 1024 / 1024))
echo "   RAM terdeteksi: ${RAM_GB}GB"
if [[ $RAM_GB -lt 16 ]]; then
    echo -e "${YELLOW}⚠️  Peringatan: Direkomendasikan minimal 16GB RAM${NC}"
fi

# Cek storage
STORAGE_KB=$(df -k /workspace | tail -1 | awk '{print $4}')
STORAGE_GB=$((STORAGE_KB / 1024 / 1024))
echo "   Storage tersedia: ${STORAGE_GB}GB"
if [[ $STORAGE_GB -lt 300 ]]; then
    echo -e "${YELLOW}⚠️  Peringatan: Direkomendasikan minimal 300GB${NC}"
fi

# Install dependencies
echo -e "${YELLOW}[2/6] Menginstall dependencies...${NC}"
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y bc bison build-essential ccache curl flex \
        g++-multilib gcc-multilib git gnupg gperf imagemagick \
        lib32ncurses5-dev lib32readline-dev lib32z1-dev \
        libelf-dev liblz4-tool libncurses5 libncurses5-dev \
        libsdl1.2-dev libssl-dev libxml2 libxml2-utils \
        lzop pngcrush rsync schedtool squashfs-tools xsltproc \
        yaml-cpp zip zlib1g-dev python3 python3-pip openjdk-11-jdk
    echo -e "${GREEN}✅ Dependencies terinstall${NC}"
else
    echo -e "${RED}❌ Debian/Ubuntu diperlukan${NC}"
    exit 1
fi

# Setup Repo
echo -e "${YELLOW}[3/6] Setup Repo Tool...${NC}"
if command -v repo &> /dev/null; then
    echo -e "${GREEN}✅ Repo sudah terinstall${NC}"
else
    mkdir -p ~/.local/bin
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.local/bin/repo
    chmod a+x ~/.local/bin/repo
    echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
    export PATH=~/.local/bin:$PATH
    echo -e "${GREEN}✅ Repo terinstall${NC}"
fi

# Setup ccache
echo -e "${YELLOW}[4/6] Setup ccache...${NC}"
if command -v ccache &> /dev/null; then
    mkdir -p ~/.ccache
    echo 'export USE_CCACHE=1' >> ~/.bashrc
    echo 'export CCACHE_DIR=~/.ccache' >> ~/.bashrc
    export USE_CCACHE=1
    export CCACHE_DIR=~/.ccache
    ccache -M 100G
    echo -e "${GREEN}✅ ccache configured (100GB)${NC}"
else
    echo -e "${YELLOW}⚠️  ccache tidak ditemukan, melewati${NC}"
fi

# Create working directory
echo -e "${YELLOW}[5/6] Membuat direktori kerja...${NC}"
WORKDIR=~/custom-rom
mkdir -p $WORKDIR
cd $WORKDIR
echo -e "${GREEN}✅ Direktori: $WORKDIR${NC}"

# Git configuration
echo -e "${YELLOW}[6/6] Konfigurasi Git...${NC}"
git config --global user.email "your.email@example.com"
git config --global user.name "Your Name"
echo -e "${GREEN}✅ Git configured${NC}"

# Summary
echo ""
echo -e "${BLUE}╔═══════════════════════════════════════════════════════╗"
echo "║                  SETUP COMPLETE!                       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}Langkah selanjutnya:${NC}"
echo ""
echo "1. FORK repository NusantaraProject di GitHub:"
echo "   https://github.com/NusantaraProject-ROM/"
echo ""
echo "2. Edit manifest dengan URL fork Anda:"
echo "   nano .repo/manifests/default.xml"
echo ""
echo "3. Initialize repo:"
echo "   cd $WORKDIR"
echo "   repo init -u https://github.com/[USERNAME]/android_manifest -b 12"
echo ""
echo "4. Sync source:"
echo "   repo sync -c --force-sync --no-tags -j$(nproc)"
echo ""
echo "5. Build ROM:"
echo "   source build/envsetup.sh"
echo "   lunch aosp_[device]-userdebug"
echo "   make nad -j$(nproc)"
echo ""
