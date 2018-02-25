#!/bin/bash
# Interpreter identifier

set -e
# Exit on fail

bundle check || bundle install --binstubs="$BUNDLE_BIN"
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

# Setup db and/or run migrations
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

# Start guard in the BG
bundle exec guard -i -p &

exec "$@"
# Finally call command issued to the docker service
