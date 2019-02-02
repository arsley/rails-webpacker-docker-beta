FROM ruby:2.6.1-slim
# ARG precompileassets

RUN apt-get -y update && \
    apt-get install --fix-missing --no-install-recommends -qq -y \
      build-essential vim wget gnupg git-all curl ssh postgresql-client libpq5 libpq-dev -y && \
    curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -  && \
    sudo apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

RUN gem i bundler

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

# RUN scripts/ptential_asset_precompile.sh $precompileassets
