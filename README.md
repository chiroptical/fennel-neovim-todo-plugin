Fennel Neovim Plugin Example
---

Followed [Writing a neovim plugin in Lua][writing-a-neovim-plugin-with-lua] but
instead of using Lua, I used Fennel. [Fennel][fennel] is a language that
transpiles to Lua.

As far as I can tell, there isn't really a convenient way to include this in
[vim-plug][vim-plug]. There doesn't appear to be a great way to manage Lua
dependencies in general (so I am using nix). Additionally, you need to compile
the Fennel files to Lua.

How to use this?
---

You'll need to clone it, build the dependencies, and include it in your configuration.
Currently, this requires nix.

```shell
nix-build # fetches the lua dependencies
nix-shell # enters a shell with the dev dependencies
make      # generates the lua
pwd       # you'll need this for the next step
exit      # leave the nix shell
```

In your neovim config, replacing the path with the one from `pwd`,

```vimscript
Plug '{path_from_pwd_above}'
```

<!-- Links... -->
[writing-a-neovim-plugin-with-lua]: https://www.linode.com/docs/guides/writing-a-neovim-plugin-with-lua
[fennel]: https://fennel-lang.org
[vim-plug]: https://github.com/junegunn/vim-plug
