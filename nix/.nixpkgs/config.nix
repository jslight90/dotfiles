{
  allowUnfree = true;

  # Install with
  #   nix-env -iA nixpkgs.all
  packageOverrides = pkgs_: with pkgs_; {  # pkgs_ is the original set of packages
    all = wit pkgs; buildEnv {  # pkgs is your overriden set of packages itself
      name = "all";
      paths = [
        firefox
        ledger
        thunderbird
        remmina
        vlc
        scrot
        gimp
        calibre
        libreoffice
        qbittorrent
        fbreader
        usbutils
        zsnes
        ruby
        python
        evince
      ];
    };
  };
}