FROM httpd

ARG perl_prefix=/usr/local
ARG perl_version=5.28.1

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends gcc make tar curl ca-certificates; \
  rm -rf /var/lib/apt/lists/*; \
  cd /tmp; \
  curl -fsSL -O https://www.cpan.org/src/5.0/perl-$perl_version.tar.gz; \
  tar xf perl-$perl_version.tar.gz; \
  cd perl-$perl_version; \
  ./Configure -des -Dprefix=$perl_prefix -Dman1dir=none -Dman3dir=none -DDEBUGGING=-g -Duseshrplib -Duseithreads; \
  make -j8 install; \
  cd ..; \
  rm -rf perl-$perl_version* $perl_prefix/bin/perl$perl_version; \
  curl --compressed -fsSL https://git.io/cpm | \
    $perl_prefix/bin/perl - install -g Plack mod_perl2; \
  rm -rf ~/.perl-cpm;

ADD app.psgi /usr/local/apache2/perl/
ADD httpd-mod_perl.conf /usr/local/apache2/conf/extra/

RUN echo 'Include conf/extra/httpd-mod_perl.conf' >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
CMD ["httpd-foreground"]
