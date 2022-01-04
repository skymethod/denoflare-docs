---
order: 3
summary: Host static Cloudflare Pages site locally
title: denoflare site serve
---

# denoflare site serve
Host static Cloudflare Pages site locally

## --help
```
$ denoflare site serve --help
denoflare-site-serve 0.4.0
Host static Cloudflare Pages site locally

USAGE:
    denoflare site serve [FLAGS] [OPTIONS] [repo-dir]

FLAGS:
    -h, --help        Prints help information
        --verbose     Toggle verbose output (when applicable)
        --watch       Rebuild the site when file system changes are detected in <repo-dir>

OPTIONS:
        --port <number>     Local port to use for the http server (default: 8099)

ARGS:
    <repo-dir>      Local path to the git repo to use as the source input
```
