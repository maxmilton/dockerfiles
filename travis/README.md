<!-- markdownlint-disable first-line-h1 -->

[![Build Status](https://travis-ci.org/MaxMilton/docker-travis.svg?branch=master)](https://travis-ci.org/MaxMilton/docker-travis) [![Image version](https://images.microbadger.com/badges/version/maxmilton/travis.svg)](https://microbadger.com/images/maxmilton/travis) [![Image layers](https://images.microbadger.com/badges/image/maxmilton/travis.svg)](https://microbadger.com/images/maxmilton/travis)

# Travis CLI via Docker

Run `travis` CLI commands without having to install Ruby and all its dependencies.

Originally based on the work [here](https://github.com/skandyla/docker-travis-cli).

## Usage

### 1. Get image

Download from Docker Hub:

```bash
docker pull maxmilton/travis
```

Or build locally:

```bash
docker build -t travis-cli .
```

### 2. Run `travis` commands

For example

```bash
docker run --rm -v $(pwd):/project --rm maxmilton/travis lint .travis.yml
```

See [travis-ci readme](https://github.com/travis-ci/travis.rb#readme) for more usage information.

### Bonus tip

For convenience, I highly recommend creating a shell alias to allow you to use travis commands more naturally. In your `.bashrc`, `.zshrc`, etc. add:

```bash
alias travis='docker run -ti --rm -v $(pwd):/project maxmilton/travis'
```

You can now use travis CLI by just using the keyword `travis`, e.g.:

```bash
travis lint .travis.yml
```

## Licence

Released under the MIT licence; see [LICENCE](https://github.com/MaxMilton/docker-travis/blob/master/LICENCE).

-----

© 2017 [We Are Genki](https://wearegenki.com)
