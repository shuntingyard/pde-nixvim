# pde-nixvim

Neovim Personalized Development Environment using nixvim

## Conventions

- `personalized.nvim.hm` for nixvim's homeModules (for home-manager)
- `personalized.nvim.nixos` for nixvim's nixosModules
- `personalized.nvim.darwin` for nixvim's nixDarwinModules

## TODO List

- [x] test integration of this standalone nixvim config with your main flake.
- [ ] assert LSP `nixd` has optimal configuration.
- [ ] fix error encountered when opening `lualine.nix`.
    (`luaLoader.enable=false;` doesn't fix!)
- [ ] check/integrate plugins yet commented out.

## Notes on Code commented out

- as imported from old config: `# option`
- very recently commented: `#option`
