---
order: 6
summary: Call the Cloudflare REST API
type: overview
---

# denoflare cfapi
Call the Cloudflare REST API

## --help
```
$ denoflare cfapi --help
denoflare-cfapi 0.5.1

Call the Cloudflare REST API

USAGE:
    denoflare cfapi <subcommand> <args> <options>

SUBCOMMANDS:
    list-scripts                 List Worker scripts
    get-worker-account-settings  Get worker account settings
    put-worker-account-settings  Set worker account settings
    list-flags                   List account-level flags
    list-zones                   List zones
                                 
    put-key-value                Set KV value
    get-key-value                Get KV value
                                 
    list-workers-domains         List Workers domains
    put-workers-domain           Create a Workers domain
    delete-workers-domain        Delete a Worker domain
                                 
    list-buckets                 List R2 buckets
    create-bucket                Create a new R2 bucket
    delete-bucket                Delete a R2 bucket
                                 
    verify-token                 Verify an api token
    list-memberships             List memberships
    list-accounts                List accounts
    get-user                     Get user info

For subcommand-specific help: denoflare cfapi <subcommand> --help
```
