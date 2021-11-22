{ stdenv
, pkgs
, fetchurl
}:

pkgs.purescript.overrideAttrs (old: rec {
  version = "0.14.5";
  src = if stdenv.isDarwin
        then
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/macos.tar.gz";
          sha256 = "1brvbpzr3cwls809fl0sjrm9cbh8v7maf5d7ic2mha0xapabgfpv";
        }
        else
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
          sha256 = "1mvxvn30iyrq0ck6g08f925gxnnhbfgl29b2gjjsmm3m9mpll7ws";
        };
})
