require("dapui").setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup {
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  clear_on_continue = false,
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == "inline" then
      return " = " .. variable.value
    else
      return variable.name .. " = " .. variable.value
    end
  end,
  virt_text_pos = vim.fn.has "nvim-0.10" == 1 and "inline" or "eol",

  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
}

local dap, dapui = require "dap", require "dapui"
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.continue, {})
vim.keymap.set("n", "<leader>dx", dap.close, {})
vim.keymap.set("n", "<leader>dr", dap.restart_frame, {})
vim.keymap.set("n", "<leader>dsO", dap.step_over, {})
vim.keymap.set("n", "<leader>dsi", dap.step_into, {})
vim.keymap.set("n", "<leader>dso", dap.step_out, {})

-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
