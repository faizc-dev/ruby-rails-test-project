FROM ruby:3.4.3-slim

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libyaml-dev nodejs yarn postgresql-client

# Copy Gemfile separately for better layer caching
COPY backend/Gemfile* ./
RUN bundle install

# Copy rest of the app
COPY backend .

# Precompile assets and setup db
# RUN bundle exec rake assets:precompile

EXPOSE 3000

# RUN RAILS_ENV=test rails db:create
# RUN RAILS_ENV=test rails db:migrate

# CMD ["rails", "server", "-b", "0.0.0.0"]
COPY backend/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
