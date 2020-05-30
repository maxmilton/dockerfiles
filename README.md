# Max's Dockerfiles

🐋 Monorepo with all my personal docker images.

## Overview

- FIXME: Set up new CI process
- FIXME: Make all badges link to new CI process
- TODO: Add alpine images to below list + CI

<!-- prettier-ignore -->
| Image | Badges | Description |
| --- | --- | --- |
| alpine:3.11 | x | x |
| alpine:edge | x | x |
| chromium | [![Build Status](https://travis-ci.org/MaxMilton/docker-chromium.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-chromium) [![Image version](https://images.microbadger.com/badges/version/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) | Ephemeral Chromium for testing. |
| gcloud | x | x |
| net-block | x | x |
| net-cache | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-cache.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-cache) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) | Extreme local caching for 💩 networks. |
| net-tools | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-tools.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-tools) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) | Collection of network tools. |

## How to use

> Tip: Use the `REGISTRY` env var to set the name prefix, e.g. `REGISTRY=local` would result in an image named `local/chromium`.

TODO: Write better instructions.

Make all images:

```sh
REGISTRY=local make all
```

Make a specific image:

```sh
REGISTRY=local make chromium
```

## Notable changes

- Removed `fontforge` and `keypass` images. I recommend using the [FontForge](https://www.flathub.org/apps/details/org.fontforge.FontForge) and [KeePassXC](https://www.flathub.org/apps/details/org.keepassxc.KeePassXC) Flatpak packages instead.

## Licence

Released under the MIT licence; see [LICENCE](./LICENCE).

---

© 2020 [Max Milton](https://maxmilton.com)
