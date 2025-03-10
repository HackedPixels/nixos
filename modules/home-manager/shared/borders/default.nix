{ homeManagerConfig, config, ... }:
{
  home.file.".config/borders".source = homeManagerConfig.linkSharedApp config "borders";
}
