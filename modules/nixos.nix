{
  flake.nixosModules.default =
    { config
    , lib
    , pkgs
    , ...
    }:
      with lib; let
        cfg = config.pde.nixos;

        # grab the base config
        pde = (getSystem "${pkgs.system}").packages.default;
      in
      {
        options = {
          pde.nixos = {
            enable = mkEnableOption "Enables pde-nixvim system-wide";
            colorscheme = lib.mkOption {
              type = lib.types.str;
              default = "darkblue";
              description = lib.mdDoc "Set nvim system colorscheme";
            };
          };
        };

        config = mkIf cfg.enable {
          environment.systemPackages =
            let
              # test if you can extend
              pde-extended =
                pde.extend
                  {
                    colorscheme = "${cfg.colorscheme}";
                  };
            in
            [ pde-extended ];
        };
      };
}
