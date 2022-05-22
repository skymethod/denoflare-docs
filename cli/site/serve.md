---
order: 3
summary: Host static Cloudflare Pages site locally
title: denoflare site serve
type: overview
---

# denoflare site serve
Host static Cloudflare Pages site locally

## --help
```
$ denoflare site serve --help
denoflare-site-serve 0.4.5+

Host a static Cloudflare Pages site in a local Deno web server

USAGE:
    denoflare site serve <repo-dir> [OPTIONS]

ARGS:
    <repo-dir>        Local path to the git repo to use as the source input

OPTIONS:
    --port <integer>  Local port to use for the http server (default: 8099)
    --watch           If set, rebuild the site when file system changes are detected in <repo-dir>
                      
    --help            Print help information
    --verbose         Toggle verbose output (when applicable)
```
