#!/bin/bash
# ===========================================
# Script untuk Fork NusantaraProject Manifest
# ===========================================

set -e

# Warna
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}NusantaraProject Manifest Fork Script${NC}"
echo ""

# Cek GitHub CLI
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI diperlukan${NC}"
    echo "Install: curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg"
    exit 1
fi

# Cek autentikasi
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}⚠️  Login ke GitHub diperlukan${NC}"
    gh auth login
fi

# Ambil username
USERNAME=$(gh api user | jq -r '.login')
echo -e "${GREEN}Logged in as: $USERNAME${NC}"
echo ""

# Repositori yang akan di-fork
REPOS=(
    "NusantaraProject-ROM/android_manifest"
    "NusantaraProject-ROM/android_vendor_nusantara"
    "NusantaraProject-ROM/android_packages_apps_NusantaraWings"
    "NusantaraProject-ROM/android_packages_apps_Settings"
    "NusantaraProject-ROM/android_frameworks_base"
)

echo "Repositori yang akan di-fork:"
for repo in "${REPOS[@]}"; do
    echo "  - $repo"
done
echo ""

read -p "Lanjutkan fork? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "Dibatalkan."
    exit 0
fi

echo ""
echo "Memulai fork..."

for repo in "${REPOS[@]}"; do
    echo -n "  Forking $repo... "
    
    # Cek apakah sudah di-fork
    reponame=$(basename $repo)
    if gh repo view "$USERNAME/$reponame" &> /dev/null; then
        echo -e "${YELLOW}(already forked)${NC}"
    else
        # Fork repository
        if gh repo fork "$repo" --clone=false 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
        else
            echo -e "${RED}✗${NC}"
        fi
    fi
done

echo ""
echo -e "${GREEN}✅ Forking complete!${NC}"
echo ""
echo "Repositori fork Anda: https://github.com/$USERNAME"
echo ""
echo "Langkah berikutnya:"
echo "1. Clone manifest Anda:"
echo "   git clone https://github.com/$USERNAME/android_manifest.git"
echo ""
echo "2. Edit default.xml untuk menggunakan repositori fork Anda"
echo ""
echo "3. Initialize repo:"
echo "   repo init -u https://github.com/$USERNAME/android_manifest -b main"
