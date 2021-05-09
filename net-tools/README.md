# 🥅 Net Tools

Collection of Linux network tools in a docker container. A consistent CLI experience no mater what host system you're using 🎉

## Setup

### Install

Build locally (better if you want to customise the image but remember to rebuild periodically for updates) — [see monorepo README](https://github.com/MaxMilton/dockerfiles/blob/master/README.md).

Or use a prebuilt image:

```sh
docker pull ghcr.io/maxmilton/net-tools
```

### Shell aliases

> _TIP: Change `ghcr.io/maxmilton/net-tools` to `local/net-tools` if you use a locally built image._

For [fish shell](https://fishshell.com) run the `abbr` command for each alias you want:

```sh
abbr --add nt 'docker run -ti --rm --network=host --volume="$PWD":/data ghcr.io/maxmilton/net-tools'
abbr --add curl 'docker run -ti --rm --network=host --volume="$PWD":/data ghcr.io/maxmilton/net-tools curl'
abbr --add drill 'docker run -ti --rm ghcr.io/maxmilton/net-tools drill'
abbr --add htop 'docker run -ti --rm --pid=host --volume="$HOME"/.config/htop/htoprc:/root/.config/htop/htoprc ghcr.io/maxmilton/net-tools htop'
abbr --add iperf 'docker run -ti --rm --network=host ghcr.io/maxmilton/net-tools iperf'
abbr --add jq 'docker run -ti --rm --volume="$PWD":/data ghcr.io/maxmilton/net-tools jq'
abbr --add mtr 'docker run -ti --rm ghcr.io/maxmilton/net-tools mtr'
abbr --add nmap 'docker run -ti --rm --network=host --volume="$PWD":/data ghcr.io/maxmilton/net-tools nmap'
abbr --add ncat 'docker run -ti --rm --network=host --volume="$PWD":/data ghcr.io/maxmilton/net-tools ncat'
abbr --add nping 'docker run -ti --rm --network=host ghcr.io/maxmilton/net-tools nping'
abbr --add ssh 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data ghcr.io/maxmilton/net-tools ssh'
abbr --add sftp 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data ghcr.io/maxmilton/net-tools sftp'
abbr --add scp 'docker run -ti --rm --network=host --volume="$HOME"/.ssh:/root/.ssh:ro --volume="$PWD":/data ghcr.io/maxmilton/net-tools scp'
abbr --add tcpdump 'docker run -ti --rm --network=host --volume="$PWD":/data ghcr.io/maxmilton/net-tools tcpdump'
abbr --add whois 'docker run -ti --rm ghcr.io/maxmilton/net-tools whois'
```

## License

MIT; see [LICENSE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENSE).

---

© 2021 [Max Milton](https://maxmilton.com)
