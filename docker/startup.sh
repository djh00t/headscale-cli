#!/bin/bash
###
### Container startup script
###
# Set variables
export HS_ARCH=$(uname -m)
export HS_OS=$(uname -s | tr '[:upper:]' '[:lower:]')
export BASENAME=$(ls /usr/local/bin/headscale_*|head -n 1|sed 's/.....$//')

# Alpine specific architecture check
if [ $HS_ARCH = aarch64 ]; then 
    export HS_ARCH="arm64"
fi

# Set correct binary name
export BINARY="${BASENAME}${HS_ARCH}"

# Create symlink for architecure
ln -s ${BINARY} /usr/local/bin/headscale

# Wait 30 seconds
sleep 30

# Loop to keep container up
tail -f /dev/null
