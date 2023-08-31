{ mkDerivation, base, lib, process }:
mkDerivation {
  pname = "wait";
  version = "0.1.0.0";
  src = ../.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base process ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base process ];
  description = "A command to interrupt another command after a specified amount of time";
  license = lib.licenses.bsd3;
  mainProgram = "wait";
}
