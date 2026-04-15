# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/plasma.nix
    ];

  boot.initrd.luks.devices."luks-baea4c7c-6d01-429d-9ef3-18724a33dc5f".device = "/dev/disk/by-uuid/baea4c7c-6d01-429d-9ef3-18724a33dc5f";
  networking.hostName = "ryuganhana"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
