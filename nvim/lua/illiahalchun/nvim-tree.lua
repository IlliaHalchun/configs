
--- Github setup
local lib = require("nvim-tree.lib")

local git_add = function()
    local node = lib.get_node_at_cursor()
    local gs = node.git_status

    -- If the file is untracked, unstaged or partially staged, we stage it
    if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
        vim.cmd("silent !git add " .. node.absolute_path)

        -- If the file is staged, we unstage
    elseif gs == "M " or gs == "A " then
        vim.cmd("silent !git restore --staged " .. node.absolute_path)
    end

    lib.refresh_tree()
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "ga", action = "git_add", action_cb = git_add },
                { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
                { key = "<C-e>",                          action = "edit_in_place" },
                { key = "O",                              action = "edit_no_picker" },
                { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
                { key = "<C-v>",                          action = "vsplit" },
                { key = "<C-x>",                          action = "split" },
                { key = "t",                          action = "tabnew" },
                { key = "<",                              action = "prev_sibling" },
                { key = ">",                              action = "next_sibling" },
                { key = "P",                              action = "parent_node" },
                { key = "<BS>",                           action = "close_node" },
                { key = "<Tab>",                          action = "preview" },
                { key = "K",                              action = "first_sibling" },
                { key = "J",                              action = "last_sibling" },
                { key = "C",                              action = "toggle_git_clean" },
                { key = "G",                              action = "toggle_git_ignored" },
                { key = "H",                              action = "toggle_dotfiles" },
                { key = "B",                              action = "toggle_no_buffer" },
                { key = "U",                              action = "toggle_custom" },
                { key = "R",                              action = "refresh" },
                { key = "a",                              action = "create" },
                { key = "d",                              action = "trash" },
                { key = "r",                              action = "full_rename" },
                { key = "x",                              action = "cut" },
                { key = "y",                              action = "copy" },
                { key = "p",                              action = "paste" },
                { key = "c",                              action = "copy_name" },
                { key = "C",                              action = "copy_path" },
                { key = "gy",                             action = "copy_absolute_path" },
                { key = "[e",                             action = "prev_diag_item" },
                { key = "[c",                             action = "prev_git_item" },
                { key = "]e",                             action = "next_diag_item" },
                { key = "]c",                             action = "next_git_item" },
                { key = "-",                              action = "dir_up" },
                { key = "s",                              action = "system_open" },
                { key = "f",                              action = "live_filter" },
                { key = "F",                              action = "clear_live_filter" },
                { key = "q",                              action = "close" },
                { key = "W",                              action = "collapse_all" },
                { key = "E",                              action = "expand_all" },
                { key = "S",                              action = "search_node" },
                { key = ".",                              action = "run_file_command" },
                { key = "<C-k>",                          action = "toggle_file_info" },
                { key = "g?",                             action = "toggle_help" },
                { key = "m",                              action = "toggle_mark" },
                { key = "bmv",                            action = "bulk_move" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
