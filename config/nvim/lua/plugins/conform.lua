return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			local disable_filetypes = {}
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				--	lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang_format" },

			-- run multiple formatters sequentially
			python = { "isort", "black" },

			-- run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
