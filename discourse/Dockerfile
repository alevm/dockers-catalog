FROM envygeeks/ubuntu:lts
MAINTAINER Jordon Bedwell <jordon@envygeeks.io>
ENV \
  RAILS_ENV=production \
  UNICORN_SIDEKIQS=1 \
  DISCOURSE_DB_PORT=5432 \
  DISCOURSE_DB_USER="discourse" \
  DISCOURSE_DB_HOST="postgresql" \
  DISCOURSE_DB_NAME="discourse" \
  DISCOURSE_REDIS_HOST="redis" \
  DISCOURSE_REDIS_PORT=6379 \
  UNICORN_ENABLE_OOBGC=0 \
  UNICORN_WORKERS=2
RUN \
  ruby_sha=df795f2f99860745a416092a4004b016ccf77e8b82dec956b120f18bdc71edce && \
  ruby_version=2.2.3 && \
  ruby_minor=2.2 && \

  apt-get update && \
  apt-get install --no-install-recommends -y git libxslt1.1 libxml2 libreadline6 libyaml-0-2 \
      imagemagick ghostscript libreadline6-dev libssl-dev build-essential libpq-dev libxml2-dev \
        libxslt1-dev libffi-dev libyaml-dev wget && \

  mkdir -p /usr/src && cd /usr/src && \
  wget -nv https://cache.ruby-lang.org/pub/ruby/$ruby_minor/ruby-$ruby_version.tar.gz && \
  tar xzf ruby-$ruby_version.tar.gz && cd ruby-$ruby_version && \
  ./configure --disable-install-doc --enable-shared --prefix=/usr && \
  make install && \

  gem install bundler --no-document && \
  yes | gem update --no-document -- --use-system-libraries && \
  yes | REALLY_GEM_UPDATE_SYSTEM=true gem update --system \
    --no-document -- --use-system-libraries && \
    yes | gem clean && \

  discourse_version=$(git ls-remote --tags https://github.com/discourse/discourse.git | \
    grep -v beta | grep -v latest-release | awk '{ print $2 }' | \
      awk -F/ '{ print $3 }' | grep -vE '\^\{\}$' | tail -n1) && \

  groupadd -rg 620 discourse && \
  useradd  -u  620 -g 620 \
    -rMd /home/discourse discourse && \

  docker-helper create_dir discourse:discourse /opt/discourse && \
  docker-helper create_dir discourse:discourse /home/discourse && \

  cd /opt/discourse && \
  echo   ------------------------------------------------ && \
  printf "Version Downloading: %s\n" "$discourse_version" && \
  echo   ------------------------------------------------ && \
  git clone --single-branch --depth 1 --branch $discourse_version \
    https://github.com/discourse/discourse.git . && \

  cd /opt/discourse && \
  export BUNDLE_ARGS="-j 128 --without=development:test" && \
  docker-helper install_users_gems && \

  echo libxml2     hold | dpkg --set-selections && \
  echo libpq5      hold | dpkg --set-selections && \
  echo libssl1.0.0 hold | dpkg --set-selections && \
  echo imagemagick hold | dpkg --set-selections && \
  echo ghostscript hold | dpkg --set-selections && \
  echo libxslt1.1  hold | dpkg --set-selections && \
  echo git         hold | dpkg --set-selections && \

  apt-get autoremove --purge -y libxml2-dev libxslt1-dev libreadline6-dev \
    libssl-dev build-essential libpq-dev ruby-dev make dpkg-dev gcc g++ \
      wget && \

  apt-get autoremove --purge -y && \
  docker-helper enable_stdout_logger && \
  chown -R discourse:discourse /opt/discourse && \
  for f in production.log unicorn.stderr.log unicorn.stdout.log; do \
    ln -sf /opt/discourse/log/$f /etc/stdout.d/$f; \
  done && \
  docker-helper cleanup
ADD copy /
VOLUME /opt/discourse/public/assets /opt/discourse/public/javascripts \
  /opt/discourse/public/images /opt/discourse/public/uploads
EXPOSE 3000
