return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp", -- 자동 완성 기능을 LSP에 알리기 위함
	},
	config = function()
		-- 1. Mason 설정
		require("mason").setup()

		-- 2. Capabilities 정의 (자동 완성을 위해 필요)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 3. Mason-LSPConfig 및 서버 설정
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"html",
				"cssls",
				"kotlin_language_server", -- Kotlin
				"jdtls", -- Java
				"ts_ls", -- TypeScript/JavaScript
				"marksman", -- Markdown
				"bashls", -- Bash
			}, -- 자동 설치할 서버 목록
			handlers = {
				-- 기본 핸들러: 모든 서버에 공통 설정 적용
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Lua 서버 전용 설정 (Neovim API 인식을 위해)
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } }, -- 'vim' 전역 변수 경고 무시
							},
						},
					})
				end,
			},
		})

		-- 4. LSP 관련 키 매핑 (LSP가 연결되었을 때만 작동)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- 정의로 이동
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- 호버 문서 보기
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 변수명 변경 (Refactoring)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- 코드 액션
			end,
		})
	end,
}
