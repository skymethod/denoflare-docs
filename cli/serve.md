---
order: 1
summary: Run a worker script on a local web server
---

# denoflare serve
Run a worker script on a local web server

## --help
```
$ denoflare serve --help
denoflare-serve 0.3.2
Run a worker script on a local web server

USAGE:
    denoflare serve [FLAGS] [OPTIONS] [--] [script-spec]

FLAGS:
    -h, --help        Prints help information
        --verbose     Toggle verbose output (when applicable)

OPTIONS:
        --port <number>     Local port to use for the http server (default: 8080)
        --profile <name>    Name of profile to load from config (default: only profile or default profile in config)
        --config <path>     Path to config file (default: .denoflare in cwd or parents)

ARGS:
    <script-spec>    Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts
```