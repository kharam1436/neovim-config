-- init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 최신 안정 버전 사용
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 옵션과 키맵을 먼저 로드
require("config.options")
require("config.keymaps")

-- 플러그인 로드 시작 (lua/plugins 폴더 스캔)
require("lazy").setup("plugins", {
  change_detection = { notify = false }, -- 변경 감지 알림 끄기
})