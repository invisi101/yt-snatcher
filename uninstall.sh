#!/bin/bash
set -euo pipefail

echo "=== ytdlp-gui uninstaller ==="

rm -f "$HOME/.local/bin/ytdlp-gui"
rm -f "$HOME/.local/share/icons/hicolor/scalable/apps/ytdlp-gui.svg"
rm -f "$HOME/.local/share/applications/ytdlp-gui.desktop"

if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
fi

echo "All ytdlp-gui files removed."
