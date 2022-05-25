---
title: Transform Images with WASM
summary: Transform Images with WASM in a Cloudflare Worker, using WebAssembly from Photon and pngs.
order: 2
---

# Transform Images with WASM in a Cloudflare Worker

Prototype demonstrating running image resizing and other transforms completely inside a Cloudflare Worker.

<Aside>

Hosted version: https://image-demo.denoflare.dev/

</Aside>

<img src="/images/transform-images-wasm.png" class="large-img" style="margin: auto">

Sample input images come from [Unsplash](https://unsplash.com/).

Source is available in the [Denoflare repo](https://github.com/skymethod/denoflare/tree/v0.5.1/examples/image-demo-worker).

## Deploy it to your own account

Since it is a standard module-based Cloudflare Worker, you can deploy it like any other worker with `denoflare push`:

First, register a new app with Unsplash (free), you'll need your app name and _ixid_ as worker environment vars, to comply their TOS.

```
denoflare push --name image-demo \
    https://raw.githubusercontent.com/skymethod/denoflare/v0.5.1/examples/image-demo-worker/worker.ts \
    --text-binding unsplashAppName:your_app_name \
    --text-binding unsplashIxid:your_ixid
```

## Host it locally

Since it is a standard module-based Cloudflare Worker, you can run it locally like any other worker with `denoflare serve`:

First, register a new app with Unsplash (free), you'll need your app name and _ixid_ as worker environment vars, to comply their TOS.
```
denoflare serve \
    https://raw.githubusercontent.com/skymethod/denoflare/v0.5.1/examples/image-demo-worker/worker.ts
    --text-binding unsplashAppName:your_app_name \
    --text-binding unsplashIxid:your_ixid
```
