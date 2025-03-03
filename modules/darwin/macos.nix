{ vars, config, lib, pkgs, ... }:
{
  security.pam.enableSudoTouchIdAuth = true;

  # link applications so they show up in Launmch
  system.activationScripts.postUserActivation.text = ''
      apps_source="${config.system.build.applications}/Applications"
      moniker="Nix Trampolines"
      app_target_base="$HOME/Applications"
      app_target="$app_target_base/$moniker"
      mkdir -p "$app_target"
      ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$apps_source/" "$app_target"

      # Following line should allow us to avoid a logout/login cycle when changing settings
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.Spotlight" = {
          # hide the spotlight item in the menubar (0 = show, 1 = dont-show)
          "MenuItemHidden" = 1;
        };
        "com.apple.symbolichotkeys" = {
            AppleSymbolicHotKeys = {
              # Disable 'Cmd + Space' for Spotlight Search
              "64" = {
                enabled = false;
              };
              # Disable 'Cmd + Alt + Space' for Finder search window
              "65" = {
                enabled = false;
              };
            };
          };
      };

      dock = {
        autohide = true;
        # customize Hot Corners
        # wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 13; # top-right - Lock Screen
        #wvous-bl-corner = 3; # bottom-left - Application Windows
        #wvous-br-corner = 4; # bottom-right - Desktop
        # apps that are listed in the dock
        persistent-apps = [
          "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
          "/Applications/Wezterm.app"
          "/Users/${vars.defaultUser}/Applications/Home Manager Apps/Zed.app"

#          "/System/Applications/Utilities/Terminal.app"
        ];
        # don't show recent Applications in the Docs
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
    };

    keyboard = {
      # enableKeyMapping = true;
      # remapCapsLockToControl = true;
    };
  };
}
