{ stdenv
, pkgs
, fetchurl
}:

pkgs.purescript.overrideAttrs (old: rec {
  version = "0.14.0";
  src = if stdenv.isDarwin
        then
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/macos.tar.gz";
          sha256 = "0dfnn5ar7zgvgvxcvw5f6vwpkgkwa017y07s7mvdv44zf4hzsj3s";
        }
        else
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
          sha256 = "1l3i7mxlzb2dkq6ff37rvnaarikxzxj0fg9i2kk26s8pz7vpqgjh";
        };
})
