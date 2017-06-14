FROM ruby:2.3
MAINTAINER Aurora System <it@aurora-system.com>

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN \
  apt-get update && apt-get install -y nodejs --no-install-recommends && \
  # see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
  apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && \
  # install node and yarn
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs --no-install-recommends && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install yarn --no-install-recommends && \
  # Libzmq3-dev, for MySQL
  apt-get update && apt-get install -y libzmq3-dev --no-install-recommends && \
  # bundler
  gem install bundler --no-doc --no-ri && \
  # clean
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Project
# Bundle
ADD ./Gemfile Gemfile
Add ./Gemfile.lock Gemfile.lock
RUN bundle install

#RUN useradd -ms /bin/bash deploy
RUN mkdir -p /app/
#RUN chown -R deploy /app
#USER deploy
WORKDIR /app
