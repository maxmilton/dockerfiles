[![Build Status](https://travis-ci.com/MaxMilton/docker-net-tools.svg?branch=master)](https://travis-ci.com/MaxMilton/docker-net-tools) [![Image version](https://images.microbadger.com/badges/version/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/net-tools.svg)](https://microbadger.com/images/maxmilton/net-tools)

# 🥅 Net Tools

A collection of Linux network tools in a docker container. No mater what host system you're using, have a consistent CLI experience.

## Setup

### Install

Build locally (better if you want to customise the image but remember to rebuild periodically for updates) — [see main README](../README.md).

Or use a prebuilt image:

```sh
docker pull maxmilton/net-tools
```

### Shell aliases

> _TIP: Change `local/net-tools` to `maxmilton/net-tools` if you use the prebuilt image._

For [fish shell](https://fishshell.com) run these commands (idealy in a one-time init config):

```sh
abbr --add nt 'docker run -ti --rm --network=host --volume="$PWD":/data local/net-tools'
# abbr --add curl 'docker run -ti --rm --network=host --volume="$PWD":/data local/net-tools curl'
abbr --add drill 'docker run -ti --rm local/net-tools drill'
abbr --add htop 'docker run -ti --rm --pid=host --volume="$HOME"/.config/htop/htoprc:/root/.config/htop/htoprc local/net-tools htop'
abbr --add iperf 'docker run -ti --rm --network=host local/net-tools iperf'
abbr --add jq 'docker run -ti --rm --volume="$PWD":/data local/net-tools jq'
abbr --add mtr 'docker run -ti --rm local/net-tools mtr'
abbr --add nmap 'docker run -ti --rm --network=host --volume="$PWD":/data local/net-tools nmap'
abbr --add ncat 'docker run -ti --rm --network=host --volume="$PWD":/data local/net-tools ncat'
abbr --add nping 'docker run -ti --rm --network=host local/net-tools nping'
# abbr --add ssh 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data local/net-tools ssh'
# abbr --add sftp 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data local/net-tools sftp'
# abbr --add scp 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data local/net-tools scp'
abbr --add tcpdump 'docker run -ti --rm --network=host --volume="$PWD":/data local/net-tools tcpdump'
abbr --add whois 'docker run -ti --rm local/net-tools whois'
```

## Licence

Released under the MIT licence; see [LICENCE](../LICENCE).

---

© 2019 [Max Milton](https://maxmilton.com)
