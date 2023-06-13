#!/bin/bash

# Get the URL of the top 10 wallpapers with a title that contains "3840x2160" or "5120x2880"
urls=$(curl -s "https://www.reddit.com/r/wallpapers/top.json?limit=10" | jq -r '.data.children[].data | select(.title | test("1920x1080|3840x2160|5120x2880")).url' | head -1)

# Check if the API call was successful
if [[ -n "$urls" ]]; then
    url=$(echo "$urls" | head -1)
    echo "$url"
    wallpaper_dir="$HOME/.cache/dailywal"
    wallpaper_path="$wallpaper_dir/$(basename $url)"

    echo "$wallpaper_path"

    # Download the wallpaper if it doesn't exist yet
    if [[ ! -f "$wallpaper_path" ]]; then
        curl -s -o "$wallpaper_path" "$url"

        # Delete old file if there is more than one file in the directory
        files_in_dir=$(ls -1 "$wallpaper_dir" | wc -l)
        if [[ $files_in_dir -gt 1 ]]; then
            old_file=$(ls -t "$wallpaper_dir" | tail -1)
            rm "$wallpaper_dir/$old_file"
        fi
    fi
fi
