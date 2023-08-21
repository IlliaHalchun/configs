local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local lir = require 'lir'

local function get_selected_path()
end

local function open_in_tab()
    local ctx = require 'lir'.get_context()
    local path = ctx:current().fullpath

    if vim.fn.filereadable(path) == 1 then
        -- close lir interface before open new tab
        vim.cmd('quit')
        vim.cmd('tabnew ' .. path)
    else
        vim.api.nvim_err_writeln("Error occured: " .. path .. " is not a readable path")
    end
end

lir.setup {
    show_hidden_files = false,
    ignore = { "node_modules" },
    devicons = {
        enable = true,
        highlight_dirname = false
    },
    mappings = {
        ['o']     = actions.edit,
        ['l']     = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['t']     = open_in_tab,
        ['h']     = actions.up,
        ['q']     = actions.quit,

        ['m']     = actions.mkdir,
        ['a']     = actions.newfile,
        ['r']     = actions.rename,
        ['@']     = actions.cd,
        ['y']     = actions.yank_path,
        ['.']     = actions.toggle_show_hidden,
        ['d']     = actions.delete,

        ['i']     = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['c']     = clipboard_actions.copy,
        ['x']     = clipboard_actions.cut,
        ['p']     = clipboard_actions.paste,
    },
    float = {
        winblend = 0,
        curdir_window = {
            enable = false,
            highlight_dirname = false
        },
    },
    hide_cursor = true
}

vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { "lir" },
    callback = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
        )

        -- echo cwd
        vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
    end
})

-- custom folder icon
require 'nvim-web-devicons'.set_icon({
    lir_folder_icon = {
        icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
    }
})

require 'lir.git_status'.setup({
    show_ignored = false
})
