# Max's Dockerfiles

Monorepo with all my personal docker images.

## Overview

<!-- prettier-ignore -->
| Image | Badges | Description |
| --- | --- | --- |
| chromium | [![Build Status](https://travis-ci.org/MaxMilton/docker-chromium.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-chromium) [![Image version](https://images.microbadger.com/badges/version/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/chromium.svg)](https://microbadger.com/images/maxmilton/chromium) | Ephemeral Chromium for testing. |
| fontforge | [![Build Status](https://travis-ci.org/MaxMilton/docker-fontforge.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-fontforge) [![Image version](https://images.microbadger.com/badges/version/maxmilton/fontforge.svg)](https://microbadger.com/images/maxmilton/fontforge) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/fontforge.svg)](https://microbadger.com/images/maxmilton/fontforge) | Pro font tooling. |
| keypass | [![Build Status](https://travis-ci.com/MaxMilton/docker-keepass.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-keepass) [![Image version](https://images.microbadger.com/badges/version/maxmilton/keepass.svg)](https://microbadger.com/images/maxmilton/keepass) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/keepass.svg)](https://microbadger.com/images/maxmilton/keepass) | Secure password management. |
| net-cache | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-cache.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-cache) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-cache.svg)](https://microbadger.com/images/maxmilton/net-cache) | Extreme local caching for 💩 networks. |
| net-tools | [![Build Status](https://travis-ci.com/MaxMilton/docker-net-tools.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-tools) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) | Collection of network tools. |
| travis | [![Build Status](https://travis-ci.org/MaxMilton/docker-travis.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-travis) [![Image version](https://images.microbadger.com/badges/version/maxmilton/travis.svg)](https://microbadger.com/images/maxmilton/travis) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/travis.svg)](https://microbadger.com/images/maxmilton/travis) | Travis CI CLI tool. |

## How to use

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

Contents of this repository are MIT licensed open source. See [LICENCE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENCE).

---

© 2018 [Max Milton](https://maxmilton.com)
