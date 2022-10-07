---
order: 1
summary: Run a Cloudflare worker script in a local Deno web server
type: overview
---

# denoflare serve

Run a Cloudflare worker script inside a local Deno web server for development and testing.

Supports hot-reloading by default, any script change will be picked up and available immediately.

<Aside>

Learn how to use `denoflare serve` in the [Start a New Worker Guide](/guides/serve).

</Aside>

## --help

```
$ denoflare serve --help
denoflare-serve 0.5.9

Run a Cloudflare worker script in a local Deno web server

USAGE:
    denoflare serve <script-spec> [OPTIONS]

ARGS:
    <script-spec>                                               Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts

OPTIONS:
    --port <number>                                             Local port to use for the http(s) server (default: 8080)
    --cert-pem <path>                                           (required for https) Path to certificate file in pem format (contents start with -----BEGIN CERTIFICATE-----)
    --key-pem <path>                                            (required for https) Path to private key file in pem format (contents start with -----BEGIN PRIVATE KEY-----)
    --name <string>                                             Explicit script name to use from config file
    --watch-include <path>...                                   Watch this additional path as well (e.g. for dynamically-imported static resources)
                                                                
    --text-binding <name:plain-text>...                         Plain text environment variable binding, overrides config
    --secret-binding <name:secret-text>...                      Secret text environment variable binding, overrides config
    --kv-namespace-binding <name:namespace-id>...               KV namespace environment variable binding, overrides config
    --do-namespace-binding <name:namespace-name:class-name>...  DO namespace environment variable binding, overrides config
    --wasm-module-binding <name:path-to-local-wasm-file>...     Wasm module environment variable binding, overrides config
    --service-binding <name:service:environment>...             Service environment variable binding, overrides config
    --r2-bucket-binding <name:bucket-name>...                   R2 bucket environment variable binding, overrides config
    --ae-dataset-binding <name:dataset-name>...                 Analytics Engine dataset environment variable binding, overrides config
                                                                
    --config <path>                                             Path to config file (default: .denoflare in cwd or parents)
    --profile <name>                                            Explicit profile to use from config file
    --account-id <string>                                       Explicit Cloudflare account id to use for authentication
    --api-token <string>                                        Explicit Cloudflare API token to use for authentication
                                                                
    --bundle <name=value>...                                    Advanced options used when emitting javascript bundles: backend=(process|module), check=(all|local|none)
                                                                
    --help                                                      Print help information
    --verbose                                                   Toggle verbose output (when applicable)
```
