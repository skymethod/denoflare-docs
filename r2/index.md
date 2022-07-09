---
title: Denoflare ♥️ R2
summary: Denoflare support for Cloudflare R2
type: overview
order: 1
---

# Denoflare ♥️ Cloudflare R2

Cloudflare recently made [R2](https://developers.cloudflare.com/r2), its cloud storage offering, available in [beta to all customers](https://blog.cloudflare.com/r2-open-beta/).

<Aside>

R2 is still in an early pre-release state, but we're excited about this new service, and want to provide first-class
support for it in Denoflare.

</Aside>

Here are some things you can do with R2 starting with [Denoflare v0.5.0](https://github.com/skymethod/denoflare/releases/tag/v0.5.0).

## Easily make your R2 bucket publicly-readable on your domain

R2 has an [S3-compatible API](https://developers.cloudflare.com/r2/platform/s3-compatibility/api/), but does not yet support the public-read ACL, although it is on their roadmap.

In the meantime, since making a bucket public for reading is so common, we've made an open-source utility worker available to do this. It's a single one-time `denoflare push` command to deploy it to your own account and zone (via [Custom Domains for Workers](https://blog.cloudflare.com/custom-domains-for-workers/)), no git commands or any other tools necessary.

<Button type="primary" href="/examples/r2-public-read">Learn more</Button>

## Generate presigned URLs to your R2 buckets

Another common use-case for cloud storage is to make files available, but only to authenticated users via expiring URLs that are presigned.

R2 now supports this feature directly, use the Denoflare CLI to generate presigned urls using your already configured credentials

TODO

<Button type="primary" href="TODO">Learn more</Button>

## Track R2 costs and usage

Denoflare already provides [analytics for Durable Objects](/cli/analytics/durable-objects), but we now provide similar analytics for your R2 usage and costs.

You can query daily aggregate Class A operations, Class B operations, egress, storage, associated costs, and per-bucket cost, current storage, current object count, and egress with `denoflare analytics r2`.

<Button type="primary" href="/cli/analytics/r2">Learn more</Button>

## CLI and Typescript API for all R2 operations

Interact with your R2 storage over the S3-compatible API from the new `denoflare r2` command.

Each subcommand makes R2 calls via our [R2 TypeScript API](https://github.com/skymethod/denoflare/tree/v0.5.2/common/r2), available as a module or individual functions.
The API is lightweight (no deps on aws-sdk or aws4fetch, only on [fast-xml-parser](https://github.com/NaturalIntelligence/fast-xml-parser) and web standards). It can even be used within Workers themselves.

<details>
<summary>21 supported operations</summary>
<div>

```
- listBuckets
- headBucket
- createBucket
- deleteBucket
- getBucketEncryption
- deleteBucketEncryption
- putBucketEncryption
- getBucketLocation

- listObjects
- listObjectsV2
- getObject
- headObject
- putObject
- deleteObject
- deleteObjects
- copyObject

- createMultipartUpload
- abortMultipartUpload
- completeMultipartUpload
- uploadPart
- uploadPartCopy
```

</div>
</details>

<Button type="primary" href="/cli/r2">Learn more</Button>

## Worker R2 bucket bindings

Develop your own Cloudflare Worker scripts using Deno and strongly-typed `R2Bucket` environment bindings, representing the latest Cloudflare production runtime.

Run and test your worker locally (with `denoflare serve`) with the same `R2Bucket` bindings, pointing to an actual Cloudflare bucket!

<details>
<summary>How does it work?</summary>
<div>

```
/-------------------------\                                /------------------
|     denoflare serve     |                                |    cloudflare
|                         |                                |
|  /-------------------\  |                                |
|  |    my_worker.ts   |  |                                |
|  |         |         |  |                                |
|  |  /-------------\  |  |    /----------------------\    |  /-------------\
|  |  |  MY_BUCKET  |- |- |--->| R2 S3-compatible API |------>|  MY_BUCKET  |
|  |  \-------------/  |  |    \----------------------/    |  \-------------/
|  \-------------------/  |                                |
\-------------------------/                                |
```

</div>
</details>

<Button type="primary" href="/cli/serve">Learn more</Button>
