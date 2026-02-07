{ config, pkgs, ... }:

{
  home.username = "dw";
  home.homeDirectory = "/home/dw";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = "/home/dw/.config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "home-manager switch --flake .";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "/home/dw/.config/zsh/zsh_history";
    history.ignorePatterns = [ "rm *" "pkill *" "cp *" ];
  };

  # Starship
  programs.starship.enable = true;
  home.file.".config/starship.toml".source = ./starship/starship.toml;

  # Waybar
  programs.waybar.enable = true;
  home.file.".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
  home.file.".config/waybar/style.css".source = ./waybar/style.css;
  home.file.".config/waybar/mocha.css".source = ./waybar/mocha.css;
  
  # Wofi
  programs.wofi.enable = true;
  home.file.".config/wofi/style.css".source = ./wofi/style.css;

  # Kitty
  programs.kitty.enable = true;
  home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
  home.file.".config/kitty/current-theme.conf".source = ./kitty/current-theme.conf;
}
