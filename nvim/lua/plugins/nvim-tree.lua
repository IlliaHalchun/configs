local view = require('nvim-tree.view')
local api = require('nvim-tree.api')
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open in new tab'))
    vim.keymap.set('n', '/', api.tree.search_node, opts('Search'))
    vim.keymap.set('n', '.', api.tree.toggle_hidden_filter , opts('Hidden files toggle'))
    vim.keymap.set('n', '<S-j>', function() vim.cmd("norm! 10j") end, opts('Move down 10 lines'))
    vim.keymap.set('n', '<S-k>', function() vim.cmd("norm! 10k") end, opts('Move up 10 lines'))
    vim.keymap.set('n', 'c', api.tree.collapse_all, opts('Collapse all'))
    vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand all'))
end

-- OR setup with some options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    view = {
        side = "right",
        width = 50
    },
    actions = {
        open_file = {
            resize_window = false
        }
    },
    git = {
        ignore = false
    },
    tab = {
        sync = {
            close = true
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = false,
                    color = true,
                },
            },
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Makefile", "README.md", "readme.md" },
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
})

-- save nvim-tree window width on WinResized event
augroup('save_nvim_tree_width', { clear = true })
autocmd('WinResized', {
  group = 'save_nvim_tree_width',
  pattern = '*',
  callback = function()
    local filetree_winnr = view.get_winnr()
    if filetree_winnr ~= nil and vim.tbl_contains(vim.v.event['windows'], filetree_winnr) then
      vim.t['filetree_width'] = vim.api.nvim_win_get_width(filetree_winnr)
    end
  end,
})

-- restore window size when openning nvim-tree
api.events.subscribe(api.events.Event.TreeOpen, function()
  if vim.t['filetree_width'] ~= nil then
    view.resize(vim.t['filetree_width'])
  end
end)

vim.keymap.set('n', '<leader>e', function()
  api.tree.find_file({ open = true, focus = true })
end)

-- Autoclose
local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function ()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true
})
