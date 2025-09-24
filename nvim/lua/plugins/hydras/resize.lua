local Hydra = require('hydra')

Hydra({
  name = 'Resize Windows',
  mode = 'n',
  body = ' rs',
  heads = {
    { 'h', '<Cmd>vertical resize -1<CR>', { desc = 'Shrink height' } },
    { 'l', '<Cmd>vertical resize +1<CR>', { desc = 'Increase height' } },
    { 'j', '<Cmd>resize -1<CR>', { desc = 'Shrink width' } },
    { 'k', '<Cmd>resize +1<CR>', { desc = 'Increase width' } },
    { 'qq', nil, { exit = true, desc = 'Exit' } },
    { 'QQ', nil, { exit = true, desc = 'Exit' } },
  },
  config = {
    invoke_on_body = true,
  }
})
