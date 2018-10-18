# net-cache

Proxy for speeding up 💩 networks.

Network accelerator proxy using squid in a docker container.

## TLS

<https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy#SSL_interception_or_SSL_bumping>

```sh
# generate CA certificate
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout mitm.pem  -out mitm.pem

# generate der certificate for browsers
openssl x509 -in mitm.pem -outform DER -out mitm.der

chmod 400 mitm.pem mitm.der

mkdir -p ~/.pki/nssdb

# install certificate for browsers
certutil -d sql:$HOME/.pki/nssdb -A -n 'localhost cert authority' -i mitm.der -t TCP,TCP,TCP
```

## Licence

`dockerfiles` are all MIT licensed open source. See [LICENCE](https://github.com/MaxMilton/dockerfiles/blob/master/LICENCE).

-----

© 2018 [Max Milton](https://maxmilton.com)
