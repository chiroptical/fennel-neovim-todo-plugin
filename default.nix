let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
  pkgs.stdenv.mkDerivation {
    name = "Lua dependencies";
    phases = ["installPhase" "fixupPhase"];
    installPhase = ''
      mkdir -p $out/deps/{lua-ljsqlite3,lua-xsys}
      cp -r ${sources.lua-ljsqlite3}/* $out/deps/lua-ljsqlite3
      cp -r ${sources.lua-xsys}/* $out/deps/lua-xsys
    '';
  }
