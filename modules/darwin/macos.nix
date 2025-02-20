{ vars, ... }:
{
  security.pam.enableSudoTouchIdAuth = true;
  system = {
    defaults = {
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
          "/Applications/Zed.app"

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
