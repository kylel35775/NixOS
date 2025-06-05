{pkgs}:
pkgs.writeShellScriptBin "nvim-launcher" ''
  server="/tmp/nvim-server.pipe"

  if [[ -e $server ]]; then
    nvim --headless --server $server --remote "$@"
  else
    kitty --detach nvim --listen $server "$@"
  fi
''
