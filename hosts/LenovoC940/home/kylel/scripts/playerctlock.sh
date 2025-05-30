
# Function to get metadata using playerctl
get_metadata() {
  key=$1
  limit=$2 # Character Limit

  metadata=$(playerctl metadata --format "{{ $key }}" 2>/dev/null)
  if [[ ${#metadata} -gt $limit ]]; then
    # Allocate 3 characters for ellipses
    metadata="${metadata:0:$(( limit - 3 ))}..."
  fi

  echo $metadata
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

limit=40
if [ $# -eq 0 ]; then
  # echo "Usage: $0 --title | --arturl | --artist | --length | --position | --time | --album | --source"
  title=$(get_metadata "title" $limit)
  album=$(get_metadata "album" $limit)
  artist=$(get_metadata "artist" $limit)

  time="$(get_metadata "duration(position)" $limit) / $(get_metadata "duration(mpris:length)" $limit)"
  
  echo -e "$title\n$album\n$artist\n$time"

  exit 1
fi

# Parse the argument
case "$1" in
--title)
  title=$(get_metadata "xesam:title" $limit)
  echo $title
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
