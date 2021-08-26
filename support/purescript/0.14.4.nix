{ stdenv
, pkgs
, fetchurl
}:

pkgs.purescript.overrideAttrs (old: rec {
  version = "0.14.4";
  src = if stdenv.isDarwin
        then
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/macos.tar.gz";
          sha256 = "0m6zwb5f890d025zpn006qr8cky6zhjycap5az9zh6h47jfbrcf9";
        }
        else
        fetchurl {
          url = "https://github.com/purescript/purescript/releases/download/v${version}/linux64.tar.gz";
          sha256 = "0hgsh6l52z873b2zk3llvqik18ifika48lmr71qyhlqf250ng9m0";
        };
})
