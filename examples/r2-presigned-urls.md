---
summary: Easily make your R2 bucket readable via presigned URLs.
title: R2 Presigned URLs
order: 4
---

# Easily make your R2 bucket readable via presigned URLs

A common use-case for cloud storage is to make files available, but only to authenticated users via expiring URLs that are presigned.

This feature will eventually be supported in R2 directly - but in the meantime, we've made an open-source utility worker available to support this.

Set up access with `denoflare r2 generate-credentials`, then a one-time `denoflare push` command to deploy it to your own account and zone (via [Custom Domains for Workers](https://blog.cloudflare.com/custom-domains-for-workers/)), no git commands or any other tools necessary.

## Features

This [open-source worker](https://github.com/skymethod/denoflare/tree/v0.5.2/examples/r2-presigned-url-worker) makes a single R2 bucket available via presigned URLs with the following features:
 - Supports conditional requests, range requests, and objects stored with pre-existing content-encoding
 - Use privately-generated credentials for your users, _not_ your actual Cloudflare credentials
 - (optional) Allow/deny ip lists
 - (optional) Configurable max skew for authenticated requests and maximum expiration time for the presigned URLs

## Prerequisites
You'll need:
1. A Cloudflare account, with R2 billing enabled (see the official [Purchase R2](https://developers.cloudflare.com/r2/get-started/#purchase-r2) instructions).
2. An R2 bucket with data you want to make available via presigned URLs.

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

## Generate credentials

Urls are presigned using a private `accessKeyId` and `secretAccessKey`.  You can generate or regenerate these privately using `denoflare r2 generate-credentials`

```
$ denoflare r2 [generate-credentials](/cli/r2#generate-credentials)
{
  "accessKeyId": "b7fa983c14b8acaa85ed761edce0d1e1",
  "secretAccessKey": "859c95572351d6bac3f53a0431b3be33d5833aa39a9928176e008d60be340e70"
}
```

## Deploy it to your own account

You can deploy our presigned-url example worker like any other worker with `denoflare push`. 

Let's say your your Cloudflare account id is `f2601bf4d2d5ddcb17981afe4db16dd2`, your API token secret is `ABCDEFGHIJKLMNOPQRSTUVWXYZ`, and your bucket name is `my-bucket`.

You can make this bucket available (for reading) at `my-bucket.my-domain.com` with the following command:

```
denoflare push https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-presigned-url-worker/worker.ts \
   --name my-bucket-presigned-urls \
   --r2-bucket-binding bucket:my-bucket \
   --secret-binding credentials:b7fa983c14b8acaa85ed761edce0d1e1:859c95572351d6bac3f53a0431b3be33d5833aa39a9928176e008d60be340e70 \
   --custom-domain my-bucket.my-domain.com \
   --account-id f2601bf4d2d5ddcb17981afe4db16dd2 \
   --api-token ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

That's it! 🎉

Your bucket will be available at `https://my-bucket.my-domain.com`

Your worker will be listed under your account, named `my-bucket-presigned-urls`.

Generate presigned urls using standard S3 tools like [presign](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/presign.html)
```
$ AWS_ACCESS_KEY_ID=b7fa983c14b8acaa85ed761edce0d1e1 AWS_SECRET_ACCESS_KEY=859c95572351d6bac3f53a0431b3be33d5833aa39a9928176e008d60be340e70 \
    aws s3 presign s3://b/video.mp4 --endpoint-url https://my-bucket.my-domain.com

https://my-bucket.my-domain.com/b/video.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=b7fa983c14b8acaa85ed761edce0d1e1%2F20220523%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220523T213654Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=5a8c57c282bbaed91dad2a2f7b58dc89fdc5ad279e91f81411d2c9a2f806b954
```

<Aside type="warning">
Your signing tool must support setting a custom endpoint url, which should be set to your custom domain origin
</Aside>

## Configuration

The worker takes [seven environment variables](https://github.com/skymethod/denoflare/blob/v0.5.2/examples/r2-presigned-url-worker/worker_env.d.ts)
 - `bucket`: (required) Your r2 bucket name
 - `credentials`: (required) Comma-separated user credentials, where each credential is a colon-delimited keypair of `accessKeyId`:`secretAccessKey`.

<Aside type="warning">

Even though these credentials are private to your worker, do NOT use your Cloudflare credentials. Generate them using `denoflare r2 generate-credentials` or some other similar mechanism.

</Aside>

 - `flags`: (optional) Comma-separated flags:
   - (None supported at the moment)
 - `denyIps`: (optional) Comma-separated ip addresses to deny (applied first)
 - `allowIps`: (optional) Comma-separated ip addresses to allow (applied second)
 - `maxSkewMinutes`: (optional) Number of minutes allowed before the authenticated request skew is considered too much (default: 15 minutes)
 - `maxExpiresMinutes`: (optional) Maximum amount of time allowed for presigned urls to expire (default: 7 days)


## Example

As with any Denoflare script, you can specify the environment variable bindings to `denofare push` using the command line, or in your `.denoflare` [config file](/cli/configuration).

The following are equivalent:

```
denoflare push https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-presigned-url-worker/worker.ts \
   --name my-bucket-presigned-urls \
   --r2-bucket-binding bucket:my-bucket \
   --text-binding allowIps:1.2.3.4 \
   --secret-binding credentials:b7fa983c14b8acaa85ed761edce0d1e1:859c95572351d6bac3f53a0431b3be33d5833aa39a9928176e008d60be340e70 \
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
        "my-bucket-presigned-urls": {

            // path can also be a local file path if you've modified the worker locally
            "path": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.2/examples/r2-presigned-url-worker/worker.ts",

            "bindings": {
                "bucket": { "bucketName": "my-bucket" },
                "allowIps": { "value": "1.2.3.4" },
                "credentials": { "secret": "b7fa983c14b8acaa85ed761edce0d1e1:859c95572351d6bac3f53a0431b3be33d5833aa39a9928176e008d60be340e70" },
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
