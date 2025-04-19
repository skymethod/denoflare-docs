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
denoflare-cfapi 0.7.0

Call the Cloudflare REST API

USAGE:
    denoflare cfapi <subcommand> <args> <options>

SUBCOMMANDS:
    list-scripts                          List Worker scripts
    get-script-settings                   Get Worker script settings
    get-workers-subdomain                 Get the name of your account-level workers.dev subdomain
    get-worker-account-settings           Get worker account settings
    put-worker-account-settings           Set worker account settings
    list-flags                            List account-level flags
    list-zones                            List zones
                                          
    put-key-value                         Set KV value
    get-key-value                         Get KV value
    list-keys                             List a KV namespace's keys
    list-kv-namespaces                    List KV namespaces
    query-kv-request-analytics            Query KV request metrics
    query-kv-storage-analytics            Query KV storage metrics
                                          
    get-worker-service-subdomain-enabled  Get whether or not the workers.dev route is enabled for a given worker service
    enable-worker-service-subdomain       Enable the workers.dev route for a given worker service
    disable-worker-service-subdomain      Disable the workers.dev route for a given worker service
                                          
    list-workers-domains                  List Workers domains
    put-workers-domain                    Create a Workers domain
    delete-workers-domain                 Delete a Worker domain
                                          
    list-buckets                          List R2 buckets
    create-bucket                         Create a new R2 bucket
    delete-bucket                         Delete a R2 bucket
    get-bucket-usage-summary              Get R2 Bucket usage summary
    list-event-notification-rules         List all event notification rules for an R2 bucket
    create-event-notification-rule        Create an event notification rule for an R2 bucket
    delete-event-notification-rule        Delete an event notification rule for an R2 bucket
                                          
    list-pipelines                        List pipelines
    create-pipeline                       Create a pipeline
    get-pipeline                          Get details for an existing pipeline
    update-pipeline                       Update an existing pipeline
    delete-pipeline                       Delete an existing pipeline
                                          
    verify-token                          Verify an api token
    list-memberships                      List memberships
    list-accounts                         List accounts
    get-account-details                   Get account details
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
                                          
    list-queues                           Returns the queues owned by an account
    create-queue                          Creates a new queue
    get-queue                             Get information about a specific queue
    update-queue                          Update a queue, does not support partial updates
    delete-queue                          Deletes a queue
    create-queue-consumer                 Creates a new consumer for a queue
    list-queue-consumers                  List consumers for a queue
    update-queue-consumer                 Update an existing queue consumer
    delete-queue-consumer                 Delete a queue consumer
    pull-queue-messages                   Pulls queue messages
    ack-queue-messages                    Acknowledge or retry queue messages
    preview-queue-messages                Preview queue messages
    send-queue-message                    Send queue message
                                          
    create-logpush-job                    Create a Logpush job
    update-logpush-job                    Update a Logpush job
    delete-logpush-job                    Delete a Logpush job
                                          
    list-ai-models                        List available AI models
    run-ai-model                          Run a specific AI model on-demand
                                          
    list-zone-rulesets                    List rulesets for a zone
    create-custom-error-response          Create a custom error rule for a zone

For subcommand-specific help: denoflare cfapi <subcommand> --help
```
