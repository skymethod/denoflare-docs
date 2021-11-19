---
order: 2
summary: Upload a worker script to Cloudflare Workers
---

# denoflare push
Upload a worker script to Cloudflare Workers

## --help
```
$ denoflare push --help
denoflare-push 0.3.3
Upload a worker script to Cloudflare Workers

USAGE:
    denoflare push [FLAGS] [OPTIONS] [--] [script-spec]

FLAGS:
    -h, --help        Prints help information
        --verbose     Toggle verbose output (when applicable)
        --watch       Re-upload the worker script when local changes are detected

OPTIONS:
    -n, --name <name>        Name to use for Cloudflare Worker script [default: Name of script defined in .denoflare config, or https url basename sans extension]
        --profile <name>     Name of profile to load from config (default: only profile or default profile in config)
        --config <path>      Path to config file (default: .denoflare in cwd or parents)

ARGS:
    <script-spec>    Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts
```
