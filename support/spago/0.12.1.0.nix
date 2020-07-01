{ stdenv
, pkgs
}:

let
  patchelf = libPath: if pkgs.stdenv.isDarwin
  then ""
  else ''
    chmod u+w $SPAGO
    patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" --set-rpath ${libPath} $SPAGO
    chmod u-w $SPAGO
  '';

in
stdenv.mkDerivation rec {
  name = "spago";
  version = "0.12.1.0";
  src = if pkgs.stdenv.isDarwin
  then pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/0.12.1.0/osx.tar.gz";
    sha256 = "19wsw8dfcidjyq84z060vrabjikbixvy1n0drssl1yx400pqq8a9";
  }
  else pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/0.12.1.0/linux.tar.gz";
    sha256 = "0zvnymdvf94w1m5yhibqdb3jv178ipq4vy13clrgz5ny5icv019k";
  };

  buildInputs = [ pkgs.gmp pkgs.zlib pkgs.ncurses5 pkgs.stdenv.cc.cc.lib ];

  libPath = pkgs.lib.makeLibraryPath buildInputs;

  dontStrip = true;

  unpackPhase = ''
    mkdir -p $out/bin
    tar xf $src -C $out/bin
    SPAGO=$out/bin/spago
    ${patchelf libPath}
    mkdir -p $out/etc/bash_completion.d/
    $SPAGO --bash-completion-script $SPAGO > $out/etc/bash_completion.d/spago-completion.bash
  '';

  dontInstall = true;
}
