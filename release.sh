# !/bin/bash

# Set variables
echo "Starting..."

export MIX_ENV=prod
export DATABASE_URL="postgres://postgres:postgres@localhost/jbb_dev"
export POOL_SIZE="10"
export SECRET_KEY_BASE="tempsecret"

secret=$(mix phx.gen.secret)
export SECRET_KEY_BASE=$secret

echo "MIX_ENV=$MIX_ENV"
echo "SECRET_KEY_BASE=$SECRET_KEY_BASE"
echo "DATABASE_URL=$DATABASE_URL"
echo "POOL_SIZE=$POOL_SIZE"

# Initial setup
echo "Install Elixir dependencies and compile"
mix deps.get --only prod
mix compile

# Install / update  JavaScript dependencies
echo "Install JavaScript dependencies and compile"
npm install --prefix ./assets

# Compile assets
npm run deploy --prefix ./assets
mix phx.digest

# Build release
echo "Build release"
mix release --overwrite