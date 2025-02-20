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
    ];

    taps = [
      # aerospace
      "nikitabobko/tap"
      # sketchybar
      # "felixkratz/formulae"
    ];

    casks = [
      { name = "aerospace"; greedy = true; }
      { name = "wezterm"; greedy = true; }
      { name = "zed"; greedy = true; }
    ];
  };
}
