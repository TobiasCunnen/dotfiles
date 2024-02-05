-- Git command wrapper
return {
    -- TODO: Show fugitive as pop up window
    'tpope/vim-fugitive',
    keys = {
        { '<leader>g', '<cmd>G<cr>', desc = 'Fugitive' },
    },
}
