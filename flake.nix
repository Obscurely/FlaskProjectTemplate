{
  description = "Python DevShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [
              poetry
              pkg-config
              python311
              tailwindcss
              python311Packages.flask
              nodejs_21 # because of daisyui, only need it for updating, not required for running the app
            ];

            shellHook = ''
              # setup dependencies
              poetry install
              poetry lock
              # check htmx version
              ./scripts/check_htmx_version.sh
              # run development environment
              poetry run ./scripts/run_dev.sh
              poetry run zsh
              # cleanup everything after running exit (quitting poetry shell)
              killall tailwindcss
              killall flask
              killall python
              exit
            '';

            FLASK_DEBUG = 1;
            FLASK_APP = "frontend/app";
          };
        }
    );
}
