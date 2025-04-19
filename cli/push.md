---
order: 2
summary: Upload a Cloudflare worker script to Cloudflare
type: overview
---

# denoflare push

Upload a worker script to Cloudflare Workers

By default, it will push once, but you can pass `--watch` to push on every change.

<Aside>

Learn how to use `denoflare push` in the [Publish a Worker Guide](/guides/push).

</Aside>

## --help

```
$ denoflare push --help
denoflare-push 0.7.0

Upload a Cloudflare worker script to Cloudflare

USAGE:
    denoflare push <script-spec> [OPTIONS]

ARGS:
    <script-spec>                                                  Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts

OPTIONS:
    --name <string>                                                Name to use for Cloudflare Worker script [default: Name of script defined in .denoflare config, or https url basename sans extension]
    --watch                                                        If set, watch the local file system and automatically re-upload on script changes
    --watch-include <path>...                                      If watching, watch this additional path as well (e.g. for dynamically-imported static resources)
    --custom-domain <domain-or-subdomain-name>...                  Bind worker to one or more Custom Domains for Workers
    --workers-dev                                                  Enable or disable the worker workers.dev route
    --logpush                                                      Enable or disable logpush for the worker
    --compatibility-date <string>                                  Specific compatibility environment for the worker, see https://developers.cloudflare.com/workers/platform/compatibility-dates/
    --compatibility-flag <string>...                               Specific compatibility flags for the worker, see https://developers.cloudflare.com/workers/platform/compatibility-dates/#compatibility-flags
    --observability                                                Enable or disable observability for the worker
    --observability-sample-rate <string>                           Observability sample rate, from 0 (0%) to 1 (100%)
    --cpu-limit <integer>                                          Maximum CPU time this worker is allowed to run, in milliseconds. default = 30000 (30 seconds)
    --delete-class <class-name>...                                 Delete an obsolete Durable Object (and all data!) by class name as part of the update
    --version-tag <string>                                         If set, push a new version with this tag
                                                                   
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
    --ratelimit-binding <name:namespace-id:limit:period>...        Ratelimit environment variable binding, overrides config
                                                                   
    --config <path>                                                Path to config file (default: .denoflare in cwd or parents)
    --profile <name>                                               Explicit profile to use from config file
    --account-id <string>                                          Explicit Cloudflare account id to use for authentication
    --api-token <string>                                           Explicit Cloudflare API token to use for authentication
                                                                   
    --bundle <name=value>...                                       Advanced options used when emitting javascript bundles: backend=(process|module|esbuild), check=(all|local|none)
                                                                   
    --help                                                         Print help information
    --verbose                                                      Toggle verbose output (when applicable)
```


