#!/bin/bash

# Generate a random password
PASSWORD=$(openssl rand -base64 12)
echo "Generated password: $PASSWORD"

# Generate the hashed password
HASHED_PASSWORD=$(python3 -c "from notebook.auth import passwd; print(passwd('$PASSWORD'))")
echo "Hashed password: $HASHED_PASSWORD"

# Set the environment variables
export JUPYTER_TOKEN=$(openssl rand -hex 24)
export JUPYTER_PASSWORD=$HASHED_PASSWORD

echo "Generated token: $JUPYTER_TOKEN"

# Start the Jupyter Notebook
exec "$@"
