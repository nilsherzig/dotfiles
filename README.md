nixos branch of my configs
currently booth my laptop and desktop are using this config at the same time

## neovim setup 

Neovim currently runs inside a fedora distrobox / container - which i use for all my dev things. 
Nixos doesnt link auto installing lsp servers and things like that.

setup: 

```
distrobox create -i fedora:latest -n dev 
distrobox enter dev
./setup_fedora.sh
```
