{ stdenv, fetchurl,
  buildNodePackage,
  sources,
  globalBuildInputs,
  tree }:

let
  version = "0.13.3";

in
  buildNodePackage rec {
    inherit version;

  name = "purescript-language-server";
  packageName = "purescript-language-server";
  src = fetchurl {
    url = "https://registry.npmjs.org/purescript-language-server/-/purescript-language-server-0.13.3.tgz";
    sha512 = "444da298f2378deda9e0e20d3891976c43ae57a5796eb0f3b19250f457a5c101";
  };
  dependencies = [
    sources."isexe-2.0.0"
    sources."vscode-jsonrpc-5.0.1"
    sources."vscode-languageserver-6.1.1"
    sources."vscode-languageserver-protocol-3.15.3"
    sources."vscode-languageserver-textdocument-1.0.1"
    sources."vscode-languageserver-types-3.15.1"
    sources."vscode-uri-2.1.2"
    sources."which-2.0.2"
  ];
  buildInputs = globalBuildInputs;
  meta = {
    description = "Language Server Protocol server for PureScript wrapping purs ide server functionality";
    homepage = https://github.com/nwolverson/purescript-language-server;
    license = "MIT";
  };
  production = true;
  bypassCache = true;
  reconstructLock = true;
}
