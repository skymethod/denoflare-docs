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
denoflare-cfapi 0.5.3

Call the Cloudflare REST API

USAGE:
    denoflare cfapi <subcommand> <args> <options>

SUBCOMMANDS:
    list-scripts                          List Worker scripts
    get-workers-subdomain                 Get the name of your account-level workers.dev subdomain
    get-worker-account-settings           Get worker account settings
    put-worker-account-settings           Set worker account settings
    list-flags                            List account-level flags
    list-zones                            List zones
                                          
    put-key-value                         Set KV value
    get-key-value                         Get KV value
                                          
    get-worker-service-subdomain-enabled  Get whether or not the workers.dev route is enabled for a given worker service
    enable-worker-service-subdomain       Enable the workers.dev route for a given worker service
    disable-worker-service-subdomain      Disable the workers.dev route for a given worker service
                                          
    list-workers-domains                  List Workers domains
    put-workers-domain                    Create a Workers domain
    delete-workers-domain                 Delete a Worker domain
                                          
    list-buckets                          List R2 buckets
    create-bucket                         Create a new R2 bucket
    delete-bucket                         Delete a R2 bucket
                                          
    verify-token                          Verify an api token
    list-memberships                      List memberships
    list-accounts                         List accounts
    get-user                              Get user info
    list-durable-objects-namespaces       List Durable Objects namespaces
    list-durable-objects                  List Durable Objects for a given namespace
                                          
    list-pubsub-namespaces                List Pub/Sub namespaces
    create-pubsub-namespace               Create a Pub/Sub namespace
    delete-pubsub-namespace               Delete a Pub/Sub namespace
    list-pubsub-brokers                   List Pub/Sub brokers
    create-pubsub-broker                  Create a Pub/Sub broker
    update-pubsub-broker                  Update a Pub/Sub broker
    list-pubsub-broker-public-keys        List the public keys for a Pub/Sub broker
    get-pubsub-broker                     Get a Pub/Sub broker
    delete-pubsub-broker                  Delete a Pub/Sub broker
    generate-pubsub-credentials           Generate credentials for a Pub/Sub broker
    revoke-pubsub-credentials             Revoke credentials for a Pub/Sub broker
    list-pubsub-revocations               List revocations for a Pub/Sub broker
    delete-pubsub-revocations             Delete revocations for a Pub/Sub broker

For subcommand-specific help: denoflare cfapi <subcommand> --help
```
