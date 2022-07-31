Fennel Neovim Plugin Example
---

Followed [writing-a-neovim-plugin-with-lua][Writing a neovim plugin in Lua] but
instead of using Lua, I used Fennel. [fennel][Fennel] is a language that
transpiles to Lua.

As far as I can tell, there isn't really a convenient way to include this in
[vim-plug][vim-plug]. There doesn't appear to be a great way to manage Lua
dependencies in general (so I am using nix). Additionally, you need to compile
the Fennel files to Lua.

[writing-a-neovim-plugin-with-lua]: https://www.linode.com/docs/guides/writing-a-neovim-plugin-with-lua
[fennel]: https://fennel-lang.org
[vim-plug]: https://github.com/junegunn/vim-plug
