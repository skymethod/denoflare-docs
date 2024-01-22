---
order: 11
summary: Upload a Cloudflare worker script to Deno Deploy
type: overview
---

# denoflare push-deploy

Upload a Cloudflare worker script to Deno Deploy

By default, it will push once, but you can pass `--watch` to push on every change.

## --help

```
$ denoflare push-deploy --help
denoflare-push-deploy 0.6.0

Upload a Cloudflare worker script to Deno Deploy

USAGE:
    denoflare push-deploy <script-spec> [OPTIONS]

ARGS:
    <script-spec>                                                  Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts

OPTIONS:
    --name <string>                                                Project name in Deno Deploy [default: Name of script defined in .denoflare config, or https url basename sans extension]
    --access-token <string>                                        Personal access token from the Deploy dashboard (or set DENO_DEPLOY_TOKEN env var)
    --watch                                                        If set, watch the local file system and automatically re-upload on script changes
    --watch-include <path>...                                      If watching, watch this additional path as well (e.g. for dynamically-imported static resources)
                                                                   
    --text-binding <name:plain-text>...                            Plain text environment variable binding, overrides config
    --secret-binding <name:secret-text>...                         Secret text environment variable binding, overrides config
    --kv-namespace-binding <name:namespace-id>...                  KV namespace environment variable binding, overrides config
    --do-namespace-binding <name:namespace-name:class-name>...     DO namespace environment variable binding, overrides config
    --wasm-module-binding <name:path-to-local-wasm-file>...        Wasm module environment variable binding, overrides config
    --service-binding <name:service:environment>...                Service environment variable binding, overrides config
    --r2-bucket-binding <name:bucket-name>...                      R2 bucket environment variable binding, overrides config
    --ae-dataset-binding <name:dataset-name>...                    Analytics Engine dataset environment variable binding, overrides config
    --queue-binding <name:queue-name>...                           Queue environment variable binding, overrides config
    --secret-key-binding <name:{"algorithm":{"name":"HMAC"...>...  Secret key environment variable binding, overrides config
                                                                   
    --config <path>                                                Path to config file (default: .denoflare in cwd or parents)
                                                                   
    --bundle <name=value>...                                       Advanced options used when emitting javascript bundles: backend=(process|module), check=(all|local|none)
                                                                   
    --help                                                         Print help information
    --verbose                                                      Toggle verbose output (when applicable)
```


