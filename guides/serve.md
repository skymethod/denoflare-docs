---
order: 1
summary: Get up and running with `denoflare serve`
---

# Start a New Worker

Follow these steps to setup `denoflare serve` to run from a config file.  This assumes you've already [installed the denoflare CLI](/cli).

1. Create a project folder. Add an entry script:

    ```ts
    // index.ts
    export default {
        async fetch(request: Request, env: any) {
            try {
                return new Response('hi')
            } catch (e) {
                return new Response(e.message)
            }
        },
    }
    ```

2. Create a file named `.denoflare`. Paste in the following config:

    ```jsonc
    // .denoflare
    {
        "$schema": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.3/common/config.schema.json",
        "scripts": {
            "hello-local": {
                "path": "index.ts",
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

3. Start local development by running `denoflare serve hello-local`, where `hello-local` is the name of the script in the configuration file.

    Let's make sure it works.  Open [http://localhost:3030](http://localhost:3030).  You should see `hi`.

    Now change the response string to `Hello, World!` and save the file.  Denoflare will automatically compile the changes!  Refresh the browser to confirm.

4. That's all it takes.  You're ready to begin building your worker!
