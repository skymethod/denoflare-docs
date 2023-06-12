---
order: 1
summary: WebAssembly/Wasm with Denoflare
type: overview
---

# WebAssembly/Wasm

Cloudflare Workers supports running small WebAssembly modules within either [script-based](https://blog.cloudflare.com/webassembly-on-cloudflare-workers/) or [module-based](https://blog.cloudflare.com/workers-javascript-modules/#are-there-non-javascript-modules) workers.

Denoflare provides a simple way to serve and deploy workers with WebAssembly components, building on Deno's [built-in WebAssembly support](https://deno.land/manual@v1.34.2/webassembly).

## Module-based workers

For module-based Cloudflare Workers, Cloudflare requires Wasm to be specified with an ES6 import of the form `import module from "./hello.wasm"` (`module` is then a [WebAssembly.Module](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WebAssembly/Module)).

Since this is not valid in browsers/Deno, nor valid under the [proposed WebAssembly/ES Module Integration](https://github.com/WebAssembly/esm-integration/tree/main/proposals/esm-integration#webassemblyes-module-integration), Denoflare needs to slighty modify the standard bundled module worker it uploads to Cloudflare during a `denoflare push`.

It also needs to have syntax that will run in `denoflare serve` in both local isolation modes, as well incorporate well into other Deno projects unrelated to Denoflare.

To accomplish this, Denoflare provides a special function called `importWasm` that will load Wasm properly in Deno and both modes of `denoflare serve`, and will be rewritten during `denoflare push` to the syntax required by Cloudflare. `importWasm` is just a [small standard Deno function](https://github.com/skymethod/denoflare/blob/v0.5.12/common/import_wasm.ts), it builds on [import.meta.url](https://deno.land/manual/examples/module_metadata) and Deno's recent support for local file:// `fetch`.

*worker.ts*
```ts
import { importWasm } from 'https://raw.githubusercontent.com/skymethod/denoflare/v0.5.12/common/import_wasm.ts';
const module = await importWasm(import.meta.url, './hello.wasm');
// import module from './hello.wasm';
// is the replacement used when pushing to Cloudflare

export default {
    fetch(): Response {
        try {
            // call hello.wasm
            const instance = new WebAssembly.Instance(module);
            const result = (instance.exports.main as CallableFunction)();

            const html = `<h3>Result from hello.wasm call: ${result}</h3>`;
            return new Response(html, { status: 200, headers: { 'Content-Type': 'text/html; charset=utf-8' } });
        } catch (e) {
            const html = `${e}`;
            return new Response(html, { status: 500, headers: { 'Content-Type': 'text/html; charset=utf-8' } });
        }
    }
};
```

See the [hello-wasm-worker example](https://github.com/skymethod/denoflare/blob/v0.5.12/examples/hello-wasm-worker/hello.ts) for more information.

## Script-based workers

For the older script-based Cloudflare Workers, WebAssembly modules are injected using [global environment variable bindings](https://developers.cloudflare.com/workers/platform/environment-variables).

Define your environment variable name and `wasmModule` in the script's `bindings` section in your [.denoflare configuration file](/cli/configuration), then use the injected global variable at runtime, it will be a [WebAssembly.Module](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WebAssembly/Module).

*worker.js*
```js
self.addEventListener('fetch', event => {
    event.respondWith(safeHandleRequest(event));
});

async function safeHandleRequest(event) {
    try {
        // call hello.wasm
        const instance = new WebAssembly.Instance(helloModule);
        const result = instance.exports.main();

        const html = `<h3>Result from hello.wasm call: ${result}</h3>`;
        return new Response(html, { status: 200, headers: { 'Content-Type': 'text/html; charset=utf-8' } });
    } catch (e) {
        const html = `${e}`;
        return new Response(html, { status: 500, headers: { 'Content-Type': 'text/html; charset=utf-8' } });
    }
}
```

*snippet from .denoflare config file*
```jsonc
"wasm-script-worker": {
    "path": "/path/to/worker.js",
    "bindings": {
        "helloModule": { "wasmModule": "/path/to/hello.wasm" },
    }
}
```

## More

- See [Transform Images with Wasm](/examples/transform-images-wasm) for a larger example of using an existing Wasm library inside a worker.
