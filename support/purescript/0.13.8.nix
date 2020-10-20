{ stdenv
, pkgs
, fetchurl
}:

pkgs.purescript.overrideAttrs (old: rec {
  version = "0.13.8";
  src = if stdenv.isDarwin
        then
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/macos.tar.gz";
          sha256 = "058w8w24g7xbdkn5l97jfj9dcg81vkfh3w8112anj982lynk6391";
        }
        else
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
          sha256 = "01xb9sl6rmg02ypdrv4n0mkzmdr5y9rajcdmg9c3j46q7z6q9mxy";
        };
})
