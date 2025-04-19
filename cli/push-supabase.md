---
order: 13
summary: Upload a Cloudflare worker script to Supabase Edge Functions
type: overview
---

# denoflare push-supabase

Upload a worker script to Supabase Edge Functions

By default, it will push once, but you can pass `--watch` to push on every change.

## --help

```
$ denoflare push-supabase --help
denoflare-push-supabase 0.7.0

Upload a Cloudflare worker script to Supabase Edge Functions

USAGE:
    denoflare push-supabase <script-spec> [OPTIONS]

ARGS:
    <script-spec>                                                  Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts

OPTIONS:
    --name <string>                                                Slug name of the Supabase Edge Function [default: Name of script defined in .denoflare config, or https url basename sans extension]
    --access-token <string>                                        Supabase Personal token, from the Supabase dashboard > account > access tokens (or set SUPABASE_ACCESS_TOKEN env var)
    --project-ref <20-char unique id>                              Supabase project reference (e.g. abcdwxyzabcdwxyzabcd) (or set SUPABASE_PROJECT_ID env var)
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
    --ratelimit-binding <name:namespace-id:limit:period>...        Ratelimit environment variable binding, overrides config
                                                                   
    --config <path>                                                Path to config file (default: .denoflare in cwd or parents)
                                                                   
    --bundle <name=value>...                                       Advanced options used when emitting javascript bundles: backend=(process|module|esbuild), check=(all|local|none)
                                                                   
    --help                                                         Print help information
    --verbose                                                      Toggle verbose output (when applicable)
```


