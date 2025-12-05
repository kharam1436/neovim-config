-- lua/plugins/debug.lua
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",        -- UI 의존성
    "mfussenegger/nvim-dap-python", -- 파이썬 전용 설정 도우미
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- 디버깅 시작/종료 시 자동으로 UI 열기/닫기
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Mason으로 설치된 debugpy 경로 지정
    local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)

    -- 디버깅 키 매핑
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: 시작/계속" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: 단계 건너뛰기" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: 단계 진입" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: 중단점 설정" })
  end,
}
