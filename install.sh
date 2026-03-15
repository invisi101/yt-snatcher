#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons/hicolor/scalable/apps"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "=== ytdlp-gui installer ==="

# Install dependencies
echo "Checking dependencies..."
deps=()
pacman -Qi yt-dlp &>/dev/null || deps+=(yt-dlp)
pacman -Qi python-pyqt5 &>/dev/null || deps+=(python-pyqt5)

if [ ${#deps[@]} -gt 0 ]; then
    echo "Installing: ${deps[*]}"
    sudo pacman -S --needed --noconfirm "${deps[@]}"
else
    echo "All dependencies already installed."
fi

# Install script
mkdir -p "$BIN_DIR"
cp "$SCRIPT_DIR/ytdlp_gui.py" "$BIN_DIR/ytdlp-gui"
chmod +x "$BIN_DIR/ytdlp-gui"
echo "Installed ytdlp-gui to $BIN_DIR/"

# Install icon
mkdir -p "$ICON_DIR"
cp "$SCRIPT_DIR/icons/ytdlp-gui.svg" "$ICON_DIR/ytdlp-gui.svg"
echo "Installed icon to $ICON_DIR/"

# Install desktop file (patch Exec to use full path)
mkdir -p "$DESKTOP_DIR"
sed "s|^Exec=ytdlp-gui|Exec=$BIN_DIR/ytdlp-gui|" "$SCRIPT_DIR/ytdlp-gui.desktop" > "$DESKTOP_DIR/ytdlp-gui.desktop"
echo "Installed desktop entry to $DESKTOP_DIR/"

# Update desktop database
if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
fi

echo ""
echo "=== Done! ==="
echo "You can now launch ytdlp-gui from your app menu or run: ytdlp-gui"
