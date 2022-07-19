---
order: 2
summary: Publish a worker with `denoflare push`
---

# Publish a Worker

Once your Cloudflare Worker is running as intended, you can use `denoflare push` to publish it.  This guide will
walk you through a few steps:

1. Create a `.denoflare` config with environment variable bindings.
2. Use those bindings in the worker script.
3. Test the code locally.
4. Publish the code to Cloudflare with `denoflare push`
5. Setup a custom name in the URL.
6. Automatically republish after changes are made.

It is assumed that you've already [installed the denoflare CLI](/cli).

1. In a new project folder, create a file named `.denoflare`. Paste in the following config, which includes the
enviroment variable binding named `SUFFIX`:

    ```jsonc
    // .denoflare
    {
        "$schema": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.4/common/config.schema.json",
        "scripts": {
            "complimenter": {
                "path": "index.ts",
                "bindings": {
                    "SUFFIX": {
                        "value": "is a genius!"
                    }
                },
                "localPort": 3030
            }
        },
        "profiles": {
            "account1": {
                // your cloudflare account id
                "accountId": "<YOUR ACCOUNT ID>",
                // your cloudflare api token
                "apiToken": "<YOUR API TOKEN>"
            }
        }
    }
    ```

    In order for the configuration to work, you have to enter your accountId and apiToken from your Cloudflare Workers dashboard.

2. Now let's create a worker script that gives a compliment using the `SUFFIX` environment variable. It will optionally use
   a `name` searchParam string from the URL.  Note that the second argument to the `fetch` handler is the `env` object, which
   contains our `SUFFIX` variable.

    ```ts
    // index.ts
    export default {
        async fetch(request: Request, env: any) {
            const url = new URL(request.url)
            const search = new URLSearchParams(url.search)
            const name = search.get('name') || 'Somebody'

            try {
                return new Response(`${name} ${env.SUFFIX}`)
            } catch (e) {
                return new Response(e.message)
            }
        },
    }
    ```

3. You can test the code by running `denoflare serve complimenter`.

    Let's make sure it works.  Open [http://localhost:3030](http://localhost:3030).  You should see `Somebody is a genius!`.

    Now try passing a name as a search param in the URL: [http://localhost:3030?name=Karen](http://localhost:3030?name=Karen).
    Now you should see `Karen is a genius!`.

4. It's time to publish this code to Cloudflare. Just run `denoflare push complimenter`.  You'll see some output like this:

   ```
   bundling complimenter into bundle.js...
   bundle finished in 142ms
   computed bindings in 0ms
   putting script complimenter... (10.9kb) (2.7kb compressed)
   put script complimenter in 1060ms
   ```

   At this point you need your `workers.dev` subdomain. You set this up when you created your Cloudflare account. You can get it from
   your Cloudflare Workers dashboard in the sidebar under the section called "Your subdomain".  For this example we will use an
   imaginary subdomain of `foo.workers.dev`.

   Since we just published the app, it should now be available at `complimenter.foo.workers.dev`.  You'll also see it in the
   Cloudflare Workers dashboard. By default, Denoflare will automatically name the uploaded Worker using the script name from the
   config.  If our script were named `hello-local`, like in the [Start a New Worker Guide](/guides/serve), it would be published to
   `hello-local.foo.workers.dev`.

5. Let's now publish the worker using a name other than the script name of `complimenter`.  The `denoflare push` command supports the
`--name` option to explicitly provide a name.

   ```
   denoflare push complimenter --name genius
   ```

   The output now shows the custom name you provided.  The site will now be available at `genius.foo.workers.dev` (only at the correct
   base url for your account: something other than `foo.workers.dev`)

6. One more thing before we wrap up this guide. The `denoflare push` command also supports `--watch` mode.  Using this CLI option tells
Denoflare to push the code every time a file changes.  This can be used with or without the `--name` option.  Here's what it looks like
without:

   ```
   denoflare push complimenter --watch
   ```

   Now every time you save a change, the code will be pushed to Cloudflare.  Note that sometimes it can take longer than 30 seconds for
   new changes to show up in the browser.  You can stop Denoflare by pressing `CTRL+C`.

7. It's time to soak this moment in.  You just published a Cloudflare Worker directly from your Denoflare code. Congratulations!
