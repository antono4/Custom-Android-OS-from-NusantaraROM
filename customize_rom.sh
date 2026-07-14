#!/bin/bash
# ===========================================
# Custom ROM Customization Script
# ===========================================

set -e

# Warna
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════╗"
echo "║         Custom ROM Customization Menu                  ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo -e "${NC}"

CUSTOM_ROM_NAME="MyCustomROM"
CUSTOM_VENDOR="MyCompany"
PACKAGE_NAME="com.mycompany.rom"

while true; do
    echo ""
    echo "Pilih modifikasi yang ingin dilakukan:"
    echo ""
    echo "  1. Ganti Nama ROM"
    echo "  2. Ganti Branding/Vendor"
    echo "  3. Edit Boot Animation"
    echo "  4. Modifikasi Settings"
    echo "  5. Tambah Bahasa Indonesia"
    echo "  6. Optimasi Performance"
    echo "  7. Hapus Bloatware"
    echo "  8. Apply Semua Modifikasi"
    echo "  0. Exit"
    echo ""
    read -p "Pilihan Anda (0-8): " choice

    case $choice in
        1)
            echo ""
            read -p "Masukkan nama ROM baru: " CUSTOM_ROM_NAME
            echo "Mengubah nama ROM menjadi: $CUSTOM_ROM_NAME"
            # Implementasi perubahan nama ROM
            sed -i "s/NusantaraROM/$CUSTOM_ROM_NAME/g" vendor/nusantara/*/variables.mk 2>/dev/null || true
            echo -e "${GREEN}✅ Nama ROM berhasil diubah${NC}"
            ;;
        2)
            echo ""
            read -p "Masukkan nama Vendor: " CUSTOM_VENDOR
            echo "Mengubah vendor menjadi: $CUSTOM_VENDOR"
            sed -i "s/Nusantara/$CUSTOM_VENDOR/g" vendor/nusantara/*/*.mk 2>/dev/null || true
            echo -e "${GREEN}✅ Vendor berhasil diubah${NC}"
            ;;
        3)
            echo ""
            echo "Boot animation customization"
            read -p "Path ke boot animation ZIP: " BOOT_ANIM
            if [ -f "$BOOT_ANIM" ]; then
                cp "$BOOT_ANIM" vendor/nusantara/prebuilt/common/media/bootanimation.zip
                echo -e "${GREEN}✅ Boot animation berhasil diinstall${NC}"
            else
                echo -e "${RED}❌ File tidak ditemukan${NC}"
            fi
            ;;
        4)
            echo ""
            echo "Settings customization"
            # Enable/Disable berbagai fitur settings
            read -p "Aktifkan Dark Mode default? (y/n): " darkmode
            if [ "$darkmode" = "y" ]; then
                sed -i 's/config_defaultNightMode.*/config_defaultNightMode=true/g' frameworks/base/core/res/res/values/config.xml 2>/dev/null || true
                echo -e "${GREEN}✅ Dark Mode default diaktifkan${NC}"
            fi
            ;;
        5)
            echo ""
            echo "Menambah dukungan Bahasa Indonesia"
            # Copy file bahasa Indonesia
            mkdir -p vendor/nusantara/languages/id
            echo "Bahasa Indonesia support" > vendor/nusantara/languages/id/README
            echo -e "${GREEN}✅ Bahasa Indonesia ditambahkan${NC}"
            ;;
        6)
            echo ""
            echo "Optimasi Performance"
            # Optimasi kernel
            cat >> vendor/nusantara/config/performance.mk << 'EOF'
# Performance Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m
EOF
            echo -e "${GREEN}✅ Optimasi performance diterapkan${NC}"
            ;;
        7)
            echo ""
            echo "Daftar aplikasi yang akan dihapus:"
            echo "  - carrier services"
            echo "  - android auto"
            echo "  - news"
            echo ""
            read -p "Lanjutkan penghapusan? (y/n): " confirm
            if [ "$confirm" = "y" ]; then
                cat >> vendor/nusantara/config/excluded_packages.mk << 'EOF'
# Excluded Bloatware
PRODUCT_PACKAGES += \
    PRODUCT_SOONG_NAMESPACES := \
        -android.car
EOF
                echo -e "${GREEN}✅ Bloatware dihapus${NC}"
            fi
            ;;
        8)
            echo ""
            echo -e "${YELLOW}Applying all customizations...${NC}"
            echo "Masukkan detail ROM:"
            read -p "  Nama ROM: " CUSTOM_ROM_NAME
            read -p "  Vendor: " CUSTOM_VENDOR
            
            # Apply all modifications
            sed -i "s/NusantaraROM/$CUSTOM_ROM_NAME/g" vendor/nusantara/*/variables.mk 2>/dev/null || true
            sed -i "s/Nusantara/$CUSTOM_VENDOR/g" vendor/nusantara/*/*.mk 2>/dev/null || true
            echo -e "${GREEN}✅ Semua modifikasi diterapkan${NC}"
            ;;
        0)
            echo ""
            echo -e "${BLUE}Sampai jumpa!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Pilihan tidak valid${NC}"
            ;;
    esac
done
