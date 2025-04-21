#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

echo "🔄 Waiting for PostgreSQL at $DATABASE_HOST..."

# Wait until PostgreSQL is ready
until pg_isready -h "$DATABASE_HOST" -U "$DATABASE_USERNAME" > /dev/null 2>&1; do
  sleep 1
done

echo "✅ PostgreSQL is ready."

# Create both development and test databases if they don't exist
echo "🏗️ Creating databases if not exists."

# Create development database
if ! bundle exec rails db:version RAILS_ENV=development > /dev/null 2>&1; then
  echo "📦 Development database not found. Creating..."
  bundle exec rails db:create RAILS_ENV=development
fi

# Create test database
if ! bundle exec rails db:version RAILS_ENV=test > /dev/null 2>&1; then
  echo "📦 Test database not found. Creating..."
  bundle exec rails db:create RAILS_ENV=test
fi

# Run migrations for both environments
echo "📈 Running migrations for development environment."
bundle exec rails db:migrate RAILS_ENV=development

echo "📈 Running migrations for test environment."
bundle exec rails db:migrate RAILS_ENV=test

# Optionally run db:seed for the development environment
# echo "🌱 Seeding development database..."
# bundle exec rails db:seed RAILS_ENV=development

echo "🚀 Starting Rails server for development environment..."
exec bundle exec rails server -b 0.0.0.0 -p 3000
