---
summary: Develop, test, and deploy Cloudflare Workers with Deno
title: CLI
type: overview
order: 2
---
# Denoflare Command-line Interface

Denoflare CLI is a standard [Deno](https://deno.land) program, so it benefits from the permission model and installation flexibility of all Deno programs.

## Installation

Denoflare requires Deno, which is [easy to install](https://docs.deno.com/runtime/getting_started/installation/)

Install `denoflare` via standard [deno install](https://docs.deno.com/runtime/reference/cli/install/)

```
deno install --global -A --unstable-worker-options --name denoflare --force \
https://raw.githubusercontent.com/skymethod/denoflare/v0.7.0/cli/cli.ts
```

<details>
<summary>Alternatives: shell function or no-install direct run command for CI build</summary>
<div>

### Shell function

You can also "install" by defining a shell function in your shell config to a `deno run` command.
This allows you to create multiple aliases with different permissions.

```bash
# in ~/.bash_profile
function denoflare {
    deno run -A --unstable-worker-options \
    https://raw.githubusercontent.com/skymethod/denoflare/v0.7.0/cli/cli.ts "$@"
}
```

### Run without install

Or, run without an install step at all, perhaps inside a CI build. Simply replace `denoflare` in our docs with the long-form `deno run` command.

e.g. instead of `denoflare serve x`

```
deno run -A --unstable-worker-options \
https://raw.githubusercontent.com/skymethod/denoflare/v0.7.0/cli/cli.ts serve x
```

### Use with `deno task` (unstable)

Above can also be saved as a [deno task](https://deno.land/manual@v1.26.1/tools/task_runner):
```json
{
  "tasks": {
    "denoflare": "deno run --unstable --allow-read --allow-net --allow-env --allow-run https://raw.githubusercontent.com/skymethod/denoflare/v0.5.9/cli/cli.ts",
  }
}
```

You can then run Denoflare simply `deno task denoflare`, e.g. `deno task denoflare serve x`

</div>
</details>

Check out the [Releases](https://github.com/skymethod/denoflare/releases) page for the latest version number tag, and details about each pre-release.

<Aside>

We'll start producing single `denoflare` binaries for each release (via [deno compile](https://deno.land/manual@v1.34.2/tools/compiler)) whenever [Deno supports dynamic web workers in compile](https://github.com/denoland/deno/issues/18327)

</Aside>

## Command help
Once `denoflare` is installed, the cli includes docs on each command and subcommand, available via `--help`.

<Aside>
Each subcommand below also links to its own dedicated help page, if available.
</Aside>

## --help

```
$ denoflare --help
denoflare 0.7.0

USAGE:
    denoflare <command> <args> <options>

COMMANDS:
    [serve](/cli/serve)          Run a Cloudflare worker script in a local Deno web server
    [push](/cli/push)           Upload a Cloudflare worker script to Cloudflare
    [push-lambda](/cli/push-lambda)    Upload a Cloudflare worker script to AWS Lambda + public function URL
    [push-deploy](/cli/push-deploy)    Upload a Cloudflare worker script to Deno Deploy
    [push-supabase](/cli/push-supabase)  Upload a Cloudflare worker script to Supabase Edge Functions
    [tail](/cli/tail)           View a real-time stream of logs from a published Cloudflare worker
    [site](/cli/site)           Develop and deploy a static docs site to Cloudflare Pages
    [analytics](/cli/analytics)      Dump stats via the Cloudflare GraphQL Analytics API
    [cfapi](/cli/cfapi)          Call the Cloudflare REST API
    [r2](/cli/r2)             Manage Cloudflare R2 storage using the S3 compatibility API
    [pubsub](/cli/pubsub)         Interact with your Cloudflare Pub/Sub broker
    [d1](/cli/d1)             Manage and query your Cloudflare D1 databases
    [ae-proxy](/cli/ae-proxy)       Host a proxy endpoint to Analytics Engine more compatible with Clickhouse plugins
    version        Dump cli version

For command-specific help: denoflare <command> --help
```

## Next Steps?

- Jump in and build in the [Start a New Worker](/guides/serve) guide.
- Learn to configure Denoflare. Most commands can be run using CLI options, but sometimes it's easier to specify profiles and script defs in a [.denoflare configuration file](/cli/configuration)
