# ytdlp-gui

![ytdlp-gui](icons/ytdlp-gui.svg)

A simple PyQt5 GUI for downloading audio and video from YouTube using yt-dlp.

## Install

```bash
git clone https://github.com/invisi101/YTDLP-gui.git
cd YTDLP-gui
./install.sh
```

This installs `yt-dlp` and `python-pyqt5` via pacman (if not already installed), then copies the app, icon, and desktop entry to `~/.local/`. Make sure `~/.local/bin` is in your `PATH`. You can delete the cloned `YTDLP-gui` folder after installation.

## Usage

Launch from your app menu, or:

```bash
ytdlp-gui
```

## Uninstall

```bash
./uninstall.sh
```
