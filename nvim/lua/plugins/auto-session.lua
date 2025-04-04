vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require('auto-session').setup({
     use_git_branch = true,
     session_lens = {
      load_on_setup = true,
      previewer = false,
      mappings = {
        delete_session = { "n", "d" },
        alternate_session = { "n", "o" },
        copy_session = { "n", "y" },
      },
      -- Can also set some Telescope picker options
      -- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
      theme_conf = {
        border = true,
      },
    },
});
