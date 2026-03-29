# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim. It uses lazy.nvim for plugin management and is written entirely in Lua.

## Commands

- **Format Lua code**: `stylua .` (uses `.stylua.toml` config)
- **Check health**: `:checkhealth` inside Neovim
- **Plugin management**: `:Lazy` (update, sync, clean)
- **LSP tools**: `:Mason` to manage language servers

## Code Style

StyLua formatting with these settings (`.stylua.toml`):
- 160 column width
- 2-space indentation
- Single quotes preferred
- No call parentheses

## Architecture

### Entry Point
- `init.lua` - Main config file containing core settings, keymaps, autocommands, and plugin specifications via `lazy.setup()`

### Modular Extensions (lua/)
- `lua/config/` - User customizations loaded after plugins
  - `init.lua` - Loads keymaps and options
  - `keymaps.lua` - Custom keybindings (buffer navigation, Copilot, window resize)
  - `options.lua` - Additional vim options and custom commands
  - `functions.lua` - Utility functions (e.g., case switching)
- `lua/kickstart/plugins/` - Optional kickstart plugins (neo-tree, debug, lint, gitsigns, autopairs)
- `lua/custom/plugins/` - User's own plugins, auto-imported via `{ import = 'custom.plugins' }`

### Plugin Loading Order
1. `init.lua` sets up lazy.nvim and all core plugins inline
2. Kickstart plugins are required explicitly (e.g., `require 'kickstart.plugins.neo-tree'`)
3. Custom plugins auto-imported from `lua/custom/plugins/*.lua`
4. `require 'config'` loads user keymaps and options last

### Key Plugins Configured
- **LSP**: nvim-lspconfig + Mason (pyright, r_language_server, bashls, lua_ls)
- **Completion**: blink.cmp with LuaSnip
- **Fuzzy finding**: Telescope
- **File explorer**: neo-tree (netrw disabled in `lua/custom/plugins/init.lua`)
- **Formatting**: conform.nvim (format on save, `<leader>f` manual format)
- **Git**: gitsigns, vim-fugitive with GitLab support
- **Copilot**: GitHub Copilot with toggle keymaps (`<leader>c*`)

### Leader Key
Space (`<space>`) is the leader key. Key prefixes:
- `<leader>s` - Search (Telescope)
- `<leader>t` - Toggle
- `<leader>h` - Git hunk operations
- `<leader>c` - Copilot controls
- `<leader>a` - AI CopilotChat (toggle, explain, review, fix, docs, tests, commit)
- `<leader>o` - CodeCompanion (toggle, actions, inline assistant)

### AI Chat Plugins
Two chat plugins are installed, both using GitHub Copilot subscription:

**CopilotChat.nvim** (`<leader>a`):
- `<leader>aa` - Toggle chat window
- `<leader>ap` - Open prompts selector
- `<leader>am` - Select AI model
- `<leader>aq` - Quick question
- `<leader>ae/r/f/d/t/o` - Explain/Review/Fix/Docs/Tests/Optimize
- `<leader>ac` - Generate commit message

**CodeCompanion.nvim** (`<leader>o`):
- `<leader>oo` - Toggle chat window
- `<leader>oa` - Action palette
- `<leader>oi` - Inline assistant
- `<leader>op` - Add selection to chat (visual mode)

## Maintenance

Scripts in `~/tools/general/bash/nvim-*.sh` (available as commands via symlinks):
- `nvim-update` -- Update neovim binary (AppImage from GitHub releases)
- `nvim-sync-upstream` -- Merge upstream kickstart.nvim into fork
- `nvim-health` -- Health checks (binary, plugins, LSP, treesitter)
- `nvim-bootstrap` -- Full setup on new machine (binary + plugins + Mason + treesitter)
- `nvim-maintain` -- Orchestrator combining all above

Use `/nvim-maintain` in Claude Code to run these, or call scripts directly.
All scripts support `--check` (dry-run, default) and `-h` (help).
