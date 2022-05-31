{
  outputs = { self, nixpkgs }:
    let
      defaultZmk = { buildSystem }: nixpkgs.legacyPackages.${buildSystem}.fetchFromGitHub {
        owner = "zmkfirmware";
        repo = "zmk";
        rev = "41dc774848dace9b4bcfa59691c81a229dd416e1";
        sha256 = "/BIVgqOfavHVIIVGLfg7rOx6T8GPhEjOsokvq1uw6sw=";
      };

    in {
      lib = {
        inherit defaultZmk;
      };
    };
}
