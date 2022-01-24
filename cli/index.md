---
summary: Develop, test, and deploy Cloudflare Workers with Deno
title: CLI
---
# Denoflare Command-line Interface

Denoflare CLI is a standard [Deno](https://deno.land) program, so it benefits from the permission model and installation flexibility of all Deno programs.

## Installation

Denoflare requires Deno, which is [easy to install](https://deno.land/manual@v1.14.3/getting_started/installation)

Install `denoflare` via standard [deno install](https://deno.land/manual@v1.14.3/tools/script_installer)

```bash
deno install --unstable --allow-read --allow-net --allow-env --name denoflare --force https://raw.githubusercontent.com/skymethod/denoflare/v0.4.4/cli/cli.ts
```

Alternatively, you can also "install" by defining a shell function in your shell config to a `deno run` command.
This allows you to create multiple aliases with different permissions.

```bash
# in ~/.bash_profile
function denoflare {
    deno run --unstable --allow-read --allow-net --allow-env https://raw.githubusercontent.com/skymethod/denoflare/v0.4.4/cli/cli.ts "$@"
}
```

Or, run without an install step at all, perhaps inside a CI build. Simply replace `denoflare` in our docs with the long-form `deno run` command.

e.g. instead of `denoflare serve x`

```bash
deno run --unstable --allow-read --allow-net --allow-env https://raw.githubusercontent.com/skymethod/denoflare/v0.4.4/cli/cli.ts serve x
```

We'll start posting standard releases (via [deno compile](https://deno.land/manual@v1.14.3/tools/compiler)) when `denoflare` nears a stable feature set.

Once `denoflare` is defined, the cli includes docs on each command.

## --help

```bash
$ denoflare --help
denoflare 0.4.1

USAGE:
    denoflare [command] [FLAGS] [OPTIONS] [args]

COMMANDS:

```bash
 - [serve](/cli/serve) - Run a worker script on a local web server
 - [push](/cli/push) - Upload a worker script to Cloudflare Workers
 - [tail](/cli/tail) - View a stream of logs from a published worker
 - [site](/cli/site) - Develop and deploy a static docs site to Cloudflare Pages
 - version - Dump cli version

```bash
For command-specific help: denoflare [command] --help
```

## Next Steps?

- Jump in and build in the [Start a New Worker](/guides/serve) guide.
- Learn to configure Denoflare. Most commands can be run using CLI options, but sometimes it's easier to specify profiles and script defs in a [.denoflare configuration file](/cli/configuration)
