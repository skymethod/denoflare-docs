#!/bin/sh
DENO_VERSION="v1.13.2"
DENOFLARE_VERSION="6cb6387e71b6b7bbaa90697d6264dbc7c58e86f9"
curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=./deno-$DENO_VERSION sh -s $DENO_VERSION
NO_COLOR=1 DENO_VERSION=$DENO_VERSION DENOFLARE_VERSION=${DENOFLARE_VERSION} ./deno-$DENO_VERSION/bin/deno run --unstable --allow-all https://raw.githubusercontent.com/skymethod/denoflare/$DENOFLARE_VERSION/cli/cli.ts site generate . ./output --verbose
