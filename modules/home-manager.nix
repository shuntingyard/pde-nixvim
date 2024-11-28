{
  flake.homeManagerModules.default =
    { config
    , lib
    , pkgs
    , ...
    }:
      with lib; let
        cfg = config.pde.hm;

        # grab the base config
        pde = config.packages.${pkgs.system}.default;
      in
      {
        options = {
          pde.hm = {
            enable = mkEnableOption "Enables pde-nixvim for home";
            colorscheme = lib.mkOption {
              type = lib.types.str;
              default = "darkblue";
              description = lib.mdDoc "Set nvim home colorscheme";
            };
          };
        };

        config = mkIf cfg.enable {
          home.packages =
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
