[![Build status](https://img.shields.io/github/workflow/status/MaxMilton/dockerfiles/ci)](https://github.com/MaxMilton/dockerfiles/actions)
[![Licence](https://img.shields.io/github/license/MaxMilton/dockerfiles.svg)](https://github.com/MaxMilton/dockerfiles/blob/master/LICENSE)

# Max's Dockerfiles

🐋 Monorepo with all my personal docker images.

## Overview

- FIXME: Set up new CI process
- FIXME: Make all badges link to new CI process

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
<!-- | chromium | [![Build Status](https://travis-ci.org/MaxMilton/docker-chromium.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-chromium) [![Image version](https://images.microbadger.com/badges/version/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) | Ephemeral Chromium for ad-hoc testing. | -->
<!-- | net-cache | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-cache.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-cache) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) | Extreme local caching for 💩 networks. | -->
<!-- | net-tools | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-tools.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-tools) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) | Collection of network tools. | -->

## How to use

<!-- TODO: Write better instructions. -->

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

Released under the MIT licence; see [LICENCE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENCE).

---

© 2021 [Max Milton](https://maxmilton.com)
