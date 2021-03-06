local cwd = vim.fn.getcwd()
local map = require('../utils').map
local projects_root_dir = string.format('%s/Dev/', os.getenv('HOME'))

local set_mappings = function(project)
  local project_dir = projects_root_dir .. project
  local setup = {
    ['cryptosnitch'] = {
      cmds = {
        {
          mapping = '<F9>',
          command = 'python -m unittest */**/test_*.py',
          autoclose = 0,
        },
      }
    },
    ['comet'] = {
      cmds = {
        {
          mapping = '<F9>',
          command = 'echo "Dispatched frontend tests" && ' ..
          'tmux send-keys -t comet:3.0 "npm run test-chrome-headless-no-sandbox" Enter',
          autoclose = 1,
        },
        {
          mapping = '<F10>',
          command = string.format('pushd %s/backend && tox -e py38', project_dir),
          autoclose = 0,
        }
      }
    },
  ['custom-waybar'] = {
      cmds = {
        {
          mapping = '<F9>',
          command = 'sass style.scss style.css',
          autoclose = 0,
        }
      }
    },
  ['system-setup'] = {
      cmds = {
        {
          mapping = '<F9>',
          command= 'docker build --rm -t system-setup .',
          autoclose = 0,
        }
      }
    }
  }
  if setup[project] ~= nil then
    local opts = { noremap = true }
    for i=1, #setup[project].cmds do
      map('n',
          setup[project].cmds[i].mapping,
          string.format(':FloatermNew --height=0.75 --width=0.75 --autoclose=%i %s<CR>', 
            setup[project].cmds[i].autoclose, setup[project].cmds[i].command),
          opts)
    end
  end
end

local regex = string.format('%s(.*)', projects_root_dir)
for name in string.gmatch(cwd, regex) do
  set_mappings(name)
end

