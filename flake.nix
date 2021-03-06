{
  description = ''Nim module for parsing SRT (SubRip) subtitle files'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."srt-master".dir   = "master";
  inputs."srt-master".owner = "nim-nix-pkgs";
  inputs."srt-master".ref   = "master";
  inputs."srt-master".repo  = "srt";
  inputs."srt-master".type  = "github";
  inputs."srt-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."srt-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}