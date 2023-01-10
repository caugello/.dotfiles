local map = require('../utils').map
local opts = { noremap = true }
map('n', '<leader>aa', ':ArduinoAttach<cr>', opts)
map('n', '<leader>av', ':ArduinoVerify<cr>', opts)
map('n', '<leader>au', ':ArduinoUpload<cr>', opts)
map('n', '<leader>as', ':ArduinoUploadAndSerial<cr>', opts)
map('n', '<leader>ab', ':ArduinoChooseBoard<cr>', opts)
map('n', '<leader>ap', ':ArduinoChooseProgrammer<cr>', opts)

