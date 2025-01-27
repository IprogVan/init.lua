-- lua/plugins/helpme.lua
local M = {}

local help_text = [[
# Neovim Cheat Sheet

## General Keymaps
| Key                     | Mode | Description                          |
|-------------------------|------|--------------------------------------|
| `<leader>pv`            | n    | Open file explorer                   |
| `<C-c>`                 | i    | Exit insert mode                     |
| `J` (Visual)            | v    | Move selection down                  |
| `K` (Visual)            | v    | Move selection up                    |
| `<leader>p`             | x    | Paste without overwriting clipboard  |
| `<leader>y`/`<leader>Y` | n/v  | Yank to system clipboard             |
| `<leader>d`             | n/v  | Delete without overwriting clipboard |

## LSP Keymaps
| Key          | Description                          |
|--------------|--------------------------------------|
| `gd`         | Go to definition                     |
| `gr`         | Show references                      |
| `K`          | Hover documentation                  |
| `<leader>rn` | Rename symbol                        |
| `<leader>ca` | Code actions                         |

## Debugging Keymaps
| Key          | Description                          |
|--------------|--------------------------------------|
| `<leader>db` | Toggle breakpoint                    |
| `<leader>dc` | Start/continue debugging             |
| `<leader>do` | Step over                            |
| `<leader>di` | Step into                            |
| `<leader>du` | Step out                             |
| `<leader>dr` | Open REPL                            |
| `<leader>dt` | Toggle debug UI                      |

## Formatting
| Key         | Description                          |
|-------------|--------------------------------------|
| `<leader>f` | Format current buffer                |


## Git (Fugitive) Keymaps
| Key          | Mode | Description                          |
|--------------|------|--------------------------------------|
| `<leader>gs` | n    | Open Fugitive status                 |
| `gf`         | n    | Take left diff (//2)                 |
| `cj`         | n    | Take right diff (//3)                |

### Fugitive Buffer Keymaps (when Git status open)
| Key          | Description                          |
|--------------|--------------------------------------|
| `<leader>p`  | Git push                             |
| `<leader>P`  | Git pull --rebase                    |
| `<leader>t`  | Set upstream branch                  |

## Telescope Keymaps
| Key          | Description                          |
|--------------|--------------------------------------|
| `<leader>pf` | Find files in project                |
| `<C-p>`      | Search git-tracked files             |
| `<leader>pws`| Grep current word under cursor       |
| `<leader>pWs`| Grep current WORD under cursor       |
| `<leader>ps` | Interactive grep search              |
| `<leader>vh` | Search help tags

]]

function M.show_help()
  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(buf, "cheatsheet")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(help_text, "\n"))

  -- Open in a split window
  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, buf)

  -- Set buffer options
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].modifiable = false
end

return M
