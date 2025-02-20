{
  config,
  vars,
  homeManagerConfig,
  ...
}:
{
  programs.starship = {
    enable = true;
    settings = {
      format = ''$directory$character'';
      right_format = ''$cmd_duration'';

      add_newline = false;
      directory = {
        style = "blue";
      };

      cmd_duration = {
        format = "took [$duration](yellow) ";
      };

      character = {
        format = "$symbol ";

        success_symbol = "[❯](purple)";
        error_symbol = "[!](red)";
        vimcmd_symbol = "[❮](green)";
      };
    };
  };
}
