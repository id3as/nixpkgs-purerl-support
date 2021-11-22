let
  erlangReleases = builtins.fetchTarball https://github.com/nixerl/nixpkgs-nixerl/archive/v1.0.19-devel.tar.gz;

  nixpkgs =
    import <nixpkgs> {
      overlays = [
        (import erlangReleases)
        (import ./.)
      ];
    };

  # whichErlang = nixpkgs.nixerl.erlang-23-2-1;
in

with nixpkgs;

mkShell {
  buildInputs = with pkgs; [
    # whichErlang.erlang


    purerl-support.purty-7-0-0
    purerl-support.purescript-0-14-5
    purerl-support.spago-0-20-3
  ];
}

