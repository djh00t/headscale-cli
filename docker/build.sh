#!/bin/bash
###
### Headscale CLI image build script
###
APP="headscale-cli"
VERSION=$1

# Make sure that the version is set, if not error out
if [ -z "$VERSION" ]; then
    echo "Version not set, exiting..."
    exit 1
fi

# git tag with $VERSION
git tag $VERSION
#git tag -a $VERSION -m "headscale-cli version $VERSION"

# git commit with $VERSION
git commit -a -m "headscale-cli version $VERSION"

# git push
git push origin refs/tags/$VERSION
sleep 1
git push

exit 0