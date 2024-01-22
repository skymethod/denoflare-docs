---
order: 10
summary: Host a proxy endpoint to Analytics Engine more compatible with Clickhouse plugins
type: overview
---

# denoflare ae-proxy
Host a proxy endpoint to Analytics Engine more compatible with Clickhouse plugins

## --help
```
$ denoflare ae-proxy --help
denoflare-ae-proxy 0.6.0

Host a proxy endpoint to Analytics Engine more compatible with Clickhouse plugins

USAGE:
    denoflare ae-proxy [OPTIONS]

OPTIONS:
    --port <integer>       Local port to use (required)
    --basic <user:pass>    Basic auth username/password to secure local proxy
                           
    --config <path>        Path to config file (default: .denoflare in cwd or parents)
    --profile <name>       Explicit profile to use from config file
    --account-id <string>  Explicit Cloudflare account id to use for authentication
    --api-token <string>   Explicit Cloudflare API token to use for authentication
                           
    --help                 Print help information
    --verbose              Toggle verbose output (when applicable)
```
