self: super:
  {
    purerl-support = (super.purerl-support or {}) // {
      spago-0-12-1-0 = super.callPackage ./support/spago/0.12.1.0.nix {};
      spago-0-16-0 = super.callPackage ./support/spago/0.16.0.nix {};
      spago-0-20-3 = super.callPackage ./support/spago/0.20.3.nix {};

      dhall-json-1-5-0 = super.callPackage ./support/dhall/dhall-json-1-5-0.nix {};

      purty-7-0-0 = super.callPackage ./support/purty/7.0.0.nix {};

      psa-0-8-2 = super.callPackage ./support/psa/default.nix {};

      purescript-0-13-6 = super.callPackage ./support/purescript/0.13.6.nix {};
      purescript-0-13-8 = super.callPackage ./support/purescript/0.13.8.nix {};
      purescript-0-14-0 = super.callPackage ./support/purescript/0.14.0.nix {};
      purescript-0-14-1 = super.callPackage ./support/purescript/0.14.1.nix {};
      purescript-0-14-2 = super.callPackage ./support/purescript/0.14.2.nix {};
    };
}
