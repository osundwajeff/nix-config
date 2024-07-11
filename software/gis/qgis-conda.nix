{pkgs, ...}: {
  nixpkgs.overlays = [(import ../../packages)];
  environment.systemPackages = with pkgs; [
    # taken from packages folder
    qgis-conda
  ];
}
