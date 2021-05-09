[![Build status](https://img.shields.io/github/workflow/status/MaxMilton/dockerfiles/ci)](https://github.com/MaxMilton/dockerfiles/actions)
[![Licence](https://img.shields.io/github/license/MaxMilton/dockerfiles.svg)](https://github.com/MaxMilton/dockerfiles/blob/master/LICENSE)

# Max's Dockerfiles

🐋 Monorepo with all my personal docker images.

## Overview

<!-- prettier-ignore -->
| Image | Badges | Description |
| --- | --- | --- |
| alpine:3.13 | x | Alpine linux v3.13 base image. |
| alpine:edge | x | Alpine linux edge base image. |
| chromium | x | Ephemeral Chromium browser for ad-hoc use. |
| chromium-test | x | Ephemeral and completely fresh/default Chromium browser for testing. |
| firefox | x | Ephemeral Firefox browser for ad-hoc use. |
| gcloud | x | Google Cloud SDK CLI tool. |
| midori | x | Ephemeral Midori browser for ad-hoc use. |
| net-block | x | Transparent network proxy with ad-blocking capabilities. |
| net-cache | x | Extreme local caching for 💩 networks. |
| net-tools | x | Collection of network tools. |

## How to use

### Prebuilt images

Images are publicly available on [GitHub packages](https://github.com/MaxMilton?tab=packages).

### Build locally

> Tip: Use the `REGISTRY` env var to set the name prefix, e.g. `REGISTRY=local` would result in an image named `local/chromium`.

Make all images:

```sh
REGISTRY=local make all
```

Make a specific image:

```sh
REGISTRY=local make chromium
```

## Licence

MIT; see [LICENCE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENCE).

---

© 2021 [Max Milton](https://maxmilton.com)
