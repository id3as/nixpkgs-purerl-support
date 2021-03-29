# This file has been generated by node2nix 1.9.0. Do not edit!

{ nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? [ ] }:

let
  sources = {
    "purescript-psa-0.8.2" = {
      name = "purescript-psa";
      packageName = "purescript-psa";
      version = "0.8.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/purescript-psa/-/purescript-psa-0.8.2.tgz";
        sha512 = "4Olf0aQQrNCfcDLXQI3gJgINEQ+3U+4QPLmQ2LHX2L/YOXSwM7fOGIUs/wMm/FQnwERUyQmHKQTJKB4LIjE2fg==";
      };
    };
  };
  args = {
    name = "psa";
    packageName = "psa";
    version = "0.8.2";
    src = ./.;
    dependencies = [
      sources."purescript-psa-0.8.2"
    ];
    buildInputs = globalBuildInputs;
    meta = { };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
  nodeDependencies = nodeEnv.buildNodeDependencies (lib.overrideExisting args {
    src = stdenv.mkDerivation {
      name = args.name + "-package-json";
      src = nix-gitignore.gitignoreSourcePure [
        "*"
        "!package.json"
        "!package-lock.json"
      ]
        args.src;
      dontBuild = true;
      installPhase = "mkdir -p $out; cp -r ./* $out;";
    };
  });
}
