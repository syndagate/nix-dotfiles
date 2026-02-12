{ pkgs, ... }:

{
  config = {
    home.stateVersion = "25.11";
    #home.packages = with pkgs; [
    #  nil nixd
    #  nixdoc
    #];
  };
}
