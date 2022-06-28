-- Some utility stuff
require('utils')

-- plugin installation
require('plugins')

if (not vim.fn.has('nvim-0.7.0'))
then
    print('Latest Nvim is required, maybe the nvim or configuration need a update')
end

local core_conf_files = {
    'globals',
    'options',
    -- 'autocommands',
    'mappings',
    -- 'plugins',
    -- 'themes'
}

for i, fname in pairs(core_conf_files) do
    require('core/'..fname)
end
