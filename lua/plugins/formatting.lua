-- lua/plugins/formatting.lua
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				-- 파이썬: isort로 임포트 정렬 후 black으로 스타일 교정
				python = { "isort", "black" },
				lua = { "stylua" },

				-- Kotlin, ruby, and markdown
				kotlin = { "ktlint", "ktfmt" },
				ruby = { "rubocop" },
				markdown = { "prettier" },

				-- Java formatters
				java = { "google-java-format" },
			},
			format_on_save = {
				lsp_fallback = true, -- 포맷터가 없으면 LSP 사용
				format_on_save = true,
				timeout_ms = 5000, -- 5000ms 내에 완료 안 되면 포기 (멈춤 방지)
			},
		})
	end,
}
