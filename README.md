# SSR Issue With Yarn and LiveVue

To view the issue:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/posts`](http://localhost:4000/posts) from your browser. You should see a flash of the Vue component popping in due to SSR not working, and can inspect the server logs to see:

```
[error] Vue SSR error: /Users/johngoff/Repos/live_vue_ssr_issue/assets/node_modules/live_vue/priv/static/index.js:1
export { getHooks } from "./hooks";
^^^^^^

SyntaxError: Unexpected token 'export'
    at wrapSafe (node:internal/modules/cjs/loader:1281:20)
    at Module._compile (node:internal/modules/cjs/loader:1321:27)
    at Module._extensions..js (node:internal/modules/cjs/loader:1416:10)
    at Module.load (node:internal/modules/cjs/loader:1208:32)
    at Module._load (node:internal/modules/cjs/loader:1024:12)
    at cjsLoader (node:internal/modules/esm/translators:348:17)
    at ModuleWrap.<anonymous> (node:internal/modules/esm/translators:297:7)
    at ModuleJob.run (node:internal/modules/esm/module_job:222:25)
    at async ModuleLoader.import (node:internal/modules/esm/loader:316:24)
    at async nodeImport (file:///Users/johngoff/Repos/live_vue_ssr_issue/assets/node_modules/vite/dist/node/chunks/dep-CB_7IfJ-.js:53056:15)
```

This issue is due to using yarn. If you do:

``` sh
cd assets && npm install && rm package-lock.json && cd ..
```

Now the SSR will work properly with Yarn. Seems that `npm` is installing something that `yarn` isn't...

