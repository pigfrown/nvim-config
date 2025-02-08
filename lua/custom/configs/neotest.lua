local neotest = require 'neotest'

neotest.setup {
  icons = {
    passed = '🎉',
    running = '⏳',
    failed = '😭',
    skipped = '➖',
    unknown = '❓',
  },
  adapters = {
    require 'neotest-jest' {
      jestCommand = 'npm test --',
      jestConfigFile = 'jest.config.ts',
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    },
  },
}

vim.keymap.set('n', '<leader>tt', function()
  neotest.run.run()
end, { desc = 'Run [T]ests selected' })

vim.keymap.set('n', '<leader>ta', function()
  neotest.run.run { suite = true }
end, { desc = 'Run [A] tests' })

vim.keymap.set('n', '<leader>tl', function()
  neotest.run.run_last()
end, { desc = 'Run [L]ast Test' })

vim.keymap.set('n', '<leader>tD', function()
  neotest.run.run_last { strategy = 'dap', suite = false }
end, { desc = '[D]ebug Last Test' })

vim.keymap.set('n', '<leader>tw', function()
  neotest.run.run { jestCommand = 'npx jest --watch', suite = false }
end, { desc = '[W]atch tests' })
