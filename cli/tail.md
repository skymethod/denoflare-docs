---
order: 3
summary: View a stream of logs from a published worker
---

# denoflare tail
View a stream of logs from a published worker

## --help
```
$ denoflare tail --help
denoflare-tail 0.3.2
View a stream of logs from a published worker

USAGE:
    denoflare tail [FLAGS] [OPTIONS] [--] [name]

FLAGS:
    -h, --help        Prints help information
        --once        Stops the tail after receiving the first log (useful for testing)
        --verbose     Toggle verbose output (when applicable)

OPTIONS:
    -f, --format <format>                   Output format for log messages [default: json]  [possible values: json, pretty]
        --header <header>...                Filter by HTTP header
        --ip-address <ip-address>...        Filter by IP address ("self" to filter your own IP address)
        --method <method>...                Filter by HTTP method
        --sampling-rate <sampling-rate>     Adds a sampling rate (0.01 for 1%) [default: 1]
        --search <search>                   Filter by a text match in console.log messages
        --status <status>...                Filter by invocation status [possible values: ok, error, canceled]
        --profile <name>                    Name of profile to load from config (default: only profile or default profile in config)
        --config <path>                     Path to config file (default: .denoflare in cwd or parents)

ARGS:
    <name>    Name of the worker to tail

```
