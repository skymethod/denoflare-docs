---
order: 4
summary: Develop and deploy a static docs site to Cloudflare Pages
---

# denoflare site
Develop and deploy a static docs site to Cloudflare Pages

## How to use
Define your content as Markdown files in a GitHub repo, and quickly generate a static site
in the style of Cloudflare's [Docs Engine](https://developers.cloudflare.com/docs-engine/).

It's very similar to the process of creating a Docs Engine site, but with a bit more [configuration](/cli/site/configuration).

Importantly, you can host the generated output on [Cloudflare Pages](https://pages.cloudflare.com/),
instead of [Workers Sites](https://developers.cloudflare.com/workers/platform/sites).

Take a look at [the source of this site](https://github.com/skymethod/denoflare-docs/) as an example.

## Deploy to Cloudflare Pages
Use `denoflare site generate` inside a custom build.

- In your Pages deployment, use the following settings:
  - Framework preset: `None`
  - Build Command: `./build.sh`
  - Build output directory: `/output`

- Create the `build.sh` file in the root of your content repo, for example:

```
#!/bin/sh
DENO_VERSION="v1.34.2"
DENOFLARE_VERSION="v0.6.0"
curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=./deno-$DENO_VERSION sh -s $DENO_VERSION
NO_COLOR=1 DENO_VERSION=$DENO_VERSION DENOFLARE_VERSION=${DENOFLARE_VERSION} \
    ./deno-$DENO_VERSION/bin/deno run --unstable --allow-all \
    https://raw.githubusercontent.com/skymethod/denoflare/$DENOFLARE_VERSION/cli/cli.ts \
    site generate . ./output --verbose
```

## --help
```
$ denoflare site --help
denoflare-site 0.6.0

Develop and deploy a static docs site to Cloudflare Pages

USAGE:
    denoflare site <subcommand> <args> <options>

SUBCOMMANDS:
    [generate](/cli/site/generate)   Develop and deploy a static docs site to Cloudflare Pages
    [serve](/cli/site/serve)      Host a static Cloudflare Pages site in a local Deno web server

For subcommand-specific help: denoflare site <subcommand> --help
```
