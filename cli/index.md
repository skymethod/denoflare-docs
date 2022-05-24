---
summary: Develop, test, and deploy Cloudflare Workers with Deno
title: CLI
type: overview
order: 2
---
# Denoflare Command-line Interface

Denoflare CLI is a standard [Deno](https://deno.land) program, so it benefits from the permission model and installation flexibility of all Deno programs.

## Installation

Denoflare requires Deno, which is [easy to install](https://deno.land/manual@v1.22.0/getting_started/installation)

Install `denoflare` via standard [deno install](https://deno.land/manual@v1.21.0/tools/script_installer)

```
deno install --unstable --allow-read --allow-net --allow-env --allow-run --name denoflare --force \
https://raw.githubusercontent.com/skymethod/denoflare/v0.5.0/cli/cli.ts
```

<details>
<summary>Alternatives: shell function or no-install direct run command for CI build</summary>
<div>

You can also "install" by defining a shell function in your shell config to a `deno run` command.
This allows you to create multiple aliases with different permissions.

```bash
# in ~/.bash_profile
function denoflare {
    deno run --unstable --allow-read --allow-net --allow-env --allow-run \
    https://raw.githubusercontent.com/skymethod/denoflare/v0.5.0/cli/cli.ts "$@"
}
```

Or, run without an install step at all, perhaps inside a CI build. Simply replace `denoflare` in our docs with the long-form `deno run` command.

e.g. instead of `denoflare serve x`

```
deno run --unstable --allow-read --allow-net --allow-env--allow-run \
https://raw.githubusercontent.com/skymethod/denoflare/v0.5.0/cli/cli.ts serve x
```

</div>
</details>

We'll start posting standard binary releases (via [deno compile](https://deno.land/manual@v1.22.0/tools/compiler)) when `denoflare` nears a stable feature set.

Check out the [Releases](https://github.com/skymethod/denoflare/releases) page for the latest version number tag, and details about each pre-release.

## Command help
Once `denoflare` is installed, the cli includes docs on each command and subcommand, available via `--help`.

<Aside>
Each subcommand below also links to its own dedicated help page, if available.
</Aside>

## --help

```
$ denoflare --help
denoflare 0.5.0

USAGE:
    denoflare <command> <args> <options>

COMMANDS:
    [serve](/cli/serve)      Run a Cloudflare worker script in a local Deno web server
    [push](/cli/push)       Upload a Cloudflare worker script to Cloudflare
    [tail](/cli/tail)       View a real-time stream of logs from a published Cloudflare worker
    [site](/cli/site)       Develop and deploy a static docs site to Cloudflare Pages
    [analytics](/cli/analytics)  Dump stats via the Cloudflare GraphQL Analytics API
    [cfapi](/cli/cfapi)      Call the Cloudflare REST API
    [r2](/cli/r2)         Manage Cloudflare R2 storage using the S3 compatibility API
    version    Dump cli version

For command-specific help: denoflare <command> --help
```

## Next Steps?

- Jump in and build in the [Start a New Worker](/guides/serve) guide.
- Learn to configure Denoflare. Most commands can be run using CLI options, but sometimes it's easier to specify profiles and script defs in a [.denoflare configuration file](/cli/configuration)
