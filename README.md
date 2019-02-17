# docker mod_perl

This is a Dockerfile for [Apache HTTP Server](https://httpd.apache.org/) + [mod_perl](https://perl.apache.org/).

# Usage

```console
$ docker pull skaji/mod_perl
$ docker run -d -p 3000:80 skaji/mod_perl
```

```console
$ curl -sv http://localhost:3000
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 3000 (#0)
> GET / HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.64.1-DEV
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Sun, 17 Feb 2019 10:09:05 GMT
< Server: Apache/2.4.38 (Unix) mod_perl/2.0.10 Perl/v5.28.1
< Transfer-Encoding: chunked
< Content-Type: text/html
<
Hello World!
* Connection #0 to host localhost left intact
```

# See also

* https://httpd.apache.org/
* https://perl.apache.org/
* https://metacpan.org/pod/Plack::Handler::Apache2
* https://cloud.docker.com/u/skaji/repository/docker/skaji/mod_perl

# License

MIT
