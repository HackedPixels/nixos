{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
    };

    brews = [
      #"sketchybar"
      "lua"
      "ifstat"
      "borders"
      "sketchybar"
    ];

    taps = [
      # aerospace
      "nikitabobko/tap"
      # sketchybar
      "felixkratz/formulae"
    ];

    casks = [
      { name = "alfred"; greedy = true; }
      { name = "nextcloud"; greedy = true; }
      { name = "aerospace"; greedy = true; }
      { name = "lunar"; greedy = true; }
      { name = "wezterm"; greedy = true; }
      { name = "istat-menus"; greedy = true; }
      { name = "sublime-merge"; greedy = true; }
      { name = "obsidian"; greedy = true; }
      { name = "beekeeper-studio"; greedy = true; }
      # { name = "zed"; greedy = true; } # moved to home-manager
      { name = "zen-browser"; greedy = true; }
      { name = "1password"; greedy = true; }
    ];
  };
}
