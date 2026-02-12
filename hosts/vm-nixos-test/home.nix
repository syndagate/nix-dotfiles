{ config, lib, pkgs, pkgs-stable, ... }:

{
  config = {

    userSettings = {
      # setup
      shell = {
        enable = true;
      };
      #xdg.enable = true;

      # wm
      #hyprland.enable = true;
      #hyprland.performanceOptimizations = true;
    };


    home.sessionVariables = lib.mkIf config.userSettings.hyprland.enable {
      AQ_DRM_DEVICES = lib.mkForce "/dev/dri/card0";
    };

    wayland.windowManager.hyprland = lib.mkIf config.userSettings.hyprland.enable {
      settings = {
        misc = {
          vfr = true;
        };

        animations = {
          enabled = lib.mkForce "no";
        };

        decoration = {
          shadow.enabled = lib.mkForce false;
          blur = {
            size = lib.mkForce 10;
            passes = lib.mkForce 1;
          };
        };

        #input = {
        #  repeat_delay = lib.mkForce 850;
        #  repeat_rate = lib.mkForce 80;
        #};

        monitor = [
          ",1920x1080@48,0x0,1"
        ];

      };
    };

  };
}
