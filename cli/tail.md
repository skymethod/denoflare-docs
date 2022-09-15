---
order: 3
summary: View a real-time stream of logs from a published Cloudflare worker
type: overview
---

# denoflare tail
View a stream of logs from a published worker

JSON-formatted by default, but human-readable ANSI-colored output is also available using `--format pretty`.

## --help
```
$ denoflare tail --help
denoflare-tail 0.5.8

View a real-time stream of logs from a published Cloudflare worker

USAGE:
    denoflare tail <name> [OPTIONS]

ARGS:
    <name>                    Name of the worker to tail

OPTIONS:
    --format <format>         Output format for log messages (one of: json, pretty, compact, default: json)
    --header <name:value>...  Filter by HTTP header
    --ip-address <string>...  Filter by IP address ('self' to filter your own IP address)
    --method <string>...      Filter by HTTP method
    --sampling-rate <rate>    Adds a sampling rate (0.01 for 1%) (default: 1)
    --search <string>...      Filter by a text match in console.log messages
    --status <string>...      Filter by invocation status (ok, error, canceled)
    --once                    If set, stops the tail after receiving the first log (useful for testing)
                              
    --config <path>           Path to config file (default: .denoflare in cwd or parents)
    --profile <name>          Explicit profile to use from config file
    --account-id <string>     Explicit Cloudflare account id to use for authentication
    --api-token <string>      Explicit Cloudflare API token to use for authentication
                              
    --help                    Print help information
    --verbose                 Toggle verbose output (when applicable)
```
