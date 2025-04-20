# nix-config

## Nix OS on WSL

First, download nixos.wsl from the latest release.
https://github.com/nix-community/NixOS-WSL/releases/latest

Then, double-click on the downloaded file to install it.

In the Windows start menu, search for "NixOS" and start it.

Enable Flakes


```console
$ sudo nix-shell -p wget
# wget -O /etc/nixos/configuration.nix https://raw.githubusercontent.com/amano-takahisa/nix-config/refs/heads/main/configuration.nix
```

Then, run the following command to apply the changes.

```bash
sudo nixos-rebuild switch
```

Clone this repository from github.

```bash
nix-shell -p git gh
gh auth login --hostname github.com --git-protocol ssh
```

Then, run the following command to create a new repository.

```bash
git clone git@github.com:amano-takahisa/nix-config.git ~/nix-config
# template has been generated with following.
# nix flake init --template github:nix-community/home-manager
# git config --global user.name "Takahisa Amano"
# git config --global user.email "amano.takahisa@gmail.com"

# exit from nix shell
exit
```

Apply configs with following command

```bash
# Environment in wsl
nix run github:nix-community/home-manager -- --flake .#wsl switch

# Environment for NixOS for a Let's note
nix run github:nix-community/home-manager -- --flake .#letsnote switch
```

Once you have run the above command, you can use the following command to apply the changes.

```bash
home-manager --flake .#wsl switch
home-manager --flake .#flake switch
```

Options of packages managed by home-manager can be found in https://home-manager-options.extranix.com/

## Japanese Input with MOZC

System Settings -> Keyboard -> Virtual Keyboard -> Fcitx 5 Wayland Launcher
System Settings -> Input Method -> Add mozc, Set as follows:

- Initial Mode: Direct
- Mozc settings -> General -> Keymap Style: Load `misc/mozc_keymap.txt` in this repository.


## Network connection

If old laptop does not support 5 GHz wifi and can't connect wifi, try to
disable 5 GHz band from Network Connection Editor.

```console
nm-connection-editor
```
