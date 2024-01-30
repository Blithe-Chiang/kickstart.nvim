require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        -- use indent only HERE. to avoid treesitter error
        return {'treesitter', 'indent'}
        -- return {'indent'}
    end
})
