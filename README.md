[![CI status](https://badgen.net/github/checks/maxmilton/dockerfiles?label=ci)](https://github.com/maxmilton/dockerfiles/actions)
[![Licence](https://badgen.net/github/license/maxmilton/dockerfiles)](./LICENSE)

# Max's Dockerfiles

🐋 Monorepo with all my personal docker images.

## Overview

<!-- prettier-ignore -->
| Image | Description |
| --- | --- |
| chromium | Ephemeral Chromium browser for ad-hoc use. |
| firefox | Ephemeral Firefox browser for ad-hoc use. |
| gcloud | Google Cloud SDK CLI tool. |
| net-block | Transparent network proxy with ad-blocking capabilities. |
| net-cache | Extreme local caching for 💩 networks. |
| net-tools | Collection of network tools. |

There are more images I only use for specific use cases in the `.extra` directory. These don't get built by default with the Makefile nor do they get tested in the CI workflow.

<!-- prettier-ignore -->
| Image | Description |
| --- | --- |
| chromium-defaults | Ephemeral and completely fresh/default Chromium browser for testing. |
| chromium-old-47 | Chromium browser v47 for compatibility testing. |
| chromium-old-53 | Chromium browser v53 for compatibility testing. |
| chromium-old-72 | Chromium browser v72 for compatibility testing. |
| chromium-old-81 | Chromium browser v81 for compatibility testing. |
| midori | Ephemeral Midori browser for ad-hoc use. |

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

## License

MIT license. See [LICENCE](./LICENCE).

---

© [Max Milton](https://maxmilton.com)
