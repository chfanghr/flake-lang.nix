{ inputs, ... }: {
  perSystem = { config, ... }:

    let
      rustFlake = config.lib.rustFlake
        {
          src = ./.;
          inherit (inputs) crane;
          crateName = "rust-flake-project";

          devShellHook = config.settings.shell.hook;

        };
    in
    {

      inherit (rustFlake) packages checks devShells;

    };
}
