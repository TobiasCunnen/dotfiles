{
    nixpkgs.config = {
        allowUnfree = true;
#experimental-features = nix-command flakes
    };

    packageOverrides = pkgs: with pkgs; rec {
        tcunnenProfile = writeText "tcunnen-profile" ''
            export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
            export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
            '';
        tcunnenPackages = pkgs.buildEnv {
            name = "tcunnen-packages";
            paths = [
                (runCommand "profile" {} ''
                 mkdir -p $out/etc/profile.d
                 cp ${tcunnenProfile} $out/etc/profile.d/tcunnen-profile.sh
                 '')
                    man
                    neovim
                    starship
                    go
                    lua
                    rustup
                    nodejs_20
                    luajitPackages.luarocks
                    unzip
                    fd
                    ripgrep

                    # Desktop 
                    # rofi-wayland
                    # eww-wayland
                    # wpaperd
                    # waybar
                    # bibata-cursors
                    # papirus-icon-theme
                    # pavucontrol
            ];
            pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ];
            extraOutputsToInstall = [ "man" "doc" ];
        };
    };
}
