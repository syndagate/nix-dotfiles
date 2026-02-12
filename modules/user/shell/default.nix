{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.shell;
in

{
  options = {
    userSettings.shell = {
      enable = lib.mkEnableOption "Enable zsh shell with some necessary CLI utilities";
    };
  };
  
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnugrep gnused bat eza
      bottom fd bc direnv 
      mix-direnv devenv
    ];

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

    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = config.programs.zsh.shellAliases;
    };

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    programs.direnv.enable = true;
    programs.direnv.enableZshIntegration = true;
    programs.direnv.nix-direnv.enable = true;
    programs.direnv.nix-direnv.package = pkgs.nix-direnv;
  };
}
