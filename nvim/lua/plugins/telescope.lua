local telescope = require('telescope');
local actions = require("telescope.actions");

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["qq"] = actions.close,
                ["t"] = actions.select_tab,
                ["o"] = actions.select_default,
            }
        }
    },
    extensions = {
        coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        }
    }
});

