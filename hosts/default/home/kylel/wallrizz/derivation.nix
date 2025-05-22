{
  lib,
  stdenv,
  fetchFromGitHub,
  makeDesktopItem,
  makeBinaryWrapper,
  quickjs,
  fzf,
}: let
  qjs-ext-lib = fetchTarball {
    url = "https://github.com/ctn-malone/qjs-ext-lib/archive/refs/tags/0.12.4.zip";
    sha256 = "1lfw6g6729ibf9q37q8r4vn6bk5chkjbgjfil9yzadygr0bh4r0i";
  };
  justjs = fetchTarball {
    url = "https://github.com/5hubham5ingh/justjs/tarball/main";
    sha256 = "0iw9r6yn9ln3xc6c3kyyfgqxs1z4k4yjl5mwd1xncqh10h1pzfb3";
  };
  desktopEntry = makeDesktopItem {
    name = "wallrizz";
    desktopName = "WallRizz";
    icon = "";
    comment = "Terminal based wallpaper and system theme manager that lets you \"𝑹𝒊𝒛𝒛 𝒚𝒐𝒖𝒓 𝑳𝒊𝒏𝒖𝒙\" with ease";
    tryExec = "WallRizz";
    exec = "kitty --class wallrizz --single-instance -o allow_remote_control=yes WallRizz --disable-notification --preview-mode list";
    terminal = false;
    type = "Application";
    mimeTypes = ["image/jpeg" "image/png" "image/gif"];
    categories = ["Settings" "Utility" "ConsoleOnly"];
    keywords = ["Wallpaper" "Manager"];
  };
in
  stdenv.mkDerivation {
    pname = "WallRizz";
    version = "v1.2.0";

    src = fetchFromGitHub {
      owner = "5hubham5ingh";
      repo = "WallRizz";
      rev = "v1.2.0";
      sha256 = "1r9s5klpdkssd96rjsyq0rmzh0fhx5516pfc59aiqqf13xgqdvz8";
    };

    nativeBuildInputs = [quickjs makeBinaryWrapper];
    buildInputs = [qjs-ext-lib justjs fzf];

    buildPhase = ''
      runHook preBuild

      ln -s ${justjs} ../justjs
      ln -s ${qjs-ext-lib} ../qjs-ext-lib
      cd ./src

      qjsc -D extensionHandlerWorker.js -o WallRizz main.js

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      install -m755 WallRizz $out/bin

      mkdir -p $out/share/applications
      cp ${desktopEntry}/share/applications/wallrizz.desktop $out/share/applications/wallrizz.desktop

      runHook postInstall
    '';

    postFixup = ''
      wrapProgram $out/bin/WallRizz \
        --prefix PATH : ${lib.makeBinPath [fzf]} \
    '';

    meta = {
      description = "Terminal based wallpaper and system theme manager that lets you \"𝑹𝒊𝒛𝒛 𝒚𝒐𝒖𝒓 𝑳𝒊𝒏𝒖𝒙\" with ease";
      homepage = "https://github.com/5hubham5ingh/WallRizz";
      license = lib.licenses.mit;
      # maintainers = with lib.maintainers; [
      #
      # ];
      mainProgram = "WallRizz";
    };
  }
