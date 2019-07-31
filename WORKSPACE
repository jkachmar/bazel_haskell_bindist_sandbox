workspace(name = "bazel_haskell_bindist_sandbox")

# Load the repository rule to download an http archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Download a version of `rules_haskell` that fixes 
# the macOS bindist rules
rules_haskell_version = "ea922cda905607fe42aa9abab9a664653300692a"
rules_haskell_sha256 = "a658e90e6f834ba10c3d7a5a7918557db5270ff83dcd0a2c928a2ae548f1e09e"

http_archive(
    name = "rules_haskell",
    strip_prefix = "rules_haskell-%s" % rules_haskell_version,
    urls = ["https://github.com/tweag/rules_haskell/archive/%s.tar.gz" % rules_haskell_version],
    sha256 = "%s" % rules_haskell_sha256,
)

# Set up all Bazel dependencies required by 
# `rules_haskell`
load("@rules_haskell//haskell:repositories.bzl", "rules_haskell_dependencies")
rules_haskell_dependencies()

# Download a GHC binary distribution from haskell.org
# and register it as a toolchain
load("@rules_haskell//haskell:repositories.bzl", "rules_haskell_toolchains")
rules_haskell_toolchains()

# Select a Stackage snapshot to source Haskell
# dependencies from
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
