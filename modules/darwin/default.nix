{
  brew = import ./brew.nix;
  pkgs = import ./pkgs.nix;
  fonts = import ./fonts.nix;
  macos = import ./macos.nix;
}
