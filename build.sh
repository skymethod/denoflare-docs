#!/bin/sh
DENO_VERSION="v1.13.2"
DENOFLARE_VERSION="66f960bd41c63d75a9cf2ff69ddfb658c3e6663d"
curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=./deno-$DENO_VERSION sh -s $DENO_VERSION
./deno-$DENO_VERSION/bin/deno run --unstable --allow-all https://raw.githubusercontent.com/skymethod/denoflare/$DENOFLARE_VERSION/cli/cli.ts site generate --verbose --output=./output
