---
order: 12
summary: Upload a Cloudflare worker script to AWS Lambda + public function URL
type: overview
---

# denoflare push-lambda

Upload a Cloudflare worker script to AWS Lambda + public function URL

By default, it will push once, but you can pass `--watch` to push on every change.


## --help

```
$ denoflare push-lambda --help
denoflare-push-lambda 0.7.0

Upload a Cloudflare worker script to AWS Lambda + public function URL

USAGE:
    denoflare push-lambda <script-spec> [OPTIONS]

ARGS:
    <script-spec>                                                  Name of script defined in .denoflare config, file path to bundled js worker, or an https url to a module-based worker .ts, e.g. https://path/to/worker.ts

OPTIONS:
    --name <string>                                                Name to use for lambda function name [default: Name of script defined in .denoflare config, or https url basename sans extension]
    --role <role-arn>                                              IAM role arn for the lambda function (e.g. arn:aws:iam::123412341234:role/my-lambda-role)
    --region <region-name>                                         AWS region (e.g. us-east-1)
    --architecture <architecture>                                  Lambda architecture (one of: x86, arm)
    --memory <mb>                                                  Memory for the lambda function, in MB (default: 128) (min: 128, max: 10240)
    --storage <mb>                                                 Size of the /tmp directory for the lambda function, in MB (default: 512) (min: 512, max: 10240)
    --timeout <seconds>                                            How long the lambda function is allowed to run, in seconds (default: 3) (min: 1, max: 900)
    --no-layer                                                     Skip creating a layer, deploy the lambda as one large zip (slower for multiple pushes)
    --deno-version <x.x.x>                                         Explicit deno version to use on lambda (default: Deno.version.deno)
    --profile <string>                                             AWS credentials for deploying the worker, from $HOME/.aws/credentials
    --access-key <string>                                          AWS credentials for deploying the worker (e.g. AKIA4ABC89ABC89ABC89)
    --secret-key <string>                                          AWS credentials for deploying the worker (e.g. aB98mjz0aB98mjz0aB98mjz0aB98mjz0aB98mjz0)
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


