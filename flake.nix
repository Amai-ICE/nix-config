{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal.url = "github:aylur/astal";
    ags.url = "github:aylur/ags";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        nixos = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/common/network-profiles.nix
            ./hosts/common/hardware-configuration.nix

            ./config/home/default.nix
            ./config/os/default.nix

            ./os/default.nix

            ./hosts/desktop.nix
            /*
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "hm-bak";
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.sharedModules = [
                  ./config/home/default.nix
                ];
                home-manager.users.amaiice = import ./home/default.nix;
              }
            */
          ];
        };
      };
      homeConfigurations = {
        # ホストのパッケージを再利用することでunfreeの設定が矯正される...ハズ?
        home-manager.useGlobalPkgs = true;

        amaiice = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./config/home/default.nix
            ./home/default.nix
            ./hosts/home-desktop.nix
          ];
        };
      };
    };
}
