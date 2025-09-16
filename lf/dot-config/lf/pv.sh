#!/bin/bash

FILE="$1"

case "$FILE" in
    # Archives
    *.tar*|*.zip|*.rar|*.7z)
    # List contents of archives using atool
    if command -v atool > /dev/null; then
        atool -l "$FILE"
    else
        echo "atool not installed. Please install it to view archive contents."
    fi
    ;;
    # Comic boook archives
    *.cbz) unzip -l "$FILE";;
    # PDF files
    *.pdf)
    # Use pdftotext for PDF previews
    if command -v pdftotext > /dev/null; then
        pdftotext "$FILE" -
    else
        echo "pdftotext not installed. Please install it to view PDF previews."
    fi
    ;;
    # Images
    *.jpg|*.jpeg|*.png|*.gif|*.bmp)
    # Use img2txt for image previews
    if command -v img2txt > /dev/null; then
        img2txt "$FILE"
    else
        echo "img2txt not installed. Please install it to view image previews."
    fi
    ;;
    # Videos
    *.mp4|*.avi|*.mkv)
    # Use mediainfo for video metadata
    if command -v mediainfo > /dev/null; then
        mediainfo "$FILE"
    else
        echo "mediainfo not installed. Please install it to view video metadata."
    fi
    ;;
    # Audio files
    *.mp3|*.m4a|*.wav|*.flac)
    # Use mediainfo for audio metadata
    if command -v mediainfo > /dev/null; then
        mediainfo "$FILE"
    else
        echo "mediainfo not installed. Please install it to view audio metadata."
    fi
    ;;
    # Default fallback for unknown file types
    *)
    # Use highlight for syntax highlighting
    if command -v highlight > /dev/null; then
        highlight -O ansi "$FILE"
    else
        echo "highlight not installed."
    fi
    ;;
esac
