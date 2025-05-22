{pkgs, ...}:
pkgs.writeShellScriptBin "yt-music" ''
  audio_format="$1";
  yt_url="$2";

  if [ -z "$audio_format" ] || [ -z "$yt_url" ]; then
    echo "Usage: yt-music <Audio-Format> <YouTube-Music-URL>"
    exit 1
  fi

  yt-dlp \
    --extract-audio \
    --embed-metadata \
    --parse-metadata "%(playlist_index)s:%(track_number)s" \
    --embed-thumbnail \
    --audio-format "$audio_format" \
    -o "$HOME/Music/Downloads/%(album)s/%(title)s.%(ext)s" \
    "$yt_url"

  beet import "$HOME/Music/Downloads"
''
