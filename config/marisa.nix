{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marisa = {
    isNormalUser = true;
    description = "Marisa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      git
      mc
      ncdu
      wget
      deja-dup
      inkscape
      drawio
      libreoffice-fresh
      flameshot
      # For multilingual spell check in logseq, edit 
      # vim ~/.config/Logseq/Preferences
      # and add e.g.
      # {"spellcheck":{"dictionaries":["en-GB","pt"],"dictionary":""}}
      # TODO is to automate this with home manager....
      logseq
      vscode
      gimp
      gnome3.gnome-tweaks 
      # After unstalling do
      # systemctl --user enable syncthing
      # See also https://discourse.nixos.org/t/syncthing-systemd-user-service/11199
      syncthing
      synfigstudio
      kdenlive
      obs-studio
      google-chrome
      tdesktop
      paperwork
      gnome.gnome-software
      gotop
      nethogs
      iftop
      blender
      gnome.gnome-terminal
      starship
      btop
      gnucash
      maple-mono-NF
      #maple-mono-SC-NF
      nerdfonts
      #citations
      #emblem
      #eyedropper
      #gaphor
      #lorem
      #solanum
      #zap
      aspell
      aspellDicts.en
      aspellDicts.uk 
      aspellDicts.pt_PT
    ];
  };
}
