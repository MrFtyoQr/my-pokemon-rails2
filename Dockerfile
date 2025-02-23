FROM ruby:3.2.7

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
    tzdata \
    sqlite3 libsqlite3-dev \
    ca-certificates && \
    update-ca-certificates

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
