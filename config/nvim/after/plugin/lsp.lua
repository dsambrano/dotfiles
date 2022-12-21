local ok, lsp = pcall(require, 'lsp-zero')

if not ok then
	print("LSP-Zero not installed")
end


lsp.preset('recommended')
-- Still need to find a way to auto install my preferred ones, but here is a start.
-- nvim --headless -c "MasonInstall lua-language-server rust-analyzer" -c qall
-- vim.cmd("MasonInstall black pydocstyle")
lsp.ensure_installed({
	-- "black",
        -- "pydocstyle",
	"pyright",
    "html",
    "cssls",
	"rust_analyzer",
	"sumneko_lua",
})
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "awesome" }
            }
        }
    }
})
lsp.use("pyright", {
	settings = {
		python = {
			analysis = {
				extraPaths = { "~/.config/nvim/env/bin/python3"},
			}
		}
	}
})
-- From: https://youtu.be/w7i4amO_zaE?t=1158
-- Saved so that I can easly change them in the future as needed for more info see,
--    https://github.com/ThePrimeagen/init.lua/blob/master/after/plugin/lsp.lua#L12

-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
-- 
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })
-- 
-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })
-- 
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
