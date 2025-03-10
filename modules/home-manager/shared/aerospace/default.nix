{ homeManagerConfig, config, ... }:
{
  home.file.".config/aerospace".source = homeManagerConfig.linkSharedApp config "aerospace";
}
