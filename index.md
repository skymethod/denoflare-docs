---
type: overview
summary: Develop, test, and deploy Cloudflare Workers with Deno
---

# Overview
Develop, test, and deploy [Cloudflare Workers](https://workers.cloudflare.com) with [Deno](https://deno.land)


<Aside header="New in v0.7.0+">

Denoflare is now compatible with [Deno 2](https://deno.com/blog/v2.0)

Under the hood, it uses [deno bundle](https://docs.deno.com/runtime/reference/migration_guide/#cli-changes) on Deno 1.x and [esbuild](https://esbuild.github.io/) + [esbuild-deno-loader](https://jsr.io/@luca/esbuild-deno-loader) on Deno 2.x.

</Aside>

<Aside header="New in v0.6.0+">

Experimental support for deploying the same worker to [Deno Deploy](https://deno.com/deploy), [AWS Lambda](https://aws.amazon.com/lambda/), or [Supabase Edge Functions](https://supabase.com/docs/guides/functions)

[Learn more about Denoflare’s support for multiple platforms](https://github.com/skymethod/denoflare/tree/master/examples/multiplat-worker)

</Aside>

<Aside header="New in v0.5.0+">

Support for [Cloudflare R2](https://developers.cloudflare.com/r2/)

[Learn more about Denoflare’s support for R2](/r2)

</Aside>

## Denoflare CLI
`denoflare` is a single cli tool to make developing and deploying Cloudflare Workers simple.

No need for [Wrangler](https://developers.cloudflare.com/workers/cli-wrangler), [Node](https://nodejs.org/en/), [npm](https://www.npmjs.com/), or [webpack](https://webpack.js.org/) 🤯 🤯 🤯 🤯

<Button type="primary" href="/cli">Install denoflare</Button>

Deno is a great fit for Workers development, the runtime is based on [the modern Web Platform](https://deno.land/manual@v1.34.2/runtime/web_platform_apis), just like Workers, is [secure by default](https://deno.land/manual@v1.34.2/getting_started/permissions), and based on [ESM modules](https://deno.com/manual@v1.34.2/basics/modules).

Denoflare can:
 - Give you first-class support for [ESM-based workers](https://developers.cloudflare.com/workers/learning/using-durable-objects#instantiating-and-communicating-with-a-durable-object)
 - Help you develop and test a worker, by running locally inside a permissionless Deno isolate, similar to the [Workers Runtime](https://developers.cloudflare.com/workers/runtime-apis)
   - see [denoflare serve](/cli/serve)
 - Deploy your JavaScript or TypeScript worker to Cloudflare easily from a local script file, or from an https: URL
   - see [denoflare push](/cli/push)
 - Monitor your workers in production from the command line
   - see [denoflare tail](/cli/tail)
 - Generate a customizable static documentation site for Cloudflare Pages in the style of Cloudflare's [Docs Engine](https://developers.cloudflare.com/docs-engine/)
   - see [denoflare site](/cli/site)
 - Keep track of your Durable Objects and R2 costs and statistics
   - see [denoflare analytics](/cli/analytics)
 - Call the Cloudflare REST API from the command line
   - see [denoflare cfapi](/cli/cfapi)
 - Manage Cloudflare R2 storage using the S3 compatibility API
   - see [denoflare r2](/cli/r2)
 - _**New!**_ Deploy your worker to Deno Deploy, AWS Lambda, or Supabase Edge Functions
   - see [denoflare push-deploy](/cli/push-deploy), [denoflare push-lambda](/cli/push-lambda), or [denoflare push-supabase](/cli/push-supabase)

[Learn more about the CLI](/cli)

## Deploy via files or URLs
Denoflare leverages Deno for bundling, so it works great for local files, but also URLs.  Deploying [a module-based hello worker](https://github.com/skymethod/denoflare/blob/v0.7.0/examples/hello-worker/hello.ts) is trivial:
```
denoflare push https://raw.githubusercontent.com/skymethod/denoflare/v0.7.0/examples/hello-worker/hello.ts
```

## Roadmap
Denoflare is still under active initial development (pre 1.0), but is completely open-source and can be used as is.

[Releases](https://github.com/skymethod/denoflare/releases)

The core `serve`, `push`, `site`, and `analytics` subcommands have been stable for while, so the focus at the moment is to provide first-class support for the expanding suite of Cloudflare's platform products such as:
 - [Cloudflare R2](https://developers.cloudflare.com/r2/)
 - [Cloudflare Pub/Sub](https://developers.cloudflare.com/pub-sub)
 - [Workers Analytics Engine](https://developers.cloudflare.com/analytics/analytics-engine/)
 - [Cloudflare D1](https://blog.cloudflare.com/introducing-d1/)

Join the project over on [the Denoflare GitHub repo](https://github.com/skymethod/denoflare).

## Made with Denoflare
These projects are known to have used `denoflare` for development.

#### firesky.tv

[Monitor the Bluesky firehose!](https://firesky.tv)

<img src="/images/firesky.png" class="large-img" style="margin: auto">

#### webtail.denoflare.dev

[Watch live requests and logs for your Cloudflare Workers in the browser!](https://webtail.denoflare.dev)

<img src="/images/webtail.png" class="large-img" style="margin: auto">

#### bundle.deno.dev

[deno bundle as a service](https://bundle.deno.dev/) 

<img src="/images/deno-bundle.png" class="large-img" style="margin: auto">

## Support this project
Contributions to help fund ongoing development of Denoflare are welcome and appreciated!

<Button type="primary" href="https://buy.stripe.com/6oE7v22Q74nvakwaEE">Donate</Button>
