{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sketchybar-app-font

    jq
    fd
    ripgrep
  ];
}
