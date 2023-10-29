{
  description = "Flake for installing packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      myPackages = with nixpkgs; [
        # Applications
        bitwarden
        discord
        firefox
        gammastep
        gimp
        godot_4
        google-chrome
        kitty
        gnome.nautilus
        neovim
        mullvad-vpn
        obsidian
        qbittorrent
        signal-desktop
        spotify
        steam
        vlc
        virtualbox

        # Tools
        git
        wget
        ripgrep
        fd
        fzf
        playerctl
        z-lua
        unzip

        # Desktop environment
        dunst
        libnotify
        wofi
        rofi-wayland
        eww-wayland
        wpaperd
        waybar
        bibata-cursors
        papirus-icon-theme
        pavucontrol

        # Development
        python3
        socat
        jq
        gcc
        nodejs_20
        rustup
      ];
    };
  };
}

