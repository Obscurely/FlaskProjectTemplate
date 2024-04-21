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
              ripgrep # just for the sake of highlighting
              python311
              tailwindcss
              python311Packages.flask
              nodejs_21 # because of daisyui, only need it for updating, not required for running the app
            ];

            shellHook = ''
              # setup dependencies
              poetry install -q
              echo "Poetry updates: $(poetry update --dry-run | rg updates)"
              poetry lock -q
              npm install --silent
              echo "Nodejs updates: $(npm update --dry-run | rg --color=never 'in \d+ms')"
              # check htmx version
              ./scripts/check_htmx_version.sh
              # check alpinejs version
              ./scripts/check_alpinejs_version.sh
              # run development environment
              poetry run ./scripts/run_dev.sh
              poetry run zsh
              # cleanup everything after running exit (quitting poetry shell)
              killall tailwindcss
              killall flask
              exit
            '';

            FLASK_DEBUG = 1;
            FLASK_APP = "frontend/app";
          };
        }
    );
}
