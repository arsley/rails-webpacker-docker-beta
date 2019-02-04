FROM ruby:2.6.1-slim
ARG precompileassets

RUN apt-get -y update && \
    mkdir -p /usr/share/man/man1 /usr/share/man/man7 && \
    apt-get install --fix-missing --no-install-recommends -qq -y \
      build-essential vim wget gnupg git-all curl ssh postgresql-client libpq5 libpq-dev -y && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash -  && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

# Install bunder and remove dafault version
RUN gem i bundler -v 1.17.3
RUN rm /usr/local/lib/ruby/gems/2.6.0/specifications/default/bundler-1.17.2.gemspec

# Install gem to global
WORKDIR /gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

# Copy Rails projects
ARG INSTALL_PATH=/opt/railswebpackerdocker
ENV INSTALL_PATH $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY . .

RUN scripts/potential_asset_precompile.sh $precompileassets
