{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.zed-mono
  ];
}
