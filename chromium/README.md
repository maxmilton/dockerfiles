# 🖥 Chromium

Launch an ephemeral chromium instance in a Docker container. Useful for times you need to quickly launch a browser that's completely fresh, e.g. web page testing or visiting suspect sites. By default, it's likely this will only run on a Linux or macOS desktop with X11 compatibility (e.g. Wayland + `xwayland`).

Based on the [chromium image by jessfraz](https://github.com/jessfraz/dockerfiles/blob/master/chromium/Dockerfile) + [her seccomp profile](https://github.com/jessfraz/dotfiles/blob/master/etc/docker/seccomp/chrome.json).

Uses an opinionated [default configuration](https://github.com/MaxMilton/docker-chromium/blob/master/default.conf) for additional performance and security. If you need a fully default chromium use [my chromium-defaults image](../chromium-defaults).

## Setup

### Install

Build locally (better if you want to customise the image but remember to rebuild periodically for updates) — [see monorepo README](https://github.com/MaxMilton/dockerfiles/blob/master/README.md).

Or use a prebuilt image (you'll need to edit the `launch.sh` script):

```sh
docker pull ghcr.io/maxmilton/chromium
```

### Run

_NOTE: The default page is `about:blank` for fast launch time._

```sh
./launch.sh
```

You can optionally pass arguments to Chromium:

```sh
./launch.sh http://localhost:8080 --allow-insecure-localhost
```

#### Arch Linux launch bug

If using Arch Linux the container will fail to launch, in which case you can use the alternative launch script (see comments in script):

```sh
./launch.arch.sh
```

#### SELinux volumes

If you're using a system with SELinux enabled (e.g. on Fedora Linux) you'll need to add `:z` to the end of each `--volume` so Docker labels the volume correctly. For example (in `./launch.sh`):

```sh
  --volume "$HOME"/Downloads:/home/chromium/Downloads:z \
  --volume "$HOME"/.config/chromium/:/data:z \
```

## Enabling persistence

> TL;DR — edit: `launch.sh`; uncomment code.

When run as is, the docker container is ephemeral so each time you launch an instance it's a completely fresh browser (useful for testing or as an incognito mode alternative). Browser data persistence is not enabled by default.

To make the container data persist edit the `launch.sh` file by commenting out the existing `docker run` and uncommenting the persistent docker run code. You can now sign in to create a profile etc.

The differences are:

1. Prevent removing container after exiting, so we don't need:

   ```sh
     --rm \
   ```

1. Mount host volumes to store the data:

   _NOTE: The `:z` sets the correct SELinux role and allows read/write access, remove it if you don't use SELinux._

   ```sh
     --volume "$HOME"/Downloads:/home/chromium/Downloads:z \
     --volume "$HOME"/.config/chromium/:/data:z \
   ```

## Additional considerations

1. Fonts are rendered with `unifont` by default which covers a wide range of characters but looks pixelated. To add your down fonts, e.g. Japanese, you'll need to include fonts from your system. Add a line similar to this in your launch script:

   ```sh
   --volume /usr/share/fonts/uddigikyokasho:/usr/share/fonts/uddigikyokasho \
   ```

1. Uses a custom set of chromium flags for improved security and performance, see [`default.conf`](https://github.com/MaxMilton/docker-chromium/blob/master/default.conf). You need to rebuild after making changes.

1. Container timezone is set to UTC.

1. `--volume /dev/shm:/dev/shm` is necessary because Docker currently only allocates 64 MB of memory to /dev/shm but chromium needs a lot more to run without crashing. On some systems it my not be required. [More info](https://github.com/c0b/chrome-in-docker/issues/1).

## License

MIT; see [LICENSE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENSE).

---

© 2022 [Max Milton](https://maxmilton.com)
