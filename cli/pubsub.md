---
order: 8
summary: Interact with your Cloudflare Pub/Sub broker
type: overview
---

# denoflare pubsub
Interact with your [Cloudflare Pub/Sub](https://developers.cloudflare.com/pub-sub/) broker

## --help
```
$ denoflare pubsub --help
denoflare-pubsub 0.5.3

Interact with your Cloudflare Pub/Sub broker

USAGE:
    denoflare pubsub <subcommand> <args> <options>

SUBCOMMANDS:
    [publish](/cli/pubsub#publish)    Publish a message to a Pub/Sub broker
    [subscribe](/cli/pubsub#subscribe)  Subscribe to a Pub/Sub broker
    [jwt](/cli/pubsub#jwt)        Parse a JWT token, and output its claims

For subcommand-specific help: denoflare pubsub <subcommand> --help
```

## publish
```
$ denoflare pubsub publish --help
denoflare-pubsub-publish 0.5.3

Publish a message to a Pub/Sub broker

USAGE:
    denoflare pubsub publish [OPTIONS]

OPTIONS:
    --text <string>                      Plaintext message payload
    --file <string>                      Path to file with the message payload
    --topic <string>                     Topic on which to publish the message (required)
    --n <integer>                        Times to repeat the message
    --max-messages-per-second <integer>  Maximum rate of message to send per second
                                         
    --endpoint <string>                  MQTT endpoint (required)
    --client-id <string>                 Client ID
    --password <string>                  Password
    --keep-alive <integer>               Keep alive rate (in seconds)
    --expiration <integer>               Expiration (in seconds) when auto-generating credential
    --debug-messages                     Dump all received mqtt messages
    --debug-jwt                          If the password is a jwt token, dump the claims
                                         
    --config <path>                      Path to config file (default: .denoflare in cwd or parents)
    --profile <name>                     Explicit profile to use from config file
    --account-id <string>                Explicit Cloudflare account id to use for authentication
    --api-token <string>                 Explicit Cloudflare API token to use for authentication
                                         
    --help                               Print help information
    --verbose                            Toggle verbose output (when applicable)
```

## subscribe
```
$ denoflare pubsub subscribe --help
denoflare-pubsub-subscribe 0.5.3

Subscribe to a Pub/Sub broker

USAGE:
    denoflare pubsub subscribe [OPTIONS]

OPTIONS:
    --topic <string>        Topic on which to subscribe (required)
                            
    --endpoint <string>     MQTT endpoint (required)
    --client-id <string>    Client ID
    --password <string>     Password
    --keep-alive <integer>  Keep alive rate (in seconds)
    --expiration <integer>  Expiration (in seconds) when auto-generating credential
    --debug-messages        Dump all received mqtt messages
    --debug-jwt             If the password is a jwt token, dump the claims
                            
    --config <path>         Path to config file (default: .denoflare in cwd or parents)
    --profile <name>        Explicit profile to use from config file
    --account-id <string>   Explicit Cloudflare account id to use for authentication
    --api-token <string>    Explicit Cloudflare API token to use for authentication
                            
    --help                  Print help information
    --verbose               Toggle verbose output (when applicable)
```

## jwt
```
$ denoflare pubsub jwt --help
denoflare-pubsub-jwt 0.5.3

Parse a JWT token, and output its claims

USAGE:
    denoflare pubsub jwt <token> [OPTIONS]

ARGS:
    <token>    JWT token string

OPTIONS:
               
    --help     Print help information
    --verbose  Toggle verbose output (when applicable)
```

