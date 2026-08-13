#!/bin/bash
# Find the active python virtual environment path automatically
VENV_PATH=$(find /var/app/ -name pip | head -n 1)

if [ -z "$VENV_PATH" ]; then
    # Fallback path if find statement takes too long
    VENV_PATH="/var/app/venv/staging-venv/bin/pip"
fi

echo "Installing machine learning modules using memory-optimized flags..."
$VENV_PATH install --no-cache-dir --prefer-binary -r prod_requirements.txt