{
  flake.nixosModules.default =
    { config
    , lib
    , outputs
    , system
    , ...
    }:
      with lib; let
        cfg = config.pde.nixos;

        # grab the base config
        pde = outputs.packages.${system}.default;
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

        config = mkIf cfg.enable {
          environment.systemPackages = [
            # test if you can extend
            pde.extend
            { colorscheme = "${cfg.colorscheme}"; }
          ];
        };
      };
}
