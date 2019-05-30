# 🥅 Net Cache

Proxy for speeding up 💩 networks; network accelerator proxy using squid in a docker container.


## Setup

### Install

Build locally (better if you want to customise the image but remember to rebuild periodically for updates) — [see main README](../README.md).

Or use a prebuilt image (you'll need to edit the `launch.sh` script):

```sh
docker pull maxmilton/net-cache
```

### TLS

<https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy#SSL_interception_or_SSL_bumping>

1. Generate CA certificate:

   ```sh
   openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout mitm.pem  -out mitm.pem
   ```

1. Generate der certificate for browsers:

   ```sh
   openssl x509 -in mitm.pem -outform DER -out mitm.der

   chmod 400 mitm.pem mitm.der

   mkdir -p ~/.pki/nssdb
   ```

1. Install certificate for browsers:

   ```sh
   certutil -d sql:$HOME/.pki/nssdb -A -n 'localhost cert authority' -i mitm.der -t TCP,TCP,TCP
   ```

## Licence

Released under the MIT licence; see [LICENCE](../LICENCE).

---

© 2019 [Max Milton](https://maxmilton.com)
