{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jessie";
  home.homeDirectory = "/home/jessie";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs = {
    bash.enable = true;
    htop.enable = true;
    git = {
      enable = true;
      settings.user = {
        name = "Jessie Slight";
        email = "jslight90@gmail.com";
      };
    };
    keepassxc.enable = true;
    emacs.enable = true;

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = let
    dotfiles = "${config.home.homeDirectory}/.config/home-manager";
    symlink = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
  in {
    ".emacs.d/init.el".source = symlink "emacs/.emacs.d/init.el";
    ".emacs.d/custom-file.el".source = symlink "emacs/.emacs.d/custom-file.el";
    ".config/keepassxc/keepassxc.ini".source = symlink "keepassxc/keepassxc.ini";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/jessie/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "emacs";
  };

}
