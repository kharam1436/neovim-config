return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		-- Setup nvim-autopairs
		autopairs.setup({
			check_ts = true, -- Enable treesitter integration
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		-- Integrate with nvim-cmp for proper Enter key handling
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Shift+Enter: Exit bracket context and create new line below
		vim.keymap.set("i", "<S-CR>", "<Esc>A<CR>", {
			desc = "Exit bracket and new line below",
			noremap = true,
			silent = true,
		})
	end,
}
