
# Alias for 'jq'
parse() {
  key=$1
  jq -j "$key" <<< $location_json 
}

# Fetch JSON from ipinfo and grab any status error
location_json=$(curl -s "https://ipinfo.io/json")
is_error=$(parse ".status")

# Check for invalid domain or incorrect route
if [[ -z $location_json || $is_error == 404 ]]; then
  echo "Error: Could not fetch location"
  exit 1
fi

# Default (no flags) execution
if [ $# -eq 0 ]; then
  output='"\(.city), \(.region) \(.postal), \(.country) (\(.loc))\n\(.ip) - \(.org)"'
  parse $output
  exit 1
fi

for flag in $@
do
  case $flag in
    --city)
      parse ".city"
      shift
    ;;

    --region)
      parse ".region"
      shift
    ;;

    --country)
      parse ".country"
      shift
    ;;

    --zip)
      parse ".postal"
      shift
    ;;

    --ip)
      parse ".ip"
      shift
    ;;

    --isp)
      parse ".org"
      shift
    ;;

    --timezone)
      parse ".timezone"
      shift
    ;;
    
    *)
      shift
    ;;
  esac

  if [[ $# != 0 ]]; then
    echo -n ", "
  fi
done

echo ""

