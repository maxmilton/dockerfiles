# CLAUDE.md

Guide Claude Code (claude.ai/code) for work in this repo.

Monorepo of personal Docker images. Each top-level dir (`chromium`, `firefox`, `gcloud`, `net-block`, `net-cache`, `net-tools`) = one image built from own `Dockerfile`. `.extra/` holds images excluded from default build and CI (old browser versions, `chromium-defaults`, `midori`).

## Commands

Set `REGISTRY` to control image name prefix (default `ghcr.io/maxmilton`; use `local` for local work).

- `REGISTRY=local make all` — build every image
- `REGISTRY=local make chromium` — build one image
- `make run chromium` / `make exec chromium` — build then run / open shell (test/debug)
- `make check chromium` — check outstanding apk/apt updates in built image
- `make checkrebuild all` (aka `make ci`) — build, rebuild with `--no-cache` if image has package updates
- `make publish` — `checkrebuild push all`
- `shellcheck -ax **/*.sh` — lint all shell scripts (CI runs this)

No test suite. CI validation = per-image smoke tests (e.g. `docker run --rm ci/chromium:latest --version`) in `.github/workflows/ci.yml`.

## Architecture

**Makefile generic, dockerfile-driven.** Discovers images by globbing `*/Dockerfile`, so new image = just create `<name>/Dockerfile`, no Makefile edits. Dir name becomes image name. Adapted from philpep/dockerfiles.

**Inter-image deps auto-generated.** `.depends.mk` built by grepping Dockerfiles for `FROM $REGISTRY/...` lines. If image base is another image in repo, write `FROM $REGISTRY/<other>` and pass `--build-arg REGISTRY=...` (Makefile does this); make builds bases first. All active images base directly on `alpine:<version>@sha256:...` (pinned by digest).

**`check_update.sh` = freshness gate.** Runs *inside* built image (detects apk/apt/yum), exits non-zero if packages upgradable. `checkrebuild` uses this to decide whether to rebuild `--no-cache`.

**Publishing** (`.github/workflows/publish.yml`) triggered by successful `ci` workflow run on `master`, then runs `make publish` against `ghcr.io/maxmilton`. `should_publish.sh` gates the per-image `docker push` (skipped unless apk packages changed, build-context files changed since the last successful publish, or there's no prior successful publish) — `publish.yml` passes `LAST_PUBLISHED_SHA` from `gh run list`. Each push also tags the image with the short git SHA alongside `latest`.

## Conventions

- Alpine base images pinned by both tag and `@sha256:` digest; bumps happen across all Dockerfiles together (see recent commits). Renovate (`.github/renovate.json`) manages dependency/action updates.
- Every image sets `org.opencontainers.image.source` and `.documentation` LABELs.
- `launch.sh` scripts (chromium/firefox) = intended host-side run wrappers — set up hardened `docker run` flags (`--read-only`, tmpfs mounts, X11 forwarding, seccomp). Also honor `REGISTRY`.
- All `.sh` files must pass `shellcheck -ax`; browser launchers = bash, `docker-entrypoint.sh` files = POSIX `sh`.