local has = vim.fn.has
local g = vim.g

g.is_win = (has('win32') or has('win64'))
g.is_linux = (has('unix') and not has('macunix'))
g.is_mac = has('macunix')
g.logging_level = 'info'

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0

g.did_install_default_menus = 0 -- 0 to load the default menu

if (vim.fn.executable("python --version"))
then
    if (is_win)
    then
        g.python3_host_prog = vim.fn.exepath('python')
    elseif (is_mac or is_linux)
    then
        g.python3_host_prog = vim.fn.exepath('python')
    end
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
g.mapleader = ' '

-- Enable lua highlighting inside vim script
g.vimsyn_embed = 'l'

-- Use filetype.lua instead of .vim
g.do_filetype_lua = 1
g.did_load_filetypes = 1

-- Choose not to load netrw by default
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.netrw_liststyle = 3
if (is_win)
then
    g.netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
end

-- Don't load these plugin by default
g.loaded_2html_plugin = 1

g.loaded_zipPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1

-- Do you need tutor?
g.loaded_tutor_mode_plugin = 1

-- We have vim-matchup, so don't need these
g.loaded_matchit = 1
g.loaded_matchparen = 1

-- Disable sql omni completion, since it's broken(maybe)
g.loaded_sql_completion = 1
