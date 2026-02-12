{ pkgs, ... }:

{
  config = {
    systemSettings = {
      # users
      users = [ "dw" ];
      adminUsers = [ "dw" ];

      # hardware

      # software
      #shell.enable = true;

      # wm
      #      hyprland.enable = true;

      # dotfiles
      #dotfilesDir = "/etc/nixos";

      # security
      #security = {
      #};

    };

    users.users.dw.description = "dw";
  };

}
