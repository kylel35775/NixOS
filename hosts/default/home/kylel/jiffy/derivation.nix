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
    name = "jiffy";
    desktopName = "jiffy";
    icon = "";
    comment = "𝐴𝑝𝑝 𝑙𝑎𝑢𝑛𝑐ℎ𝑒𝑟 | 𝐵𝑎𝑠𝑖𝑐 𝑐𝑎𝑙𝑐𝑢𝑙𝑎𝑡𝑜𝑟 | 𝐸𝑚𝑜𝑗𝑖 𝑝𝑖𝑐𝑘𝑒𝑟 | 𝐶𝑢𝑠𝑡𝑜𝑚 𝑐𝑜𝑚𝑚𝑎𝑛𝑑 𝑝𝑎𝑙𝑙𝑒𝑡𝑡𝑒";
    tryExec = "jiffy";
    exec = "kitty --single-instance -o allow_remote_control=yes jiffy";
    terminal = false;
    type = "Application";
    mimeTypes = [];
    categories = ["Settings" "Utility" "ConsoleOnly"];
    keywords = ["Application" "Launcher" "Calculator" "Emoji" "Command" "Pallette"];
  };
in
  stdenv.mkDerivation {
    pname = "jiffy";
    version = "1.4.2";

    src = fetchFromGitHub {
      owner = "5hubham5ingh";
      repo = "jiffy";
      rev = "1.4.2";
      sha256 = "1pjgm9xy5kyimpwmx4a4jil2a2l411if776xrbliwsx8gn609p27";
    };

    nativeBuildInputs = [quickjs makeBinaryWrapper];
    buildInputs = [qjs-ext-lib justjs fzf];

    buildPhase = ''
      runHook preBuild

      ln -s ${justjs} ../justjs
      ln -s ${qjs-ext-lib} ../qjs-ext-lib

      qjsc main.js -o jiffy

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      install -m755 jiffy $out/bin
      wrapProgram $out/bin/jiffy \
        --prefix PATH : ${lib.makeBinPath [fzf]} \

      mkdir -p $out/share/applications
      cp ${desktopEntry}/share/applications/jiffy.desktop $out/share/applications/jiffy.desktop

      runHook postInstall
    '';

    meta = {
      description = "𝐴𝑝𝑝 𝑙𝑎𝑢𝑛𝑐ℎ𝑒𝑟 | 𝐵𝑎𝑠𝑖𝑐 𝑐𝑎𝑙𝑐𝑢𝑙𝑎𝑡𝑜𝑟 | 𝐸𝑚𝑜𝑗𝑖 𝑝𝑖𝑐𝑘𝑒𝑟 | 𝐶𝑢𝑠𝑡𝑜𝑚 𝑐𝑜𝑚𝑚𝑎𝑛𝑑 𝑝𝑎𝑙𝑙𝑒𝑡𝑡𝑒";
      homepage = "https://github.com/5hubham5ingh/jiffy";
      license = lib.licenses.mit;
      # maintainers = with lib.maintainers; [
      #
      # ];
      mainProgram = "jiffy";
    };
  }
