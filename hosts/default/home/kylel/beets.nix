{config, ...}: {
  home.file.".config/beets/config.yaml".text = ''
    directory: ${config.home.homeDirectory}/Music/Library

    import:
        move: yes
        copy: no
        write: yes
        resume: ask
        incremental: yes
        autotag: yes
        quiet_fallback: skip
        timid: no
        log: ${config.home.homeDirectory}/.config/beets/beets.log

    plugins: lyrics embedart fetchart

    lyrics:
        auto: yes
        fallback: \'\'
        sources: genius

    embedart:
        auto: yes
        maxwidth: 1200
        ifempty: yes

    fetchart:
        auto: yes
        cautious: yes
        maxwidth: 1200
        enforce_ratio: yes
  '';
}
