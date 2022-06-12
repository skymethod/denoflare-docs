---
summary: Easily make your R2 bucket publicly-readable on your own domain.
title: R2 Public Read
order: 3
---

# Easily make your R2 bucket publicly-readable on your own domain

R2 has an [S3-compatible API](https://developers.cloudflare.com/r2/platform/s3-compatibility/api/), but does not yet support the public-read ACL, although it is on their roadmap.

In the meantime, since making a bucket public for reading is so common, we've made an open-source utility worker available to do this. It's a single one-time `denoflare push` command to deploy it to your own account and zone (via [Custom Domains for Workers](https://blog.cloudflare.com/custom-domains-for-workers/)), no git commands or any other tools necessary.

## Features

This [open-source worker](https://github.com/skymethod/denoflare/tree/v0.5.2/examples/r2-public-read-worker) makes a single R2 bucket available via public-read with the following features:
 - Supports conditional requests, range requests, and objects stored with pre-existing content-encoding
 - (optional) Input flag to enable directory listing as html, with a configurable page limit
 - (optional) Input flag to enable routing similar to [Cloudflare Pages](https://developers.cloudflare.com/pages/), `index.html` served for directories, root level `404.html` etc
 - (optional) Allow/deny ip lists

## Prerequisites
You'll need:
1. A Cloudflare account, with R2 billing enabled (see the official [Purchase R2](https://developers.cloudflare.com/r2/get-started/#purchase-r2) instructions).
2. An R2 bucket with data you want to make publicly available.

<Aside>

Use the Cloudflare dashboard interface or [another supported tool like rclone](https://developers.cloudflare.com/r2/examples/) to create and populate the bucket

</Aside>

3. A desired target domain (or subdomain) on an active Cloudflare zone in your account.
4. A Cloudflare custom API token with permissions to manage Workers Scripts and Custom Domains for Workers for your target zone.

<details>
<summary>Minimal permissions needed for Custom Domains for Workers</summary>
<div>

<img src="/images/custom-domains-permissions.png" class="large-img" style="margin: auto">

**Note:** you'll need "Read Stream" permissions as well for some reason

You can limit these permissions to the target zone(s) for this worker.

</div>
</details>

5. A working installation of [Deno](https://deno.land) and `denoflare` (see [installation](/cli#installation))

## Deploy it to your own account

You can deploy our public-read example worker like any other worker with `denoflare push`. 

Let's say your your Cloudflare account id is `f2601bf4d2d5ddcb17981afe4db16dd2`, your API token secret is `ABCDEFGHIJKLMNOPQRSTUVWXYZ`, and your bucket name is `my-bucket`.

You can make this bucket available (for reading) at `my-bucket.my-domain.com` with the following command:

```
denoflare push https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-public-read-worker/worker.ts \
   --name my-bucket-public-read \
   --r2-bucket-binding bucket:my-bucket \
   --text-binding flags:listDirectories \
   --custom-domain my-bucket.my-domain.com \
   --account-id f2601bf4d2d5ddcb17981afe4db16dd2 \
   --api-token ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

That's it! 🎉

Your bucket will be available at `https://my-bucket.my-domain.com`

Your worker will be listed under your account, named `my-bucket-public-read`.

## Configuration

The worker takes [five environment variables](https://github.com/skymethod/denoflare/blob/v0.5.2/examples/r2-public-read-worker/worker_env.d.ts)
 - `bucket`: (required) Your r2 bucket name
 - `flags`: (optional) Comma-separated flags:
   - `directoryListing`: Display an html listing for directories
   - `emulatePages`: Cloudflare Pages-like routing for directories using index.html
   - `disallowRobots`: Serve a robots.txt that disallows all robots, regardless of bucket contents
 - `denyIps`: (optional) Comma-separated ip addresses to deny (applied first)
 - `allowIps`: (optional) Comma-separated ip addresses to allow (applied second)
 - `directoryListingLimit`: (optional) Page limit (in `directoryListing` mode)
   - Currently defaults to max (1000) due to a known R2 listing bug


## Example

As with any Denoflare script, you can specify the environment variable bindings to `denofare push` using the command line, or in your `.denoflare` [config file](/cli/configuration).

The following are equivalent:

```
denoflare push https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-public-read-worker/worker.ts \
   --name my-bucket-public-read \
   --r2-bucket-binding bucket:my-bucket \
   --text-binding flags:disallowRobots,emulatePages \
   --text-binding allowIps:1.2.3.4 \
   --text-binding directoryListingLimit:20 \
   --custom-domain my-bucket.my-domain.com \
   --account-id f2601bf4d2d5ddcb17981afe4db16dd2 \
   --api-token ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

or

```
denoflare push my-bucket-public-read
```

With the following `~/.denoflare.jsonc`

```jsonc
{
	// For auto-completion!
	"$schema": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/common/config.schema.json",

    // Named worker script configurations
	"scripts": {

        // worker name
        "my-bucket-public-read": {

            // path can also be a local file path if you've modified the worker locally
            "path": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-public-read-worker/worker.ts",

            "bindings": {
                "bucket": { "bucketName": "my-bucket" },
                "flags": { "value": "disallowRobots,emulatePages" },
                "allowIps": { "value": "1.2.3.4" },
                "directoryListingLimit": { "value": "20" },
            },
            "customDomains": [ "my-bucket.my-domain.com" ],
        },
    },

    // Cloudflare account credentials
    "profiles": {
		"token-1": {
			"accountId": "f2601bf4d2d5ddcb17981afe4db16dd2",
			"apiToken": "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		}
	}
}
```

See the [denoflare push](/cli/push) documentation for more info
