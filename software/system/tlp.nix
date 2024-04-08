# Battery management
# See https://nixos.wiki/wiki/Laptop
{ config, pkgs, ... }:
{
  services.tlp = {
    settings = {
      START_CHARGE_THRESH_BAT0 = "75";
      STOP_CHARGE_THRESH_BAT0 = "80";
    };
  };
}
