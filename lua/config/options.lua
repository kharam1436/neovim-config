local opt = vim.opt

-- 라인 넘버 설정
opt.number = true         -- 절대 라인 넘버 표시
opt.relativenumber = true -- 상대 라인 넘버 표시 (점프 시 계산 용이)

-- 들여쓰기 설정 (탭 대신 스페이스 4칸 사용)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 검색 설정
opt.ignorecase = true -- 검색 시 대소문자 무시
opt.smartcase = true  -- 단, 대문자가 포함되면 대소문자 구분
opt.hlsearch = true   -- 검색어 하이라이팅

-- UI 및 성능
opt.termguicolors = true      -- 24비트 트루 컬러 지원
opt.scrolloff = 8             -- 커서 위/아래로 8줄의 여유 공간 확보 (시야 확보)
opt.signcolumn = "yes"        -- 에러 아이콘 표시열 항상 유지 (텍스트 밀림 방지)
opt.updatetime = 50           -- 반응 속도 향상 (기본값 4000ms는 너무 느림)
opt.clipboard = "unnamedplus" -- 시스템 클립보드와 통합

-- 분할 창 동작
opt.splitright = true -- 세로 분할 시 오른쪽에 생성
opt.splitbelow = true -- 가로 분할 시 아래쪽에 생성
