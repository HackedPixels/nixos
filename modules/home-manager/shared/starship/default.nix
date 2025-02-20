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
      add_newline = false;
      directory = {
        style = "blue";
      };

      character = {
        format = "$symbol ";
        success_symbol = "❯";
        error_symbol = "!";
        vimcmd_symbol = "❮";
      };
    };
  };
}
