{
  config,
  vars,
  homeManagerConfig,
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    # extraPackages = with pkgs; [ nixd ];
    extensions = [ "catppuccin" "catppuccin-icons" "catppuccin-blur-plus" ];
    userSettings = {
      auto_update = false;
      ui_font_family = "ZedMono Nerd Font Propo";
      ui_font_size = 12;
      buffer_font_family = "ZedMono Nerd Font Mono";
      buffer_font_size = 12.0;
      terminal = {
        font_family = "ZedMono Nerd Font Mono";
        font_size = 12;
      };
      collaboration_panel = {
        button = false;
      };
      assistant = {
        version = 2;
        enabled = false;
        button = false;
      };
      features = {
        edit_prediction_provider = "none";
        copilot = false;
      };
      icon_theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Mocha";
      };
      theme = {
        mode = "system";
        light = "Solarized Light";
        dark = "Catppuccin Mocha (Blue Blur+)";
      };
      lsp = {
        yaml-language-server = {
          settings = {
            yaml = {
              schemas =  {
                "https://squidfunk.github.io/mkdocs-material/schema.json" =  "mkdocs.yml";
              };
            };
          };
        };
      };
      vim_mode = true;
    };
  };
}
