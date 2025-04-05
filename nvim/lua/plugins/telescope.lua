local telescope = require('telescope');
local actions = require("telescope.actions");
local actions_set = require("telescope.actions.set");

local function ten_times_down(prompt_bufnr)
    actions_set.shift_selection(prompt_bufnr, 10);
end

local function ten_times_up(prompt_bufnr)
    actions_set.shift_selection(prompt_bufnr, -10);
end

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["qq"] = actions.close,
                ["t"] = actions.select_tab,
                ["o"] = actions.select_default,
                ["x"] = actions.select_horizontal,
                ["y"] = actions.select_vertical,
                ["<S-j>"] = ten_times_down,
                ["<S-k>"] = ten_times_up
            }
        }
    },
    extensions = {
        coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
        fzf = {}
    }
});

telescope.load_extension("fzf");
