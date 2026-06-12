Repository overview (for Copilot sessions)

Build / test / lint commands

- Primary build: Use the included build script. Typical usage:
  - ./build.sh bin=<comma-separated-packages> arch=<arch> static=<true|false> api=<api-number>
    - Example (single package): ./build.sh bin=jq arch=arm64 static=true api=33
    - Example (multiple): ./build.sh bin=cpio,gzip,tar
  - Defaults:
    - arch default: all (use arch=arm|arm64|x86|x64 to target one)
    - static default: true (many packages can be built dynamic if requested)
    - api default: dynamic builds ≈ 21, static builds ≈ 33 (the script also sets lapi=34 fallback)
  - Output prefixes (when not provided):
    - build-static/<package>/<arch>/
    - build-dynamic/<package>/<arch>/

- Docker (recommended for reproducible environment):
  - Build and run helper: ./run-docker.sh
    - Builds image and prints run options.
    - Common pattern (interactive shell):
      docker run -it --rm -v $(pwd):/workspace -v ~/android-ndk:/ndk ndk-builder
    - Common pattern (one-shot build):
      docker run -it --rm -v $(pwd):/workspace -v ~/android-ndk:/ndk ndk-builder ./build.sh
  - DOCKER-USAGE.md contains step-by-step NDK download & run examples (rclone usage shown).
  - Ensure NDK is mounted at /ndk and export NDK_HOME=/ndk/android-ndk-rXX inside the container.

- Tests / Linters
  - This repository contains no test suite or linter configuration. There are no npm/pytest/Makefile test targets to run.

High-level architecture (big picture)

- Purpose: A bash-driven cross-compilation toolchain that builds many GNU utilities and libraries for Android using the Android NDK.
- Core pieces:
  - build.sh: central orchestrator. Downloads sources, applies patches, configures and builds per-package. The script contains per-package case blocks and many NDK/workaround patches tuned for specific packages.
  - Dockerfile + run-docker.sh: lightweight reproducible environment (Ubuntu base) that expects an Android NDK mounted at /ndk.
  - DOCKER-USAGE.md: operational instructions for getting the NDK into the build container (rclone + tar workflow).
- Workflow overview:
  1. Prepare NDK locally (mount to ~/android-ndk) or inside container at /ndk.
  2. Run build.sh with bin=... (script will download sources, apply patches from patches/, configure using NDK toolchain and install to build-static/ or build-dynamic/ prefixes).
  3. Use produced artifacts from the prefix directories or further package them for target devices.

Key repository conventions and patterns

- Per-package invocation: build.sh expects bin=<name> where <name> matches internal case labels (e.g., jq, curl, coreutils, etc.). Multiple names may be comma-separated.
- Arch values: pass arch=arm|arm64|x86|x64 (script supports per-case handling; default is all).
- Static vs dynamic: static=true/false selects static vs PIE/shared build flavors. Many packages require static=true to be portable; script will default outputs under build-static/ or build-dynamic/.
- Patches: The script will look for patches in patches/ and patches/ndk_static_patches/. If you add package-specific patches, place them under patches/<package>/ or the ndk-specific folder.
- Toolchain/NDK location: The build script hardcodes some toolchain paths for convenience in developer environments (e.g., paths under /home/codespace/lib/android-ndk-r29). For portability, set NDK_HOME and mount your NDK at /ndk in Docker or adjust variables earlier in the script.
- Idempotence: The script uses per-package prefix checks to skip already-built packages; use the bin= and prefix overrides to control rebuilds.

Files to inspect first when reasoning about changes

- build.sh — central logic: downloads, patches, configure flags, per-package special cases.
- DOCKER-USAGE.md and run-docker.sh — how the project expects the build environment to be prepared.
- Dockerfile — base image and core dependencies for containerized builds.

AI-specific notes for Copilot sessions

- Primary source of truth is build.sh. For any code-action, search and read build.sh before making edits.
- Look for per-package case blocks in build.sh when adding or modifying package-specific logic.
- If proposing automation (CI or GitHub Actions), prefer using the provided Dockerfile and run-docker.sh as the build environment.

References

- README.md, DOCKER-USAGE.md, build.sh, Dockerfile (consult these first).

(Generated from project files: README.md, DOCKER-USAGE.md, build.sh, Dockerfile)
