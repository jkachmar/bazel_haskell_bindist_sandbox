{ pkgs ? import <nixpkgs> {}
, unstable ? import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/6d035a9d10d930d92e6016abec531e43e48a469f.tar.gz") {}
}:

pkgs.mkShell {
  buildInputs = [
    unstable.bazel
    pkgs.python37
  ];
}
