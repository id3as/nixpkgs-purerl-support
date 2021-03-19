self: super:
  {
    purerl-support = (super.purerl-support or {}) // {
      spago-0-12-1-0 = super.callPackage ./support/spago/0.12.1.0.nix {};
      spago-0-16-0 = super.callPackage ./support/spago/0.16.0.nix {};

      dhall-json-1-5-0 = super.callPackage ./support/dhall/dhall-json-1-5-0.nix {};

      purescript-0-13-6 = super.callPackage ./support/purescript/0.13.6.nix {};
      purescript-0-13-8 = super.callPackage ./support/purescript/0.13.8.nix {};
      purescript-0-14-0 = super.callPackage ./support/purescript/0.14.0.nix {};

      # Hideously broken, can't even be botherd updating it
      erlang_ls-0-5-1 =   super.beam.packages.erlang.callPackage ./support/erlang_ls/0.5.1.nix {};
    };
}
