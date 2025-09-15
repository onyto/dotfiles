#!/bin/bash

# Check if a file is provided
if [ -z "$1" ]; then
    echo "No file provided"
    exit 1
fi

FILE="$1"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File does not exist"
    exit 1
fi

# Get the file extension
EXTENSION="${FILE##*.}"

# Handle different file types
case "$EXTENSION" in
    # # Images
    # jpg|jpeg|png|gif|bmp)
    #     # Use img2txt for image previews
    #     if command -v img2txt > /dev/null; then
    #         img2txt "$FILE"
    #     else
    #         echo "img2txt not installed. Please install it to view image previews."
    #     fi
    #     ;;
    # Videos
    mp4|avi|mkv)
        # Use mediainfo for video metadata
        if command -v mediainfo > /dev/null; then
            mediainfo "$FILE"
        else
            echo "mediainfo not installed. Please install it to view video metadata."
        fi
        ;;
    # Text files
    txt|md|log|conf|ini|sh|py|js|html|css|yml|yaml|toml)
        cat "$FILE"
        ;;
    # PDF files
    pdf)
        # Use pdftotext for PDF previews
        if command -v pdftotext > /dev/null; then
            pdftotext "$FILE" -
        else
            echo "pdftotext not installed. Please install it to view PDF previews."
        fi
        ;;
    # Audio files
    mp3|wav|flac)
        # Use mediainfo for audio metadata
        if command -v mediainfo > /dev/null; then
            mediainfo "$FILE"
        else
            echo "mediainfo not installed. Please install it to view audio metadata."
        fi
        ;;
    # Archives
    zip|tar|gz|bz2|cbz)
        # List contents of archives using atool
        if command -v atool > /dev/null; then
            atool -l "$FILE" | less
        else
            echo "atool not installed. Please install it to view archive contents."
        fi
	;;
    *)
        # Default fallback for unknown file types
        echo "Unsupported file type"
        ;;
esac
