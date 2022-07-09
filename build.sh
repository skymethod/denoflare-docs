#!/bin/sh
DENO_VERSION="v1.22.0"
DENOFLARE_VERSION="v0.5.3"
curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=./deno-$DENO_VERSION sh -s $DENO_VERSION
NO_COLOR=1 DENO_VERSION=$DENO_VERSION DENOFLARE_VERSION=${DENOFLARE_VERSION} ./deno-$DENO_VERSION/bin/deno run --unstable --allow-all https://raw.githubusercontent.com/skymethod/denoflare/$DENOFLARE_VERSION/cli/cli.ts site generate . ./output --verbose
