# nix-config

## Nix OS on WSL

First, download nixos.wsl from the latest release.
https://github.com/nix-community/NixOS-WSL/releases/latest

Then, double-click on the downloaded file to install it.

In the Windows start menu, search for "NixOS" and start it.

Enable Flakes

```console
$ sudo nix-shell -p neovim
# nvim /etc/nixos/configuration.nix
```

Change default user to `takahisa`.

```nix
{
  ...
  wsl.defaultUser = "takahisa";
  users.users.takahisa = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
  environment.systemPackages = with pkgs; [
    fish
  ];
  programs.fish.enable = true;
  ...
}
```

Add the following line to the file.

```nix
{
  ...
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };
}
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
nix run github:nix-community/home-manager -- --flake .#takahisa switch
```

Options of packages managed by home-manager can be found in https://home-manager-options.extranix.com/
