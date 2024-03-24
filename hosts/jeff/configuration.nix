# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ 
      # this needs to be first
      ../../config/console-apps.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../config/bootsplash.nix
      #../../config/android-sdk.nix
      #../../config/upgrades.nix
      #../../config/arduino.nix
      #../../config/biometrics.nix
      ../../config/ccache.nix
      #../../config/cron-crest.nix
      ../../config/dir-env.nix
      #../../config/distrobox.nix
      ../../config/docker.nix
      ../../config/fwupd.nix
      ../../config/fonts.nix
      ../../config/games.nix
      ../../config/display-server.nix
      ../../config/gnome-desktop-wayland.nix
      #../../config/gnome-desktop-x11.nix
      ../../config/gnome-desktop-apps.nix
      #../../config/deepin-desktop.nix
      #../../config/budgie-deskop.nix
      #../../config/plasma-desktop.nix
      #../../config/xfce-desktop.nix
      #../../config/pantheon-desktop.nix
      ../../config/gui-apps.nix
      #../../config/iphone.nix
      #../../config/locale-pt-en.nix
      ../../config/locale-ke-en.nix
      ../../config/nodejs.nix
      # Dont enable when using wayland - causes screen flickr
      #../../config/nvidia.nix
      #../../config/ntfs.nix
      ../../config/obs.nix
      ../../config/postgres.nix
      ../../config/printing.nix
      ../../config/python.nix
      ../../config/quickemu.nix
      #../../config/pycharm-community.nix
      ../../config/qtcreator.nix
      ../../config/qgis.nix # Upstream packaged version
      #../../config/qgis-dev.nix # My own overlay maintained in packages/qgis
      #../../config/rstudio.nix
      ../../config/ssh.nix
      ../../config/starship.nix
      ../../config/syncthing.nix
      #../../config/tailscale.nix
      #../../config/uxplay.nix
      ../../config/vim.nix
      #../../config/yubikey.nix #using biometrics rather
      ../../config/vscode.nix
      #../../config/wacom.nix
      ../../config/unstable-apps.nix
      ../../users/all.nix
      ../../users/jeff.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  
  # Setup keyfile
  #boot.initrd.secrets = {};

  # Enable swap on luks
  #boot.initrd.luks.devices."luks-cda39835-d2a7-42f1-9729-8a84a4a8ae60".device = "/dev/disk/by-uuid/cda39835-d2a7-42f1-9729-8a84a4a8ae60";
  #boot.initrd.luks.devices."luks-cda39835-d2a7-42f1-9729-8a84a4a8ae60".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "jeff"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  ### Flakes support
      
  ### See https://nixos.wiki/wiki/Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ###
  ### Flatpack support
  ### see https://flatpak.org/setup/NixOS
  services.flatpak.enable = true;

  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };

  security.pki.certificateFiles = [ "/etc/ssl/certs/kartoza_ca_chain.crt" ];

  # All of the following should be run as root
  # sudo su -
  #
  # To start the VPN do:
  # systemctl start openvpn-vpn.service
  #
  # To enter your password
  # systemd-tty-ask-password-agent
  #
  # To stop the vpn
  # systemctl start openvpn-vpn.service

  services.openvpn.servers.vpn = {
    config = "config /home/jeff/.openvpn/command/jeff_orange.ovpn";
    autoStart = false;
    authUserPass.password = "";
    authUserPass.username = "map_jeff";
    updateResolvConf = false;
  };

}
