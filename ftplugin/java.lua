--local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--local workspace_dir = '.workspace' .. project_name
---- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--local config = {
--  -- The command that starts the language server
--  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--  cmd = {

--    'java',

--    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--    '-Dosgi.bundles.defaultStartLevel=4',
--    '-Declipse.product=org.eclipse.jdt.ls.core.product',
--    '-Dlog.protocol=true',
--    '-Dlog.level=ALL',
--    '-Xms1g',
--    '--add-modules=ALL-SYSTEM',
--    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--    '-jar', '/opt/homebrew/Cellar/jdtls/1.18.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--    '-configuration', '/opt/homebrew/Cellar/jdtls/1.18.0/libexec/config_mac',
--    -- 💀
--    -- See `data directory configuration` section in the README
--    '-data', workspace_dir
--  },

--  -- 💀
--  -- This is the default if not provided, you can remove it. Or adjust as needed.
--  -- One dedicated LSP server & client will be started per unique root_dir
--  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--  -- root_dir = require('jdtls.setup').find_root({'.'}),

--  -- Here you can configure eclipse.jdt.ls specific settings
--  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--  -- for a list of options
--  settings = {
--    java = {
--    }
--  },

--  -- Language server `initializationOptions`
--  -- You need to extend the `bundles` with paths to jar files
--  -- if you want to use additional eclipse.jdt.ls plugins.
--  --
--  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--  --
--  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--  init_options = {
--    bundles = {}
--  },
--}
--require('jdtls').start_or_attach(config)


-- vim.o.signcolumn = yes
vim.keymap.set("n","<leader>r", "<cmd>vsp<CR> :terminal javar Main<CR>")
vim.keymap.set("n","<leader>R", "<cmd>WakaTimeDebugEnable<CR> :vsp<CR> :terminal javad Main<CR>")
vim.keymap.set("n","<leader>d","<cmd>WakaTimeDebugEnable<CR>")
vim.keymap.set("n","<leader>d", "<cmd>WakaTimeDebugDisable<CR>")
