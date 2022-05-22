---
order: 1
summary: Dump durable objects stats via the Cloudflare GraphQL Analytics API
title: denoflare analytics durable-objects
type: overview
---

# denoflare analytics durable-objects
Dump durable objects stats via the Cloudflare GraphQL Analytics API

## --help
```
$ denoflare analytics durable-objects --help
denoflare-analytics-durable-objects 0.4.5+

Dump durable objects stats via the Cloudflare GraphQL Analytics API

USAGE:
    denoflare analytics durable-objects [OPTIONS]

OPTIONS:
    --namespace-id <string>  Filter to single Durable Objects namespace id
    --start <yyyy-mm-dd>     Start of the analysis range (inclusive)
    --end <yyyy-mm-dd>       End of the analysis range (inclusive)
    --budget                 If set, dump GraphQL API request budget
    --totals                 If set, dump storage read/write unit and request/subrequest totals
                             
    --config <path>          Path to config file (default: .denoflare in cwd or parents)
    --profile <name>         Explicit profile to use from config file
    --account-id <string>    Explicit Cloudflare account id to use for authentication
    --api-token <string>     Explicit Cloudflare API token to use for authentication
                             
    --help                   Print help information
    --verbose                Toggle verbose output (when applicable)
```
