{
  flake.nixosModules.default =
    { config
    , lib
    , pkgs
    , ...
    }:
      with lib; let
        cfg = config.pde.nixos;

        # grab the base config (nice flake-parts shorthand)
        pde = pkgs.default;
      in
      {
        options = {
          pde.nixos = {
            enable = mkEnableOption "Enables pde-nixvim system-wide";
          };
          pde.nixos.colorscheme = lib.mkOption {
            type = lib.types.str;
            default = "darkblue";
            description = lib.mdDoc "Set nvim system colorscheme";
          };
        };

        # test if you can extend
        pde-extended = pde.extend {
          colorscheme = "";
        };
        config = mkIf cfg.enable {
          environment.systemPackages = [ pde-extended ];
        };
      };
}