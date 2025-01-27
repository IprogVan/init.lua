local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--ThePrimeagenMaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- LSP Keymaps
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- Debugging Keymap
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
map("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>")
map("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
map("n", "<leader>du", "<cmd>lua require('dap').step_out()<CR>")
map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")
map("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>")

-- Formatting
map("n", "<leader>f", "<cmd>FormatWrite<CR>")

-- Add at the bottom
local helpme = require("modules.helpme")
vim.api.nvim_create_user_command("Helpme", helpme.show_help, {})
