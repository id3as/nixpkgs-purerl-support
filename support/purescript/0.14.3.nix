{ stdenv
, pkgs
, fetchurl
}:

pkgs.purescript.overrideAttrs (old: rec {
  version = "0.14.3";
  src = if stdenv.isDarwin
        then
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/macos.tar.gz";
          sha256 = "1ipksp6kx3h030xf1y3y30gazrdz893pklanwak27hbqfy3ckssj";
        }
        else
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
          sha256 = "158jyjpfgd84gbwpxqj41mvpy0fmb1d1iqq2h42sc7041v2f38p0";
        };
})
