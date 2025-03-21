{
  config,
  vars,
  homeManagerConfig,
  ...
}:

let
  systemSpecificRebuildCmd =
    if (vars.system == "aarch64-darwin") then "darwin-rebuild" else "sudo nixos-rebuild";
in
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    envExtra = ''
      ZDOTDIR="${config.home.homeDirectory}/.config/zsh"
      alias rnix="${systemSpecificRebuildCmd} switch --flake /etc/nixos --impure"
    '';
    syntaxHighlighting.enable = true;
  };

#  home.file.".config/zsh".source = homeManagerConfig.linkSharedApp config "zsh";
}
