---
summary: Develop, test, and deploy Cloudflare Workers with Deno
title: CLI
---

# Denoflare Command-line interface
Denoflare CLI is a standard Deno program, so it benefits from the permission model and installation flexibility of all Deno programs.

## Installation
While Denoflare is still under active development, it's easiest to simply "install" it by defining a shell function in your shell config to a `deno run` command:

```bash
# e.g. bash
function denoflare {
    deno run --unstable --allow-read --allow-net --allow-env https://raw.githubusercontent.com/skymethod/denoflare/v0.2.0/cli/cli.ts "$@"
}
```

You can also try [deno install](https://deno.land/manual@v1.13.2/tools/script_installer), and we'll start posting standard releases (via [deno compile](https://deno.land/manual@v1.13.2/tools/compiler)) when `denoflare` nears a stable feature set.

Once `denoflare` is defined, the cli includes docs on each command.

## --help
```
$ denoflare --help
denoflare 0.2.0

USAGE:
    denoflare [command] [FLAGS] [OPTIONS] [args]

COMMANDS:
```
 - [serve](/cli/serve) - Run a worker script on a local web server
 - [push](/cli/push) - Upload a worker script to Cloudflare Workers
 - [tail](/cli/tail) - View a stream of logs from a published worker
 - [site](/cli/site) - Develop and deploy a static docs site to Cloudflare Pages
 - version - Dump cli version

```
For command-specific help: denoflare [command] --help
```

## Configuration
Most commands can be run using cli options, but sometimes it's easier to specify profiles and script defs in a [.denoflare configuration file](/cli/configuration)
