-- lua/config/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- 파일 저장 및 종료
map("n", "<leader>w", ":w<CR>", { desc = "파일 저장" })
map("n", "<leader>q", ":q<CR>", { desc = "종료" })

-- 검색 하이라이트 제거 (Esc 키로)
map("n", "<Esc>", ":nohlsearch<CR>")

-- 창 간 이동 편의성 (Ctrl + hjkl)
-- 기본 <C-w>h 등은 두 손을 써야 하므로 비효율적임
map("n", "<C-h>", "<C-w>h", { desc = "왼쪽 창으로 이동" })
map("n", "<C-j>", "<C-w>j", { desc = "아래 창으로 이동" })
map("n", "<C-k>", "<C-w>k", { desc = "위쪽 창으로 이동" })
map("n", "<C-l>", "<C-w>l", { desc = "오른쪽 창으로 이동" })

-- 비주얼 모드에서 들여쓰기 후 선택 영역 유지
map("v", "<", "<gv", { desc = "들여쓰기 감소" })
map("v", ">", ">gv", { desc = "들여쓰기 증가" })
