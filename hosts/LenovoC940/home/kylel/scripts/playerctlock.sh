
if [ $# -eq 0 ]; then
  echo "Usage: $0 --title | --arturl | --artist | --length | --position | --time | --album | --source"
  exit 1
fi

# Function to get metadata using playerctl
get_metadata() {
  key=$1
  playerctl metadata --format "{{ $key }}" 2>/dev/null
}

# Check for arguments

# Function to determine the source and return an icon and text
get_source_info() {
  trackid=$(get_metadata "mpris:trackid")
  if [[ -z "$trackid" ]]; then
    echo ""
  elif [[ "$trackid" == *"firefox"* ]]; then
    echo -e "Firefox 󰈹"
  elif [[ "$trackid" == *"spotify"* ]]; then
    echo -e "Spotify "
  elif [[ "$trackid" == *"chromium"* ]]; then
    echo -e "Chrome "
  else
    echo -e "Media Player"
  fi
}

# Parse the argument
case "$1" in
--title)
  title=$(get_metadata "xesam:title")
  if [ -z "$title" ]; then
    echo ""
  else
    echo "${title:0:35}" 
  fi
  ;;
--arturl)
  url=$(get_metadata "mpris:artUrl")
  if [ -z "$url" ]; then
    echo ""
  else
    if [[ "$url" == file://* ]]; then
      url=${url#file://}
    fi
    echo "$url"
  fi
  ;;
--artist)
  artist=$(get_metadata "xesam:artist")
  if [ -z "$artist" ]; then
    echo ""
  else
    echo "${artist:0:35}" 
  fi
  ;;
--length)
  length=$(get_metadata "duration(mpris:length)")
  if [ -z "$length" ]; then
    echo ""
  else
    echo "$length"
  fi
  ;;
--position)
  position=$(get_metadata "duration(position)")
  if [ -z "$position" ]; then
    echo ""
  else
    echo "$position"
  fi
  ;;
--time)
  position=$(get_metadata "duration(position)")
  length=$(get_metadata "duration(mpris:length)")
  time="$position / $length"
  if [ -z "$position" ]; then
    echo ""
  else
    echo "$time"
  fi
  ;;
--status)
  status=$(playerctl status 2>/dev/null)
  if [[ $status == "Playing" ]]; then
    echo "󰎆"
  elif [[ $status == "Paused" ]]; then
    echo "󱑽"
  else
    echo ""
  fi
  ;;
--album)
  album=$(playerctl metadata --format "{{ xesam:album }}" 2>/dev/null)
  if [[ -n $album ]]; then
    echo "$album"
  else
    status=$(playerctl status 2>/dev/null)
    if [[ -n $status ]]; then
      echo ""
    else
      echo ""
    fi
  fi
  ;;
--source)
  get_source_info
  ;;
*)
  echo "Invalid option: $1"
  echo "Usage: $0 --title | --arturl | --artist | --length | --position | --time | --album | --source"
  exit 1
  ;;
esac
