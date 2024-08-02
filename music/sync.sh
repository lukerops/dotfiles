#!/usr/bin/env bash

podman build -f $(pwd)/Dockerfile -t spotdl:latest .
SPOTDL="podman run -it --rm --name spotdl --volume $(xdg-user-dir 'MUSIC'):/music spotdl:latest"

PLAYLISTS=(
    # This Is NewJeans
    'https://open.spotify.com/playlist/37i9dQZF1DWVGwK1DVdGDJ'
    # WOR K OUT
    'https://open.spotify.com/playlist/37i9dQZF1DX3ZeFHRhhi7Y'
    # The Locker
    'https://open.spotify.com/playlist/37i9dQZF1DWYmDNATMglFU'
    # Top 50 - South Korea
    'https://open.spotify.com/playlist/37i9dQZEVXbNxXF4SkHj9F'
    # Pop Brasil
    'https://open.spotify.com/playlist/37i9dQZF1DWVLcZxJO5zyf'
    # Esquenta Sertanejo
    'https://open.spotify.com/playlist/37i9dQZF1DXdSjVZQzv2tl'
    # KOREAN FEMALE RAPPERS
    'https://open.spotify.com/playlist/4ESkcfmTgfeNV1X9dWjPLv'
    # Paredão Explode
    'https://open.spotify.com/playlist/37i9dQZF1DXcedEPj5nsZ0'
    # SMALLVILLE SONGS
    'https://open.spotify.com/playlist/1AW02BrvkCNQCqZENLSVQU'
    # ALT NOW
    'https://open.spotify.com/playlist/37i9dQZF1DWVqJMsgEN0F4'
    # oiii
    'https://open.spotify.com/playlist/37i9dQZF1DXcSVNtcbJ15L'
    # omw from the pit
    # 'https://open.spotify.com/playlist/37i9dQZF1DX6YSLRPj8EAI'
    # Pop Up
    'https://open.spotify.com/playlist/37i9dQZF1DX6aTaZa0K6VA'
    # EUROBEAT 🔥
    'https://open.spotify.com/playlist/3oL0hh68rt0mQVNEC9UTLG'
    # Love Hurts
    'https://open.spotify.com/intl-pt/album/0tpuATlBGu5CCcJAzxCIl9'
    # Para você (brasileiras)
    'https://open.spotify.com/playlist/5c4131jyEOt4Kam5VmIMB3'
    # Tarro
    'https://open.spotify.com/intl-pt/artist/0SXgKLNtpIrH29F1vMRWzj'
)

$SPOTDL \
    `# --only-verified-results` \
    --scan-for-songs \
    --format=opus \
    --detect-formats=ogg \
    --bitrate=disable \
    --m3u='{list}' \
    --output='{album-artist}/{album}/{album-artist} - {title}.{output-ext}' \
    --threads=$(nproc --ignore=4) \
    download \
        ${PLAYLISTS[@]}

find $(xdg-user-dir 'MUSIC') -name '*.opus' | while read music; do
    mv "$music" "$(dirname "$music")/$(basename -s '.opus' "$music").ogg"
done

mkdir -p "$(xdg-user-dir 'MUSIC')/Playlists"
find $(xdg-user-dir 'MUSIC') -name '*.m3u8' | while read playlist; do
    sed -i 's/\.opus/\.ogg/g' "$playlist"
    mv "$playlist" "$(xdg-user-dir 'MUSIC')/Playlists/$(basename -s '.m3u8' "$playlist").m3u"
done
