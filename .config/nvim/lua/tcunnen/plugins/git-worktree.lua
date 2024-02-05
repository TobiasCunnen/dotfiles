-- Wrapper for git worktree operations
return {
    'ThePrimeagen/git-worktree.nvim',
    dependency = {
    },
    dependencies = {
        'nvim-lua/popup.nvim'
    },
    config = function ()
        require('git-worktree').setup({

        })

        require("telescope").load_extension("git_worktree")

        vim.keymap.set('n', '<leader>ct', ':Telescope git_worktree create_git_worktree<cr>', { desc = 'Telescope [C]reate git work [T]ree' })
        vim.keymap.set('n', '<leader>st', ':Telescope git_worktree git_worktrees<cr>', { desc = 'Telescope [S]witch git work [T]ree' })
    end
}
