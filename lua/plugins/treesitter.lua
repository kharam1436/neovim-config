-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- 설치 후 파서 업데이트 실행
  config = function()
    require("nvim-treesitter.configs").setup({
      -- 파싱할 언어 목록
      ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "markdown" },
      sync_install = false,
      highlight = { enable = true }, -- 하이라이팅 활성화
      indent = { enable = true },    -- 들여쓰기 활성화
    })
  end,
}
