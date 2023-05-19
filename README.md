currently booth my laptop and desktop are using this config at the same time

## dev setup 

Neovim currently runs inside a fedora distrobox / container - which i use for all my dev things. 

setup: 

```bash
distrobox create -i fedora:latest -n devbox
distrobox enter devbox
./nvim/setup_fedora.sh
```

## todo
- [ ] automate `ln -s` config files - im to lazy for homemanager switch etc
- [ ] switch to distrobox assemble for dev container - assm command currently unaviable on nix (?)
