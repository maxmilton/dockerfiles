[![Build status](https://img.shields.io/github/actions/workflow/status/MaxMilton/dockerfiles/ci.yml?branch=master)](https://github.com/MaxMilton/dockerfiles/actions)
[![Licence](https://img.shields.io/github/license/MaxMilton/dockerfiles.svg)](https://github.com/MaxMilton/dockerfiles/blob/master/LICENSE)

# Max's Dockerfiles

🐋 Monorepo with all my personal docker images.

## Overview

<!-- prettier-ignore -->
| Image | Badges | Description |
| --- | --- | --- |
| chromium | x | Ephemeral Chromium browser for ad-hoc use. |
| firefox | x | Ephemeral Firefox browser for ad-hoc use. |
| gcloud | x | Google Cloud SDK CLI tool. |
| net-block | x | Transparent network proxy with ad-blocking capabilities. |
| net-cache | x | Extreme local caching for 💩 networks. |
| net-tools | x | Collection of network tools. |

There are more images I only use for specific use cases in the `.extra` directory. These don't get built by default with the Makefile nor do they get tested in the CI workflow.

<!-- prettier-ignore -->
| Image | Badges | Description |
| --- | --- | --- |
| chromium-defaults | x | Ephemeral and completely fresh/default Chromium browser for testing. |
| chromium-old-47 | x | Chromium browser v47 for compatibility testing. |
| chromium-old-53 | x | Chromium browser v53 for compatibility testing. |
| chromium-old-72 | x | Chromium browser v72 for compatibility testing. |
| chromium-old-81 | x | Chromium browser v81 for compatibility testing. |
| midori | x | Ephemeral Midori browser for ad-hoc use. |

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

MIT license. See [LICENCE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENCE).

---

© 2022 [Max Milton](https://maxmilton.com)
