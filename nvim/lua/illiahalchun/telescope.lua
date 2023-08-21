local telescope = require('telescope');
local actions = require("telescope.actions");

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
    extensions = {
        coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        }
    }
});
