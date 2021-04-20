let
  erlangReleases = builtins.fetchTarball https://github.com/nixerl/nixpkgs-nixerl/archive/v1.0.7-devel.tar.gz;

  nixpkgs =
    import <nixpkgs> {
      overlays = [
        (import erlangReleases)
        (import ./.)
      ];
    };

  whichErlang = nixpkgs.nixerl.erlang-22-3;
in

with nixpkgs;

mkShell {
  buildInputs = with pkgs; [
    whichErlang.erlang
    whichErlang.rebar3

    purerl-support.purescript-0-14-1
  ];

  # Just give id3as_media the path to erlang
  _KERL_ACTIVE_DIR="${whichErlang.erlang}/lib/erlang";
}

