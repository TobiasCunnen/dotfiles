# Dotfiles
This repo and readme describes how I configure and manage my packages on a linux sytem.

## Configuration

For this to work `Ansible` has to be installed.
Create a file or folder for every config and add it to the `ansible-playbook`. Then run the following command to create all the symlinks to the correct locations.

```
ansible-playbook create_symlinks.yaml
```

## Packages

Packeges are installed with the `nix` package manager. `Flakes` are used to install the packages in a declarative manner.

`Flakes` have to be enabled before the can be used. By running the playbook mentiond in the previous section the `nix.conf` file is created which should enable `flakes`.

Then you can run the following commands.

```
```
