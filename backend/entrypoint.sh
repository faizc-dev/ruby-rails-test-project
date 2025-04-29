#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails
rm -f /app/tmp/pids/server.pid

# Check required env vars
: "${DATABASE_HOST:?Missing DATABASE_HOST}"
: "${POSTGRES_USER:?Missing POSTGRES_USER}"
: "${POSTGRES_PASSWORD:?Missing POSTGRES_PASSWORD}"

echo "🔄 Waiting for PostgreSQL at $DATABASE_HOST..."

# Wait until PostgreSQL is ready
until pg_isready -h "$DATABASE_HOST" -U "$POSTGRES_USER" > /dev/null 2>&1; do
  sleep 1
done

echo "✅ PostgreSQL is ready."

# Ensure DB exists for development and test
for ENV in development test; do
  echo "📦 Checking $ENV database..."
  if ! bundle exec rails db:version RAILS_ENV=$ENV > /dev/null 2>&1; then
    echo "📗 $ENV database not found. Creating..."
    bundle exec rails db:create RAILS_ENV=$ENV
  fi
done

# Run migrations
echo "📈 Running migrations..."
bundle exec rails db:migrate RAILS_ENV=development
bundle exec rails db:migrate RAILS_ENV=test

# Optional: Seed database
# echo "🌱 Seeding development database..."
# bundle exec rails db:seed RAILS_ENV=development

# Start the Rails server
echo "🚀 Starting Rails server..."
exec bundle exec rails server -b 0.0.0.0 -p 3000
