# Give your project a name. :)
workspace(name = "bazel_bindist_sandbox")

# Load the repository rule to download an http archive.
load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive"
)

# Download rules_haskell and make it accessible as "@rules_haskell".
http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-0.12",
    urls = ["https://github.com/tweag/rules_haskell/archive/v0.12.tar.gz"],
    sha256 = "56a8e6337df8802f1e0e7d2b3d12d12d5d96c929c8daecccc5738a0f41d9c1e4",
)

load(
    "@rules_haskell//haskell:repositories.bzl",
    "rules_haskell_dependencies",
)

# Setup all Bazel dependencies required by rules_haskell.
rules_haskell_dependencies()

load(
    "@rules_haskell//haskell:toolchain.bzl",
    "rules_haskell_toolchains",
)

# Download a GHC binary distribution from haskell.org and register it as a toolchain.
rules_haskell_toolchains()

# Select a Stackage snapshot to source Haskell dependencies from
load("@rules_haskell//haskell:cabal.bzl", "stack_snapshot")
stack_snapshot(
    name = "snapshot",
    packages = [
        # Core libraries
        "base",
        "text",
        # Snapshot libraries
        "rio",
    ],
    local_snapshot = "//:snapshot.yaml",
)
